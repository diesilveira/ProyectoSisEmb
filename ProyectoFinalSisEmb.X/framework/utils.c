/*
 
 
 
 
 */
#include <stdbool.h>
#include "../mcc_generated_files/rtcc.h"
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
/*
 Utils Section for time functions 
 */

uint32_t getUnixTime(void) {
    struct tm currentTime;
    // Cargo el tiempo actual a currentTime
    RTCC_TimeGet(&currentTime);
    // Lo paso a epoch de unix
    time_t epoch = mktime(&currentTime);
    return (uint32_t)epoch;
}

void unixTo(unsigned long epoch, char *buffer) {
    // Convierte un epoch de unix
    // a un string legible
    struct tm tm_info;
    memcpy(&tm_info, (localtime(&epoch)), sizeof (struct tm));
    strftime(buffer, 30, "%a %Y-%m-%d %H:%M:%S %Z", &tm_info);

}