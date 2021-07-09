/* ************************************************************************** */
/** GPS

  @Company
    Ucudal

  @File Name
    GPS.c

  @Summary
    Contains the structures and functions to obtain information from GPS frames obtained via SIM808 module
 */
/* ************************************************************************** */

/*******************************************************************************/
/************************* INCLUDED FILES **************************************/
/*******************************************************************************/
#include "GPS.h"
#include <string.h>
#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
/*******************************************************************************/
/************************* LOCAL VARIABLES *************************************/
/*******************************************************************************/


/*******************************************************************************/
/************************* INTERFACE FUNCTIONS *********************************/
/*******************************************************************************/

/**
    @Function
        void GPS_getPosition( GPSPosition_t* pos, uint8_t *sentence )      
      
    @Summary
        Fills the position structure with information from the GPS frame received.
   
    @Remarks
        String must start with +CGNSINF: 
 **/

void substring(char str[], char sub[], int pos, int len) {
   int c = 0;
   
   while (c < len) {
      sub[c] = str[pos+c-1];
      c++;
   }
   sub[c] = '\0';
}

void GPS_getPosition(GPSPosition_t *p_pos, uint8_t *p_sentence) {
    uint8_t offset;
//    uint8_t *ptr;

    offset = GPS_RMC_RUN_LEN + GPS_RMC_COMMA_LEN + GPS_RMC_FIX_LEN + GPS_RMC_COMMA_LEN + GPS_RMC_UTC_LEN + GPS_RMC_COMMA_LEN + GPS_RMC_CGNSINF_LEN;
//    p_pos->latitude = strtod((p_sentence + offset), &ptr);
//    p_pos->longitude = strtod((ptr + GPS_RMC_COMMA_LEN), &ptr);
    
    substring(p_sentence, p_pos->latitude, (offset + 1), 10);
    substring(p_sentence, p_pos->longitude, (offset + 10 + GPS_RMC_COMMA_LEN + 1), 10);
}



/**
    @Function
        void GPS_getUTC( struct tm *p_newtime, uint8_t *p_sentence )      
      
    @Summary
        Fills the time structure with TIME information from the GPS frame received.

    @Remarks
        String must start with +CGNSINF: 
 **/
void GPS_getUTC(struct tm *p_newtime, uint8_t *p_sentence) {
    uint8_t offset;
    uint8_t temp_str[5];

    offset = GPS_RMC_RUN_LEN + GPS_RMC_COMMA_LEN + GPS_RMC_FIX_LEN + GPS_RMC_COMMA_LEN + GPS_RMC_CGNSINF_LEN;
    // Copy Year YYYY
    memset(temp_str, 0, 5);
    strncpy(temp_str, (p_sentence + offset), 4);
    p_newtime->tm_year = atoi(temp_str) - 1900;
    offset += 4;
    // Copy Month MM
    memset(temp_str, 0, 5);
    strncpy(temp_str, (p_sentence + offset), 2);
    p_newtime->tm_mon = atoi(temp_str) - 1;
    offset += 2;
    // Copy Day DD
    memset(temp_str, 0, 5);
    strncpy(temp_str, (p_sentence + offset), 2);
    p_newtime->tm_mday = atoi(temp_str);
    offset += 2;
    // Copy Hour HH
    memset(temp_str, 0, 5);
    strncpy(temp_str, (p_sentence + offset), 2);
    p_newtime->tm_hour = atoi(temp_str);
    offset += 2;
    // Copy Minutes MM
    memset(temp_str, 0, 5);
    strncpy(temp_str, (p_sentence + offset), 2);
    p_newtime->tm_min = atoi(temp_str);
    offset += 2;
    // Copy Seconds SS
    memset(temp_str, 0, 5);
    strncpy(temp_str, (p_sentence + offset), 2);
    p_newtime->tm_sec = atoi(temp_str);
}

/**
    @Function
        double GPS_getGroundDistance( GPSPosition_t *a, GPSPosition_t *b )     
      
    @Summary
        Calculates ground distance(in km) between to geographical points. (Uses spherical earth model)

    @Remarks
        None
 **/
double GPS_getGroundDistance(GPSPosition_t *a, GPSPosition_t *b) {
//    double angle;
//    double lat_a, lon_a, lat_b, lon_b;
//
//    lat_a = a->latitude * M_PI / 180;
//    lon_a = a->longitude * M_PI / 180;
//    lat_b = b->latitude * M_PI / 180;
//    lon_b = b->longitude * M_PI / 180;
//
//    angle = sqrt(cos(lat_a) * cos(lat_b) * pow(sin((lon_a - lon_b) / 2), 2) + pow(sin((lat_a - lat_b) / 2), 2));
//    angle = 2 * asin(angle);

    return 0;
}

void GPS_generateGoogleMaps(uint8_t *p_linkDest, GPSPosition_t *p_gpsData) {
//static char latitude[10];
//static char longitude[10];    
//    strcpy(latitude, p_gpsData->latitude);
//    strcpy(longitude, p_gpsData->longitude);
    
    
    strcpy(p_linkDest, "http://maps.google.com/?q=");
//    sprintf(latitude, "%f", p_gpsData.latitude);
    strcat(p_linkDest, p_gpsData->latitude);
    strcat(p_linkDest, ",");
//    sprintf(longitude, "%f", p_gpsData.longitude);
    strcat(p_linkDest, p_gpsData->longitude);
}

/*
        EOF
 */