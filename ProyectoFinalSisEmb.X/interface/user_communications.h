
/* Section: Included Files                                                    */

#include "../framework/GPS/GPS.h"
#include "../freeRTOS/include/FreeRTOS.h"
#include "../freeRTOS/include/semphr.h"

extern SemaphoreHandle_t xSemaphoreLogger;



/* Section: Interface Functions  */
    
    void getTrama(uint8_t trama[256]);

    void generateTrama(void *params);
    
    void mainComunicationTask(void *params);
    
    void loggerFunction(void *params);
    

/* *****************************************************************************
 End of File
 */
