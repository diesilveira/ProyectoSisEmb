/**
  Section: Included Files
 */

#include "../mcc_generated_files/usb/usb_device_cdc.h"
#include "serial_port_manager.h"
#include "FreeRTOS.h"
#include "../freeRTOS/include/semphr.h"

/**
  Section: Interface Functions
 */

uint8_t receiveData(bool* receivedData, uint8_t* buffer, uint8_t bufferSize) {
    uint8_t numBytes = 0;

    if ((USBGetDeviceState() < CONFIGURED_STATE) ||
            (USBIsDeviceSuspended() == true)) {
        //Either the device is not configured or we are suspended,
        // so we don't want to execute any USB related application code
        //continue; //go back to the top of the while loop
    } else {
        //Otherwise we are free to run USB and non-USB related user 
        //application code.
        CDCTxService();
        numBytes = getsUSBUSART(buffer, bufferSize); //until the buffer is free.
    }
    *receivedData = (numBytes > 0);
    return numBytes;
}

/*-----------------------------------------------------------*/

void sendData(uint8_t* buffer, uint8_t numBytes) {
    if ((USBGetDeviceState() < CONFIGURED_STATE) ||
            (USBIsDeviceSuspended() == true)) {
        //Either the device is not configured or we are suspended,
        // so we don't want to execute any USB related application code
        //continue; //go back to the top of the while loop
    } else {
        //Otherwise we are free to run USB and non-USB related user 
        //application code.
        CDCTxService();
        if (numBytes > 0) {
            //we received numBytes bytes of data and they are copied into
            //  the "buffer" variable.  We can do something with the data
            //  here.
            if (USBUSARTIsTxTrfReady()) {
                putUSBUSART(buffer, numBytes);
            }
            while (!USBUSARTIsTxTrfReady()) {
                CDCTxService();
            }
        }
    }
}

/*-----------------------------------------------------------*/

void sendDataChar(char* data) {
    if ((USBGetDeviceState() < CONFIGURED_STATE) ||
            (USBIsDeviceSuspended() == true)) {
        //Either the device is not configured or we are suspended,
        // so we don't want to execute any USB related application code
        //continue; //go back to the top of the while loop
    } else {
        //Otherwise we are free to run USB and non-USB related user 
        //application code.
        if (USBUSARTIsTxTrfReady()) {
            CDCTxService();
            putsUSBUSART(data);
        }
        while (!USBUSARTIsTxTrfReady()) {
            CDCTxService();
        }
    }
}

/**
 End of File
 */