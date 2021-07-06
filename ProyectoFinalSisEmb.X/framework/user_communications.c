/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.c

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */
#include <stdint.h>
#include <stdbool.h>
#include "../platform/serial_port_manager.h"
#include "../platform/SIM808.h"
#include "GPS.h"
#include "../crash_manager.h"
/* This section lists the other files that are included in this file.
 */

/* TODO:  Include other files here if needed. */


/* ************************************************************************** */
/* ************************************************************************** */
/* Section: File Scope or Global Data                                         */
/* ************************************************************************** */
/* ************************************************************************** */

/*  A brief description of a section can be given directly below the section
    banner.
 */

/* ************************************************************************** */
/** Descriptive Data Item Name

  @Summary
    Brief one-line summary of the data item.
    
  @Description
    Full description, explaining the purpose and usage of data item.
    <p>
    Additional description in consecutive paragraphs separated by HTML 
    paragraph breaks, as necessary.
    <p>
    Type "JavaDoc" in the "How Do I?" IDE toolbar for more information on tags.
    
  @Remarks
    Any additional remarks
 */
int global_data;
static uint8_t p_dest[256];
static bool isPdestSet = false;

uint8_t levelBrusco = 0;
uint8_t levelChoque = 0;


/* ************************************************************************** */
/* ************************************************************************** */
// Section: Local Functions                                                   */
/* ************************************************************************** */

/* ************************************************************************** */
void imprimirMenu(void) {

    sendDataChar((char*) "\nMenú:\n");
    sendDataChar((char*) "1- Setear umbrales\n");
    sendDataChar((char*) "2- Pedir una trama\n");
    sendDataChar((char*) "3- Descargar Logs\n");
}
/*  A brief description of a section can be given directly below the section
    banner.
 */

/* ************************************************************************** */

/** 
  @Function
    int ExampleLocalFunctionName ( int param1, int param2 ) 

  @Summary
    Brief one-line description of the function.

  @Description
    Full description, explaining the purpose and usage of the function.
    <p>
    Additional description in consecutive paragraphs separated by HTML 
    paragraph breaks, as necessary.
    <p>
    Type "JavaDoc" in the "How Do I?" IDE toolbar for more information on tags.

  @Precondition
    List and describe any required preconditions. If there are no preconditions,
    enter "None."

  @Parameters
    @param param1 Describe the first parameter to the function.
    
    @param param2 Describe the second parameter to the function.

  @Returns
    List (if feasible) and describe the return values of the function.
    <ul>
      <li>1   Indicates an error occurred
      <li>0   Indicates an error did not occur
    </ul>

  @Remarks
    Describe any special behavior not described above.
    <p>
    Any additional remarks.

  @Example
    @code
    if(ExampleFunctionName(1, 2) == 0)
    {
        return 3;
    }
 */
static int ExampleLocalFunction(int param1, int param2) {
    return 0;
}


/* ************************************************************************** */
/* ************************************************************************** */
// Section: Interface Functions                                               */
/* ************************************************************************** */
/* ************************************************************************** */

/*  A brief description of a section can be given directly below the section
    banner.
 */

// *****************************************************************************

/** 
  @Function
    int ExampleInterfaceFunctionName ( int param1, int param2 ) 

  @Summary
    Brief one-line description of the function.

  @Remarks
    Refer to the example_file.h interface header for function usage details.
 */


void initializeMenu(void *params) {
    //Seteamos valores iniciales a utilizar
    static bool receivedData = false;
    static uint8_t numBytes = 0;
    static uint8_t buffer[64];

    //Esperamos a recibir cualquier letra, una vez recibida pasamos 
    //al siguiente estado e imprimimos la bienvenida.
    while (true) {
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
                        sendDataChar((char*) "Elija nivel de conduccion brusca.\n");
                        receivedData = false;
                        while (!receivedData){
                            setUmbral(1);
                            numBytes = receiveData(&receivedData, buffer, sizeof (buffer));
                        }
                        levelBrusco = getLevelValue();
                        apagaLeds();
                        
                        sendDataChar((char*) "Elija nivel de choque.\n");
                        receivedData = false;
                        while (!receivedData){
                            setUmbral(levelBrusco);
                            numBytes = receiveData(&receivedData, buffer, sizeof (buffer));
                            
                        }
                        levelChoque = getLevelValue();
                        apagaLeds();
                        
                        break;
                    case '2':;
                        sendDataChar((char*) "llama al gps");
                        
                        while (!isPdestSet){
                            sendDataChar((char*) "Esperando trama valida.\n");
                        }
                        sendDataChar((char*) "tiene una trama\n");
                        GPSPosition_t p_pos;
                        GPS_getPosition(&p_pos, p_dest);
                        uint8_t p_linkDest[64];
                        GPS_generateGoogleMaps(p_linkDest, p_pos);
                        sendDataChar((char*) p_linkDest);


                        break;
                    case '3':
                        //llama descargar los logs
                        break;
                    default:



                        break;
                }
            }
        }

    }
}

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
