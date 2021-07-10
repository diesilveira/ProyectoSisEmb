/*
 
 
 
 
 */
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include "mcc_generated_files/rtcc.h"
/*
 Utils Section for time functions 
 */

uint32_t getUnixTime(void) {
    struct tm currentTime;
    static time_t epoch;
    // Cargo el tiempo actual a currentTime
    memset( (uint8_t*) &currentTime, 0, sizeof(currentTime) );
    RTCC_TimeGet(&currentTime);
    // Lo paso a epoch de unix
    epoch = mktime(&currentTime);
    return (uint32_t)epoch;
}

void unixTo(uint32_t epoch, char *buffer) {
    // Convierte un epoch de unix
    // a un string legible
    
    struct tm tm_info;
    memset( (uint8_t*) &tm_info, 0, sizeof(tm_info) );
    memcpy(&tm_info, (gmtime(&epoch)), sizeof (struct tm));
    strftime(buffer, 30, "%a %Y-%m-%d %H:%M:%S %Z", &tm_info);

}