
/* Section: Included Files                                                    */

#include "GPS.h"

/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif

/* Section: Interface Functions  */
    
    void getTrama(uint8_t trama[256]);

    void generateTrama(void *params);
    
    void mainComunicationTask(void *params);
    
    void loggerFunction(void *params);
    

    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif


/* *****************************************************************************
 End of File
 */
