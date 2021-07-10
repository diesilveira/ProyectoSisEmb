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

/* This section lists the other files that are included in this file.
 */
#include "../../freeRTOS/include/FreeRTOS.h"
#include"../../freeRTOS/include/projdefs.h"
#include"../../freeRTOS/include/task.h"

#include "Analog.h"
#include <stdbool.h>
#include "../../mcc_generated_files/adc1.h"

/* Section: File Scope or Global Data                                         */


static uint16_t conversionResult;

void ANALOG_convert(void *p_param) {
    while (1) {
        ADC1_ChannelSelect(channel_POT);
        ADC1_SoftwareTriggerEnable();
        //ADC1_Start();
        vTaskDelay(pdMS_TO_TICKS(5));
        ADC1_SoftwareTriggerDisable();
        //ADC1_Stop();
        while (!ADC1_IsConversionComplete(channel_POT)) {
            ADC1_Tasks();
            vTaskDelay(pdMS_TO_TICKS(20));
        }
        conversionResult = ADC1_ConversionResultGet(channel_POT);
    }
}

uint16_t ANALOG_getResult(void) {
    return conversionResult;
}


/* *****************************************************************************
 End of File
 */
