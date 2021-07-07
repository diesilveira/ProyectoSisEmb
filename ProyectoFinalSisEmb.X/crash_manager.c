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
#include "WS2812.h"
#include "framework/Analog/Analog.h"

#include "freeRTOS/include/FreeRTOS.h"
#include "freeRTOS/include/task.h"
#include "FreeRTOSConfig.h"

#include "freeRTOS/include/semphr.h"

#include <unistd.h>
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

static uint16_t adc_value = 0;
static uint8_t umbral_manejo_brusco;
static uint8_t umbral_choque;
static uint8_t levelValue = 0;






/* ************************************************************************** */
/* ************************************************************************** */
// Section: Local Functions                                                   */
/* ************************************************************************** */
/* ************************************************************************** */

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
void prendeLedsSetearUmbrales(uint8_t adc);
uint8_t getLevelValue(void);

/** 
  @Function
    int ExampleInterfaceFunctionName ( int param1, int param2 ) 

  @Summary
    Brief one-line description of the function.

  @Remarks
    Refer to the example_file.h interface header for function usage details.
 */

void setUmbral(uint8_t levelMin, uint8_t levelMax) {
    levelMin++;
    if (adc_value < 128 && levelMin < 2) {
        levelValue = 1;
        prendeLedsSetearUmbrales(1);
    } else if ((adc_value < 256 && levelMin < 3) || levelMax == 2) {
        levelValue = 2;
        prendeLedsSetearUmbrales(2);
    } else if ((adc_value < 384 && levelMin < 4) || levelMax == 3) {
        prendeLedsSetearUmbrales(3);
        levelValue = 3;
    } else if ((adc_value < 512 && levelMin < 5) || levelMax == 4) {
        prendeLedsSetearUmbrales(4);
        levelValue = 4;
    } else if ((adc_value < 640 && levelMin < 6) || levelMax == 5) {
        prendeLedsSetearUmbrales(5);
        levelValue = 5;
    } else if ((adc_value < 768 && levelMin < 7) || levelMax == 6) {
        prendeLedsSetearUmbrales(6);
        levelValue = 6;
    } else if ((adc_value < 896 && levelMin < 8) || levelMax == 7) {
        prendeLedsSetearUmbrales(7);
        levelValue = 7;
    } else {
        prendeLedsSetearUmbrales(8);
        levelValue = 8;
    }

}

uint8_t getLevelValue(void) {
    return levelValue;
}

void apagaLeds(void) {
    ws2812_t leds[8];
    WS2812_initializeLedArray(leds, 8);
    WS2812_send(leds, 8);
}

/*
 Tipo de alerta corresponde a Amarila o Roja siendo estas 0 y 1 respectivamente.
 */

void setLeds(uint8_t color) {
    ws2812_t leds[8];
    for (int i = 0; i < 8; i++) {
        WS2812_setLEDColor(leds, color, i);
    }

    WS2812_send(leds, 8);
}

void prendeLedsSetearUmbrales(uint8_t adc) {
    ws2812_t leds[8];
    WS2812_initializeLedArray(leds, 8);
    int ledPrendido = 2;
    int ledApagado = 4;

    for (int i = 0; i < 8; i++) {
        if (i < adc) {
            WS2812_setLEDColor(leds, ledPrendido, i);
        } else {
            WS2812_setLEDColor(leds, ledApagado, i);
        }
    }
    WS2812_send(leds, 8);
}

void getADC(void *params) {
    while (true) {
        adc_value = ANALOG_getResult();
    }
}

/* *****************************************************************************
 End of File
 */
