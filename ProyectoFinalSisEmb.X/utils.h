
/*
 
 
 
 
 
 */
#define NORMAL 0
#define BRUSCO 1
#define CHOQUE 2
#define ESCRIBIR 0
#define IMPRIMIR 1

  typedef struct _logger_struct_t{
        uint16_t id;
        uint32_t seconds;
        uint8_t patronManejo;
        GPSPosition_t position;

    } logger_struct_t;

uint32_t getUnixTime(void);

void unixTo(uint32_t epoch, char *buffer);