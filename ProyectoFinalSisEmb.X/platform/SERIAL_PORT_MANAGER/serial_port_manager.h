#ifndef _SERIAL_PORT_MANAGER_H    /* Guard against multiple inclusion */
#define _SERIAL_PORT_MANAGER_H

uint8_t receiveData(bool* receivedData, uint8_t* buffer, uint8_t bufferSize);

void sendData(uint8_t* buffer, uint8_t numBytes);

void receiveAndSendData();

void sendDataChar(char* data);

#endif /* _SERIAL_PORT_MANAGER_H */
