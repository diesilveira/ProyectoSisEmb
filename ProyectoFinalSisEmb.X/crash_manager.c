
/* Section: Included Files                                                    */

#include <stdint.h>
#include <stdbool.h>
#include "WS2812.h"
#include "framework/Analog/Analog.h"

#include "freeRTOS/include/FreeRTOS.h"
#include "freeRTOS/include/task.h"
#include "FreeRTOSConfig.h"

#include "freeRTOS/include/semphr.h"

#include <unistd.h>

static uint16_t adc_value = 0;
static uint8_t umbral_manejo_brusco;
static uint8_t umbral_choque;
static uint8_t levelValue = 0;

// Section: Local Functions                                                   */

void prendeLedsSetearUmbrales(uint8_t adc);
uint8_t getLevelValue(void);

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
