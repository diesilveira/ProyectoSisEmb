/*
 
 
 
 
 */
#include <stdbool.h>

#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
/*
 Utils Section for time functions 
 */

//bool RTCC_BCDTimeSet(struct tm initialTime){
//    return true;
//}


uint32_t getUnixTime(void) {
    struct tm currentTime;
    // Cargo el tiempo actual a currentTime
    RTCC_TimeGet(&currentTime);
    // Lo paso a epoch de unix
    time_t epoch = mktime(&currentTime);
    return (uint32_t)epoch;
}

void unixTo(uint32_t epoch, char *buffer) {
    // Convierte un epoch de unix
    // a un string legible
    struct tm tm_info;
    memcpy(&tm_info, gmtime(&epoch), sizeof (struct tm));
    strftime(buffer, 80, "%a %Y-%m-%d %H:%M:%S", &tm_info);

}