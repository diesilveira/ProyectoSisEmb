
/* Section: Included Files                                                    */

#include "../framework/GPS/GPS.h"
#include "../freeRTOS/include/FreeRTOS.h"
#include "../freeRTOS/include/semphr.h"

extern SemaphoreHandle_t xSemaphoreLogger;
extern SemaphoreHandle_t xSemaphorePlot;

#define  WHITE    0
#define  RED      1
#define  BLUE     2
#define  GREEN    3
#define  OFF      4
#define  YELLOW   5



/* Section: Interface Functions  */
    
    void getTrama(uint8_t trama[256]);

    void generateTrama(void *params);
    
    void mainComunicationTask(void *params);
    
    void loggerFunction(void *params);
    

/* *****************************************************************************
 End of File
 */
