
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
#include "../freeRTOS/include/FreeRTOS.h"
#include "../freeRTOS/include/task.h"

/* This section lists the other files that are included in this file.

/* Section: File Scope or Global Data                                         */

static uint8_t p_dest[110];

static bool isPdestSet = false;

static uint8_t levelBrusco = 3;
static uint8_t levelChoque = 6;

static uint8_t patronManejoActual = NORMAL;

TickType_t delayLogger = 1000;

static logger_struct_t logger[250];

static uint32_t idNumber = 0;
static uint8_t loggerCount = 0;
static bool receivedData = false;
static uint8_t numBytes = 0;
static uint8_t buffer[1];

static float moduloAccel = 0;
static TickType_t xDelayLedsAlertas = 166;
static uint8_t bufferTimeLog[4];

SemaphoreHandle_t xSemaphoreLogger;
SemaphoreHandle_t xSemaphorePlot;

static bool isFinish = false;

static SemaphoreHandle_t xSemaphoreLeds;
static char strId[80]; // usada para imprimir el id por serial

static TaskHandle_t handleAnalog;

// Section: Local Functions                                                   */

static void imprimirMenu(void) {
    sendDataChar((char*) "\nMenú:\n");
    sendDataChar((char*) "1- Setear umbrales\n");
    sendDataChar((char*) "2- Configurar período del log\n");
    sendDataChar((char*) "3- Descargar Logs\n");
}

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

static void saveLog(void) {
    if (isPdestSet) {
        GPSPosition_t p_pos;
        if (xSemaphoreTake(xSemaphorePlot, 100) == pdTRUE) {
            GPS_getPosition(&p_pos, p_dest);
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

static void mainMenu(void) {
    //Seteamos valores iniciales a utilizar
    receivedData = false;
    numBytes = 0;

    isFinish = false;

    while (!isFinish) {
        //Esperamos a recibir cualquier letra, una vez recibida pasamos 
        //al siguiente estado e imprimimos la bienvenida.
        numBytes = receiveData(&receivedData, buffer, sizeof (buffer));
        do {
            numBytes = receiveData(&receivedData, buffer, sizeof (buffer));
        } while (!receivedData);

        if (receivedData) {
            switch (buffer[0]) {
                case '1':
                    xTaskCreate(ANALOG_convert, "adcConvert", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY + 3, &handleAnalog);
                    sendDataChar((char*) "Nivel de conduccion brusca.\n");
                    sendDataChar((char*) "Use la ruedita para elegir.\n");
                    sendDataChar((char*) "Luego envíe cualquier cosa por serial.\n");
                    receivedData = false;
                    while (!receivedData) {
                        setUmbral(1, 7);
                        numBytes = receiveData(&receivedData, buffer, sizeof (buffer));
                    }
                    levelBrusco = getLevelValue();
                    setLeds(OFF);
                    sendDataChar((char*) "Nivel de conduccion Brusca seteado con exito.\n\n");
                    sendDataChar((char*) "Nivel de choque.\n");
                    sendDataChar((char*) "Use la ruedita para elegir.\n");
                    sendDataChar((char*) "Luego envíe cualquier cosa por serial.\n");
                    receivedData = false;
                    while (!receivedData) {
                        setUmbral(levelBrusco, 8);
                        numBytes = receiveData(&receivedData, buffer, sizeof (buffer));
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
                p_dest[i] = p_dest_local[i];
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