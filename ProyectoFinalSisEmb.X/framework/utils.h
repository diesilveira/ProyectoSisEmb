
/*
 
 
 
 
 
// */
//  typedef struct {
//        uint16_t id;
//        uint16_t milliseconds;
//        uint8_t patronManejo;
//        GPSPosition_t position;
//
//    } logger_struct_t;
//
//bool RTCC_BCDTimeSet(tm initialTime);

uint32_t getUnixTime(void);

void unixTo(uint32_t epoch, char *buffer);