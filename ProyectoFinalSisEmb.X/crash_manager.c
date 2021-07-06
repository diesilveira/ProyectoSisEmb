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
void prendeLeds(uint8_t adc);
uint8_t getLevelValue(void);

/** 
  @Function
    int ExampleInterfaceFunctionName ( int param1, int param2 ) 

  @Summary
    Brief one-line description of the function.

  @Remarks
    Refer to the example_file.h interface header for function usage details.
 */

void setUmbral(uint8_t number) {
    number++;
        if (adc_value < 128 && number < 2) {
            levelValue = 1;
            prendeLeds(1);
        } else if (adc_value < 256 && number < 3) {
            levelValue = 2;
            prendeLeds(2);
        } else if (adc_value < 384 && number < 4) {
            prendeLeds(3);
            levelValue = 3;
        } else if (adc_value < 512 && number < 5) {
            prendeLeds(4);
            levelValue = 4;
        } else if (adc_value < 640 && number < 6) {
            prendeLeds(5);
            levelValue = 5;
        } else if (adc_value < 768 && number < 7) {
            prendeLeds(6);
            levelValue = 6;
        } else if (adc_value < 896 && number < 8) {
            prendeLeds(7);
            levelValue = 7;
        } else {
            prendeLeds(8);
            levelValue = 8;
        }

}

uint8_t getLevelValue(void){
    return levelValue;
}

void apagaLeds(void) {
    ws2812_t leds[8];
    WS2812_initializeLedArray(leds, 8);
    WS2812_send(leds, 8);
}

void prendeLeds(uint8_t adc) {
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