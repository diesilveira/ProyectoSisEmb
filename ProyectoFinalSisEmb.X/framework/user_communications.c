
/* Section: Included Files                                                    */

#include <stdint.h>
#include <stdbool.h>
#include "../platform/serial_port_manager.h"
#include "../platform/SIM808.h"
#include "GPS.h"
#include "../crash_manager.h"
#include "../mcc_generated_files/pin_manager.h"
#include "Accelerometer/Accelerometer.h"
#include "user_communications.h"
#include "../platform/buttons.h"
#include "utils.h"
#include "../mcc_generated_files/rtcc.h"

/* This section lists the other files that are included in this file.

/* Section: File Scope or Global Data                                         */

static uint8_t p_dest[110];

static bool isPdestSet = false;

uint8_t levelBrusco = 0;
uint8_t levelChoque = 0;

uint8_t patronManejoActual = 2;

TickType_t delayLogger = 10000;

//logger_struct_t logger[250];

static SemaphoreHandle_t xSemaphoreLeds;
static SemaphoreHandle_t xSemaphoreP_Dest;

// Section: Local Functions                                                   */

static void imprimirMenu(void) {
    sendDataChar((char*) "\nMenú:\n");
    sendDataChar((char*) "1- Setear umbrales\n");
    sendDataChar((char*) "2- Pedir una trama\n");
    sendDataChar((char*) "3- Descargar Logs\n");
}

void mainMenu(void) {
    //Seteamos valores iniciales a utilizar
    static bool receivedData = false;
    static uint8_t numBytes = 0;
    static uint8_t buffer[64];

    static bool isFinish = false;

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
                    sendDataChar((char*) "Luego envíe cualquier cosa por serial.\n");
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
                    sendDataChar((char*) "Luego envíe cualquier cosa por serial.\n");
                    receivedData = false;
                    while (!receivedData) {
                        setUmbral(levelBrusco, 8);
                        numBytes = receiveData(&receivedData, buffer, sizeof (buffer));
                    }
                    levelChoque = getLevelValue();
                    apagaLeds();
                    sendDataChar((char*) "Nivel de choque seteado con exito.\n");
                    sendDataChar((char*) "Envíe cualquier cosa por serial para volver al menu principal.\n\n");
                    isFinish = true;
                    break;
                case '2':;
                    sendDataChar((char*) "llama al gps");

                    while (!isPdestSet) {
                        sendDataChar((char*) "Esperando trama valida.\n");
                    }
                    sendDataChar((char*) "tiene una trama\n");
                    GPSPosition_t p_pos;
                    GPS_getPosition(&p_pos, p_dest);
                    uint8_t p_linkDest[64];
                    GPS_generateGoogleMaps(p_linkDest, p_pos);
                    sendDataChar((char*) p_linkDest);
                    isFinish = true;
                    sendDataChar((char*) "TERMINE\n");
                    break;
                case '3':
                    //llama descargar los logs
                    isFinish = true;
                    break;
                default:
                    isFinish = true;
                    break;
            }
        }
    }
}

// Section: Interface Functions   */

void mainComunicationTask(void *params) {
    xSemaphoreLeds = xSemaphoreCreateBinary();
    xSemaphoreGive(xSemaphoreLeds);
    float moduloAccel = 0;
    TickType_t xDelay = 166;
    while (true) {
        if (BTN2_GetValue()) {
            apagaLeds();
            imprimirMenu();
            mainMenu();
            sendDataChar((char*) "VOLVI\n");
        }

        while (!ACCEL_Mod(&moduloAccel)) {
        }
        //el 3 por coso brusco y el 5 por coso de choque
        if ((moduloAccel >= 3) && (moduloAccel < 5)) {
            patronManejoActual = 0;
            if (xSemaphoreTake(xSemaphoreLeds, 0) == pdTRUE) {
                for (int i = 0; i <= 2; i++) {
                    setLeds(5);
                    //        que prenda buzzer
                    vTaskDelay(xDelay);
                    apagaLeds();
                    //         apaga buzzer
                    vTaskDelay(xDelay);
                }
                xSemaphoreGive(xSemaphoreLeds);
            }

            // el 5 hay que cambiarlo por coso de choque
        } else if (moduloAccel >= 5) {
            patronManejoActual = 1;
            if (xSemaphoreTake(xSemaphoreLeds, 0) == pdTRUE) {
                for (int i = 0; i <= 2; i++) {
                    setLeds(1);
                    //        que prenda buzzer
                    vTaskDelay(xDelay);
                    apagaLeds();
                    //         apaga buzzer
                    vTaskDelay(xDelay);
                }
                xSemaphoreGive(xSemaphoreLeds);
            }


        } else {
            patronManejoActual = 2;
            if (xSemaphoreTake(xSemaphoreLeds, 0) == pdTRUE) {
                setLeds(3);
                xSemaphoreGive(xSemaphoreLeds);
            }

        }

    }
}

//void loggerFunction(void *params) {
//    int idNumber = 0;
//    while (true) {
//        for (int i = 0; i < 250; i++) {
//            vTaskDelay(delayLogger);
//            logger[i].id = idNumber;
//            //            logger[i].milliseconds = RTCTIME
//            logger[i].patronManejo = patronManejoActual;
//            idNumber++;
//        }
//    }
//}


// Va a necesitar de statics
// del patron de manejo y posicion
// También hay que tener una que sea
// el último ID para poder irlo registrando
//void loggearDatos(void) {
//    struct logger_struct_t log;
//    ID = ID++;
//    log.id           = ID; // esta hay que declarar
//    log.milliseconds = getUnixTime(); // hay que cambiar el tipo en el struct a uint32_t
//    log.patronManejo = patronManejoActual;
//    log.position     = position; // esta hay que declarar
//    
//    // Si ya tengo 250 registros, reseteo indice
//    // y comienzo a rellenar el más antiguo
//    if (loggerIndex == 249) {
//        loggerIndex = 0;
//    }
//    // Relleno la posición con el log.
//    logger[loggerIndex] = log;
//}

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

//        if (!isPdestSet) {
//            struct tm timeToSet = {0};
//            GPS_getUTC(&timeToSet, p_dest_local);
//            //Manual de usuario aclarar que va en UTC, no en hora Uruguay
//            RTCC_TimeSet(&timeToSet);
//        }

        isPdestSet = true;
    }
}

/* *****************************************************************************
 End of File
 */