
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

/* This section lists the other files that are included in this file.

/* Section: File Scope or Global Data                                         */

static uint8_t p_dest[256];
static bool isPdestSet = false;

uint8_t levelBrusco = 0;
uint8_t levelChoque = 0;

uint8_t patronManejoActual = 2;

TickType_t delayLogger = 10000;

//logger_struct_t logger[250];

static SemaphoreHandle_t xSemaphoreLeds;
static SemaphoreHandle_t xSemaphoreDeEjecucion;


// Section: Local Functions                                                   */

void imprimirMenu(void) {

    sendDataChar((char*) "\nMenú:\n");
    sendDataChar((char*) "1- Setear umbrales\n");
    sendDataChar((char*) "2- Pedir una trama\n");
    sendDataChar((char*) "3- Descargar Logs\n");
}


// Section: Interface Functions                                               */

void initializeMenu(void) {
    //Seteamos valores iniciales a utilizar
    static bool receivedData = false;
    static uint8_t numBytes = 0;
    static uint8_t buffer[64];

    bool isFinish = false;

    while (!isFinish) {
        //Esperamos a recibir cualquier letra, una vez recibida pasamos 
        //al siguiente estado e imprimimos la bienvenida.
        numBytes = receiveData(&receivedData, buffer, sizeof (buffer));
        if (receivedData) {
            imprimirMenu();
            receivedData = false;
            numBytes = 0;

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
                        break;
                    case '3':
                        //llama descargar los logs
                        isFinish = true;
                        break;
                    default:

                        break;
                }
            }
        }
    }
}

void getAccelerometer(void *params) {
    xSemaphoreLeds = xSemaphoreCreateBinary();
    xSemaphoreGive(xSemaphoreLeds);
    float moduloAccel = 0;
    TickType_t xDelay = 166;
    while (true) {
        if (BTN2_GetValue()) {
            apagaLeds();
            initializeMenu();
        } else {

            while (!ACCEL_Mod(&moduloAccel)) {
            }

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
}

//void tareaPrincipal(void *params) {
//    //    xSemaphoreDeEjecucion = xSemaphoreCreateBinary();
//    //    xSemaphoreGive(xSemaphoreDeEjecucion);
//    // if boton S2 tomar semaforo y llamar a funcion del menu
//    //else llamar a get accelerometer
//    while (true) {
//        if (!BTN2_GetValue()) {
//            //            if (xSemaphoreTake(xSemaphoreDeEjecucion, 0) == pdTRUE) {
//            getAccelerometer();
//            //            xSemaphoreGive(xSemaphoreDeEjecucion);
//            //            }
//
//        } else {
//            //            if (xSemaphoreTake(xSemaphoreDeEjecucion, 0) == pdTRUE) {
//            apagaLeds();
//            initializeMenu();
//            //                xSemaphoreGive(xSemaphoreDeEjecucion);
//            //            }
//        }
//    }
//}


//
//void loggerFunction(void *params) {
//    int idNumber = 0;
//    while (true) {
//        for (int i = 0; i < 250; i++) {
//            vTaskDelay(delayLogger);
//            logger[i].id = idNumber;
//            //            logger[i].milliseconds = RTCTIME
//            logger[i].patronManejo = patronManejoActual;
//        }
//    }
//}

void generateTrama(void *params) {
    uint8_t p_dest_local[110];
    while (true) {
        SIM808_getNMEA(p_dest_local);
        while (!SIM808_validateNMEAFrame(p_dest_local)) {
            SIM808_getNMEA(p_dest_local);
        }

        for (int i = 0; i < 98; i++) {
            p_dest[i] = p_dest_local[i];
        }
        isPdestSet = true;
    }
}

/* *****************************************************************************
 End of File
 */