
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

#define LEVEL_BRUSCO_INICIAL 3
#define LEVEL_CHOQUE_INICIAL 6

#define DELAY_LOGGER_INICIAL 10000
#define LOGGER_SIZE 250



/* Section: Interface Functions  */
    
    void getTrama(uint8_t trama[256]);

    void generateTrama(void *params);
    
    void mainComunicationTask(void *params);
    
    void loggerFunction(void *params);
    

/* *****************************************************************************
 End of File
 */
