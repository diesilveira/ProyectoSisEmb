
/* Section: Included Files                                                    */

#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>

#include "crash_manager.h"
#include "user_communications.h"
#include "../framework/Analog/Analog.h"
#include "../utils.h"
#include "../framework/GPS/GPS.h"
#include "../framework/Accelerometer/Accelerometer.h"
#include "../mcc_generated_files/pin_manager.h"
#include "../mcc_generated_files/rtcc.h"
#include "../platform/SERIAL_PORT_MANAGER/serial_port_manager.h"
#include "../platform/SIM808/SIM808.h"
#include "../platform/BUTTONS/buttons.h"

/* Kernel includes. */
#include "../freeRTOS/include/FreeRTOS.h"
#include "../freeRTOS/include/task.h"

/* Section: File Scope or Global Data                                         */

/*
 Variables utilizadas para el setteo de la ultima trama del GPS
 */
static uint8_t globalPlot[110];
static bool isPdestSet = false;

/*
 Variables utilizadas para el setteo de los umbrales de manejo
 inicialmente en 3 y 6 respectivamente.
 
 Acorde a los valores obtenidos en la practica del acelerómetro
 los mismos van de 0 a 10.879854, siendo a partir de 8.00 dificiles de alcanzar
 por lo cual decidimos que los mismos se settearan del 1 al 8 acorde a los leds
 mostrados.
 */
static uint8_t levelBrusco = LEVEL_BRUSCO_INICIAL;
static uint8_t levelChoque = LEVEL_CHOQUE_INICIAL;

/*
 Patrón de manejo global, la misma se actualiza con el acelerómetro
 */
static uint8_t patronManejoActual = NORMAL;

/*
 delay para el loggueo continuo
 */
TickType_t delayLogger = DELAY_LOGGER_INICIAL;
static logger_struct_t logger[LOGGER_SIZE];
static uint32_t idNumber = 0;       //id para el loggueo
static uint8_t loggerCount = 0;     //lleva la cuenta de 0 a 249

/*
 Transferencia de data por el serial
 */
static bool receivedData = false;   //true si se recibió algo por serial
static uint8_t numBytes = 0;        //cantidad recibida por serial
static uint8_t menuBuffer[1];       //buffer utilizado para el menú 
static uint8_t bufferTimeLog[4];    //utilizada para settear el periodo de loggueo

static float moduloAccel = 0;       //modulo del acelerómetro actual, se actualiza a partir de getAccel.
static TickType_t xDelayLedsAlertas = 166;  //Delay utilizado para prender y apagar los leds

/*
 Semáforos usados para el control de los registros y de la trama, estos se declaran extern en el .h
 Luego se inicializan en el main(), y son utilizados por varias tareas
 */
SemaphoreHandle_t xSemaphoreLogger;
SemaphoreHandle_t xSemaphorePlot;
/*
 Semaforo usado para encender los leds en las alertas, la diferencia es que este se usa solo en una tarea
 */
static SemaphoreHandle_t xSemaphoreLeds;

/*
 En el momento que isFinish es true, es porque termino la accion en el menú, y saldra solo
 */
static bool isFinish = false;   

static char strId[80]; // usada para imprimir el id por serial

/*
 Este handler lo usamos para crear y eliminar la tarea del Conversor solo cuando 
 la misma se utiliza, de este modo hacemos un uso mas eficiente del procesador.
 */
static TaskHandle_t handleAnalog;

// Section: Local Functions                                                   */
/*
 Imprime por serial las opciones iniciales del menú.
 */
static void imprimirMenu(void) {
    sendDataChar((char*) "\nMenú:\n");
    sendDataChar((char*) "1- Settear umbrales.\n");
    sendDataChar((char*) "2- Configurar período del log.\n");
    sendDataChar((char*) "3- Descargar Logs.\n");
}

/*
 Recorre el log uno por uno y los imprime siguiendo el siguiente formato
 | N° de ID | FECHA Y HORA EN UTC | link a GoogleMaps de la ubicacion | TIPO DE CONDUCCIÓN
 */
void imprimirLogger(void) {
    sendDataChar((char*) "\n");
    static char bufferToTimeLog[30]; // usada para imprimir time por serial
    static uint8_t p_linkDest[64];
    for (int i = 0; i < loggerCount; i++) {
        sprintf(strId, "%u", logger[i].id);
        sendDataChar((char*) strId);
        sendDataChar((char*) " | ");
        unixTo((logger[i].seconds), bufferToTimeLog);
        sendDataChar((char*) bufferToTimeLog);
        sendDataChar((char*) " | ");
        GPS_generateGoogleMaps(p_linkDest, &logger[i].position);
        sendDataChar((char*) p_linkDest);
        sendDataChar((char*) " | ");
        if (logger[i].patronManejo == NORMAL) {
            sendDataChar((char*) "NORMAL");
        } else if (logger[i].patronManejo == BRUSCO) {
            sendDataChar((char*) "BRUSCO");
        } else {
            sendDataChar((char*) "CHOQUE");
        }
        sendDataChar((char*) "\n");
        vTaskDelay(50);
    }
}

/*
 Se encarga de guardar los registros del log
 */
static void saveLog(void) {
    if (isPdestSet) {       //si ya se obtuvo al menos una trama, sino no tiene sentido
        GPSPosition_t p_pos;
        if (xSemaphoreTake(xSemaphorePlot, 100) == pdTRUE) {
            GPS_getPosition(&p_pos, globalPlot);
            xSemaphoreGive(xSemaphorePlot);
        }
        logger[loggerCount].id = idNumber;
        logger[loggerCount].seconds = getUnixTime();
        logger[loggerCount].patronManejo = patronManejoActual;
        logger[loggerCount].position = p_pos;

        idNumber++;

        if (loggerCount == 249) {
            loggerCount = 0;
        } else {
            loggerCount++;
        }
    }
}

/*
 Se encarga de dirigir la accion del logguer, ya se sea escribirlo o imprimirlo,
 lo cual lo recibe por parametro (accion)
 */

static void loggerManager(uint8_t accion) {
    switch (accion) {
        case ESCRIBIR:
            saveLog();
            break;
        case IMPRIMIR:
            imprimirLogger();
            break;
    }
}

/*
 Menú de interaccion con el usuario
 */
static void mainMenu(void) {
    //Seteamos valores iniciales a utilizar
    receivedData = false;
    numBytes = 0;
    isFinish = false;

    while (!isFinish) {
        //Esperamos a recibir cualquier letra
        numBytes = receiveData(&receivedData, menuBuffer, sizeof (menuBuffer));
        do {
            numBytes = receiveData(&receivedData, menuBuffer, sizeof (menuBuffer));
        } while (!receivedData);

        if (receivedData) {
            switch (menuBuffer[0]) {
                case '1':
                    // a la tarea analogConver como solo se va a ejecutar mientras
                    // setteamos los umbrales le damos prioridad alta
                    // para que la interaccion sea mas fluida
                    xTaskCreate(ANALOG_convert, "analogConvert", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY + 3, &handleAnalog);
                    sendDataChar((char*) "Seleccion de umbral de conduccion BRUSCA:\n");
                    sendDataChar((char*) "Use la ruedita para elegir.\n");
                    sendDataChar((char*) "Luego envíe cualquier cosa por serial.\n");
                    
                    receivedData = false;
                    while (!receivedData) {
                        setUmbral(1, 7);
                        numBytes = receiveData(&receivedData, menuBuffer, sizeof (menuBuffer));
                    }
                    levelBrusco = getLevelValue();
                    setLeds(OFF);
                    sendDataChar((char*) "Nivel de conduccion Brusca seteado con exito.\n\n");
                    sendDataChar((char*) "Seleccion de umbral de CHOQUE:\n");
                    sendDataChar((char*) "Use la ruedita para elegir.\n");
                    sendDataChar((char*) "Luego envíe cualquier cosa por serial.\n");
                    
                    receivedData = false;
                    while (!receivedData) {
                        setUmbral(levelBrusco, 8);
                        numBytes = receiveData(&receivedData, menuBuffer, sizeof (menuBuffer));
                    }
                    levelChoque = getLevelValue();
                    setLeds(OFF);
                    sendDataChar((char*) "Nivel de choque seteado con exito.\n");
                    sendDataChar((char*) "Envíe cualquier cosa por serial para volver al menu principal.\n\n");
                    vTaskDelete(handleAnalog);
                    isFinish = true;
                    break;
                case '2':;
                    sendDataChar((char*) "Periodo de Log configurable:\n");
                    sendDataChar((char*) "Envíe por serial en segundos de 000 a 999 (3 dígitos).\n");

                    receivedData = false;
                    while (!receivedData) {
                        numBytes = receiveData(&receivedData, bufferTimeLog, sizeof (bufferTimeLog));
                    }
                    bufferTimeLog[4] = '\0';
                    TickType_t delayLogger = (TickType_t) (atoi(&bufferTimeLog[0]) * 1000);
                    
                    isFinish = true;
                    break;
                case '3':
                    if (xSemaphoreTake(xSemaphoreLogger, 1000) == pdTRUE) {
                        loggerManager(IMPRIMIR);
                        xSemaphoreGive(xSemaphoreLogger);
                    }

                    isFinish = true;
                    break;
                default:
                    sendDataChar((char*) "Valor incorrecto.\n");
                    isFinish = true;
                    break;
            }
        }
    }
}

// Section: Interface Functions   */

void mainComunicationTask(void *params) {
    //    SemaphoreHandle_t xSemaphoreLogger = (SemaphoreHandle_t) *params;
    xSemaphoreLeds = xSemaphoreCreateBinary();
    xSemaphoreGive(xSemaphoreLeds);

    while (true) {
        if (BTN2_GetValue()) {
            setLeds(OFF);
            imprimirMenu();
            mainMenu();
            sendDataChar((char*) "\nPresiona S2 para volver al Menú. GRACIAS!!\n");
        }

        while (!ACCEL_Mod(&moduloAccel)) {
        }

        if ((moduloAccel >= levelBrusco) && (moduloAccel < levelChoque)) {
            if (xSemaphoreTake(xSemaphoreLeds, 100) == pdTRUE) {
                patronManejoActual = BRUSCO;
                if (xSemaphoreTake(xSemaphoreLogger, 10) == pdTRUE) {
                    loggerManager(ESCRIBIR);
                    xSemaphoreGive(xSemaphoreLogger);
                }
                for (int i = 0; i <= 2; i++) {
                    setLeds(YELLOW);
                    //        que prenda buzzer
                    vTaskDelay(xDelayLedsAlertas);
                    setLeds(OFF);
                    //         apaga buzzer
                    vTaskDelay(xDelayLedsAlertas);
                }
                xSemaphoreGive(xSemaphoreLeds);
            }
        } else if (moduloAccel >= levelChoque) {
            if (xSemaphoreTake(xSemaphoreLeds, 100) == pdTRUE) {
                
                patronManejoActual = CHOQUE;
                if (xSemaphoreTake(xSemaphoreLogger, 10) == pdTRUE) {
                    loggerManager(ESCRIBIR);
                    xSemaphoreGive(xSemaphoreLogger);
                }
                for (int i = 0; i <= 2; i++) {
                    setLeds(RED);
                    //        que prenda buzzer
                    vTaskDelay(xDelayLedsAlertas);
                    setLeds(OFF);
                    //         apaga buzzer
                    vTaskDelay(xDelayLedsAlertas);
                }
                xSemaphoreGive(xSemaphoreLeds);
            }
        } else {

            if (xSemaphoreTake(xSemaphoreLeds, 0) == pdTRUE) {
                patronManejoActual = NORMAL;
                setLeds(GREEN);
                xSemaphoreGive(xSemaphoreLeds);
            }
        }
    }
}

void loggerFunction(void *params) {
    while (true) {
        vTaskDelay(delayLogger);
        if (xSemaphoreTake(xSemaphoreLogger, 100) == pdTRUE) {
            loggerManager(ESCRIBIR);
            xSemaphoreGive(xSemaphoreLogger);
        }

    }
}

void generateTrama(void *params) {
    static uint8_t p_dest_local[110];
    while (true) {
        SIM808_getNMEA(p_dest_local);
        while (!SIM808_validateNMEAFrame(p_dest_local)) {
            SIM808_getNMEA(p_dest_local);
        }

        if (xSemaphoreTake(xSemaphorePlot, 100) == pdTRUE) {
            for (int i = 0; i < 98; i++) {
                globalPlot[i] = p_dest_local[i];
            }
            
            xSemaphoreGive(xSemaphorePlot);
        }


        if (!isPdestSet) {
            struct tm timeToSet = {0};
            GPS_getUTC(&timeToSet, p_dest_local);
            //Manual de usuario aclarar que va en UTC, no en hora Uruguay
            RTCC_TimeSet(&timeToSet);
        }
        isPdestSet = true;
        vTaskDelay(delayLogger);
    }
}

/* *****************************************************************************
 End of File
 */