
/* Section: Included Files                                                    */

#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>

#include "crash_manager.h"
#include "user_communications.h"
#include "../utils.h"
#include "../framework/GPS/GPS.h"
#include "../framework/Accelerometer/Accelerometer.h"
#include "../mcc_generated_files/pin_manager.h"
#include "../mcc_generated_files/rtcc.h"
#include "../platform/SERIAL_PORT_MANAGER/serial_port_manager.h"
#include "../platform/SIM808/SIM808.h"
#include "../platform/BUTTONS/buttons.h"

/* This section lists the other files that are included in this file.

/* Section: File Scope or Global Data                                         */

static uint8_t p_dest[110];

static bool isPdestSet = false;

static uint8_t levelBrusco = 3;
static uint8_t levelChoque = 6;

static uint8_t patronManejoActual = NORMAL;

TickType_t delayLogger = 2000;

static logger_struct_t logger[250];

static uint8_t idNumber = 0;
static uint8_t loggerCount = 0;
static bool receivedData = false;
static uint8_t numBytes = 0;
static uint8_t buffer[1];

static float moduloAccel = 0;
static TickType_t xDelayLedsAlertas = 166;
static uint8_t bufferTimeLog[4];

SemaphoreHandle_t xSemaphoreLogger;

static bool isFinish = false;

static SemaphoreHandle_t xSemaphoreLeds;
static char strId[80]; // usada para imprimir el id por serial

// Section: Local Functions                                                   */

static void imprimirMenu(void) {
    sendDataChar((char*) "\nMen�:\n");
    sendDataChar((char*) "1- Setear umbrales\n");
    sendDataChar((char*) "2- Configurar per�odo del log\n");
    sendDataChar((char*) "3- Descargar Logs\n");
}

void imprimirLogger(void) {
    sendDataChar((char*) "\n");
    static char bufferToTimeLog[30]; // usada para imprimir time por serial
    static uint8_t p_linkDest[64];
    for (int i = 0; i < loggerCount; i++) {

        sprintf(strId, "%i", logger[i].id);
        sendDataChar((char*) strId);

        sendDataChar((char*) " | ");
//        memset(buffer, '0', sizeof (bufferToTimeLog));
        
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

static void saveLog(void){
    if (isPdestSet) {
            GPSPosition_t p_pos;
            GPS_getPosition(&p_pos, p_dest);

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
    switch (accion){
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
                    sendDataChar((char*) "Nivel de conduccion brusca.\n");
                    sendDataChar((char*) "Use la ruedita para elegir.\n");
                    sendDataChar((char*) "Luego env�e cualquier cosa por serial.\n");
                    receivedData = false;
                    while (!receivedData) {
                        setUmbral(1, 7);
                        numBytes = receiveData(&receivedData, buffer, sizeof (buffer));
                    }
                    levelBrusco = getLevelValue();
                    apagaLeds();
                    sendDataChar((char*) "Nivel de conduccion Brusca seteado con exito.\n\n");
                    sendDataChar((char*) "Nivel de choque.\n");
                    sendDataChar((char*) "Use la ruedita para elegir.\n");
                    sendDataChar((char*) "Luego env�e cualquier cosa por serial.\n");
                    receivedData = false;
                    while (!receivedData) {
                        setUmbral(levelBrusco, 8);
                        numBytes = receiveData(&receivedData, buffer, sizeof (buffer));
                    }
                    levelChoque = getLevelValue();
                    apagaLeds();
                    sendDataChar((char*) "Nivel de choque seteado con exito.\n");
                    sendDataChar((char*) "Env�e cualquier cosa por serial para volver al menu principal.\n\n");
                    isFinish = true;
                    break;
                case '2':;
                    sendDataChar((char*) "Periodo de Log configurable:.\n");
                    sendDataChar((char*) "Env�e por serial en segundos de 0 a 999.\n");

                    receivedData = false;
                    while (!receivedData) {
                        numBytes = receiveData(&receivedData, bufferTimeLog, sizeof (buffer));
                    }
                    bufferTimeLog[4] = '\0';
                    TickType_t delayLogger = (TickType_t) (atoi(&bufferTimeLog[0]) * 1000);


//                    sendDataChar((char*) "llama al gps");
//
//                    while (!isPdestSet) {
//                        sendDataChar((char*) "Esperando trama valida.\n");
//                    }
//                    sendDataChar((char*) "tiene una trama\n");
//                    GPSPosition_t p_pos;
//                    GPS_getPosition(&p_pos, p_dest);
//                    static uint8_t p_linkDest[64];
//                    GPS_generateGoogleMaps(p_linkDest, &p_pos);
//                    sendDataChar((char*) p_linkDest);
//                    sendDataChar((char*) "\n");
//                    static char buffer[30];
//
//                    unixTo(getUnixTime(), &buffer);
//                    sendDataChar((char*) buffer);

                    isFinish = true;

                    break;
                case '3':
                    if (xSemaphoreTake(xSemaphoreLogger, 10) == pdTRUE) {
                        loggerManager(IMPRIMIR);
                        xSemaphoreGive(xSemaphoreLogger);
                    }

                    isFinish = true;
                    break;
                default:
                    sendDataChar((char*) "Ingrese un numero correcto.\n");
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
            apagaLeds();
            imprimirMenu();
            mainMenu();
            sendDataChar((char*) "\nPresiona S2 para volver al Men�. GRACIAS!!\n");
        }

        while (!ACCEL_Mod(&moduloAccel)) {
        }

        if ((moduloAccel >= levelBrusco) && (moduloAccel < levelChoque)) {

            if (xSemaphoreTake(xSemaphoreLeds, 0) == pdTRUE) {
                patronManejoActual = BRUSCO;
                if (xSemaphoreTake(xSemaphoreLogger, 10) == pdTRUE) {
                    loggerManager(ESCRIBIR);
                    xSemaphoreGive(xSemaphoreLogger);
                }
                for (int i = 0; i <= 2; i++) {
                    setLeds(5);
                    //        que prenda buzzer
                    vTaskDelay(xDelayLedsAlertas);
                    apagaLeds();
                    //         apaga buzzer
                    vTaskDelay(xDelayLedsAlertas);
                }
                xSemaphoreGive(xSemaphoreLeds);
            }
        } else if (moduloAccel >= levelChoque) {
            if (xSemaphoreTake(xSemaphoreLeds, 0) == pdTRUE) {
                patronManejoActual = CHOQUE;
                if (xSemaphoreTake(xSemaphoreLogger, 10) == pdTRUE) {
                    loggerManager(ESCRIBIR);
                    xSemaphoreGive(xSemaphoreLogger);
                }
                for (int i = 0; i <= 2; i++) {
                    setLeds(1);
                    //        que prenda buzzer
                    vTaskDelay(xDelayLedsAlertas);
                    apagaLeds();
                    //         apaga buzzer
                    vTaskDelay(xDelayLedsAlertas);
                }
                xSemaphoreGive(xSemaphoreLeds);
            }
        } else {

            if (xSemaphoreTake(xSemaphoreLeds, 0) == pdTRUE) {
                patronManejoActual = NORMAL;
                setLeds(3);
                xSemaphoreGive(xSemaphoreLeds);
            }
        }
    }
}

void loggerFunction(void *params) {
    while (true) {
        vTaskDelay(delayLogger);
        if (xSemaphoreTake(xSemaphoreLogger, 10) == pdTRUE) {
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

        for (int i = 0; i < 98; i++) {
            p_dest[i] = p_dest_local[i];
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