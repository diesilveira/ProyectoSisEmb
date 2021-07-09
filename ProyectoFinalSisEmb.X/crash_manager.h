



void setUmbral(uint8_t levelMin, uint8_t levelMax);
void apagaLeds(void);
uint8_t getLevelValue(void);
void setLeds(uint8_t tipoDeAlerta);
void alerta(uint8_t tipoDeAlerta, SemaphoreHandle_t xSemaphoreLeds );
void prendeLedsSetearUmbrales(uint8_t adc);



/* *****************************************************************************
 End of File
 */
