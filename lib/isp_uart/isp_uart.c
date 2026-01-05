#include "../../include/numicro_8051.h"
#include "isp_uart.h"
//===========================================================================================================
volatile  uint8_t   uartBuf[PACK_SIZE];
volatile  uint8_t   indexRx;
volatile  uint8_t   timerUart;
volatile  uint16_t  timerIsp = ISP_WAIT_TIMEOUT;
          uint16_t  flashAddress; // init in CMD_UPDATE_APROM
          uint16_t  programSize;  // init in CMD_UPDATE_APROM
          temp4_t   temp4bytes;   // no need init

volatile  BIT timerUartOver;
volatile  BIT timerIspOver = FALSE;
          BIT isApromUpdate = FALSE;
//===========================================================================================================
#if RESTORE_16_MHZ_CLOCK
#if defined N76E003
void changeHirc(void)
{
  // The method from the Datasheet is only suitable for 16->16.6 MHz, and does not return to 16 MHz
  /* if ((PCON & SET_BIT4) == SET_BIT4){
    uint8_t hircMap0 = RCTRIM0;
    uint8_t hircMap1 = RCTRIM1;
    uint16_t trim = (((uint16_t)hircMap0 << 1) | (hircMap1 & 1)) - 15;  // 40kHz per 1 bit, 40*15=600 kHz
    hircMap0 = trim >> 1;
    hircMap1 = trim & 1;
    
    TA = 0xAA; TA = 0x55;
    RCTRIM0 = hircMap0;

    TA = 0xAA; TA = 0x55;
    RCTRIM1 = hircMap1;

    clr_POF;
  } */

  // The method from the OpenNuvoton set 16->16.6 MHz after first call, and restore 16 MHz after any next call
  IAPCN = READ_UID; // Isn't it necessary for the first read after power-up ?
  IAPAH = 0x00;

  IAPAL = HIRC_16_MHz;
  IAPTRG |= 0x01;
  uint8_t hircMap0 = IAPFD;

  IAPAL = HIRC_16_MHz+1;
  IAPTRG |= 0x01;
  uint8_t hircMap1 = IAPFD;

  if ((PCON & SET_BIT4) == SET_BIT4){
    uint8_t trim = ((hircMap0 << 1) | (hircMap1 & 1)) - 13;  // 40kHz per 1 bit, 40*13=520 kHz
    hircMap0 = trim >> 1;
    hircMap1 = trim & 1;
    // clear Power On Flag for restore RCTRIM0 & RCTRIM1 after all on next calls
    clr_POF;
  }

  TA = 0xAA; TA = 0x55;
  RCTRIM0 = hircMap0;

  TA = 0xAA; TA = 0x55;
  RCTRIM1 = hircMap1;

#elif defined MS51FB9AE
void changeHirc(hirc_t hircType)
{
  IAPCN = READ_UID;
  IAPAH = 0x00;

  IAPAL = hircType;
  IAPTRG |= 0x01;
  uint8_t hircMap0 = IAPFD;

  IAPAL = hircType+1;
  IAPTRG |= 0x01;
  uint8_t hircMap1 = IAPFD;

  TA = 0xAA; TA = 0x55;
  RCTRIM0 = hircMap0;

  TA = 0xAA; TA = 0x55;
  RCTRIM1 = hircMap1;
#endif
}
#endif // #if RESTORE_16_MHZ_CLOCK 

void calcChecksum(void)
{
  uint16_t checksum = 0;
  for (uint8_t i = 0; i < PACK_SIZE; i++)
    checksum += uartBuf[i];    
  uartBuf[0] = checksum;
  uartBuf[1] = checksum >> 8;
  if (uartBuf[4]++ == 0x00)
      uartBuf[5]++;
}

void sendPack(void)
{
  for (uint8_t i = 0; i < PACK_SIZE; i++){
    UART_SBUF = uartBuf[i];
    while (!UART_INTERRUPT_TX_FLAG);
    UART_INTERRUPT_TX_FLAG = 0;
  }
}

void ispRead4Bytes(read_t readType)
{
  IAPCN = readType;
  IAPAH = 0x00;

  for (uint8_t i = 0; i < 4; i++){
    IAPAL = i;
    if (readType == READ_CONFIG_TYPE && i == 3)
      IAPAL = 4;
    trig_IAPGO;
    temp4bytes.raw[i] = IAPFD;
#if defined N76E003
    if (readType == READ_ID_TYPE && i == 1){
      if (temp4bytes.DID_high != 0x67)
        break; 
    }
#endif
  }
  calcChecksum();
}

void readConfig(void)
{
  ispRead4Bytes(READ_CONFIG_TYPE);
  uartBuf[8]  = temp4bytes.CONF0;
  uartBuf[9]  = temp4bytes.CONF1;
  uartBuf[10] = temp4bytes.CONF2;
  uartBuf[11] = 0xFF;
  uartBuf[12] = temp4bytes.CONF4;
  uartBuf[13] = 0xFF;
  uartBuf[14] = 0xFF;
  uartBuf[15] = 0xFF;
  sendPack();
}

void eraseAprom(void)
{
  TA = 0xAA; TA = 0x55;
  IAPUEN |= 0x01;
  IAPFD = 0xFF;
  IAPCN = PAGE_ERASE_AP;
  for (uint16_t pageAddr = 0; pageAddr < APROM_SIZE; pageAddr += PAGE_SIZE){        
    IAPAL = LOBYTE(pageAddr);
    IAPAH = HIBYTE(pageAddr);
    trig_IAPGO;
  }
}

void writeAprom(apromWrite_t writeType)
{
  uint16_t checksum = 0;
  for (uint8_t i = writeType; i < PACK_SIZE; i++){
    // program byte
    IAPCN = BYTE_PROGRAM_AP;
    IAPAL = flashAddress;
    IAPAH = flashAddress >> 8;
    IAPFD = uartBuf[i];
    trig_IAPGO;
    // program byte verify
    IAPCN = BYTE_READ_AP;
    trig_IAPGO;
    // if verify fail or error flag set, stop ISP
    if ((IAPFD != uartBuf[i]) || (CHPCON == 0x43))
      while (1);
    checksum += uartBuf[i];
    if (++flashAddress == programSize){
      if (writeType == NEXT)
        timerIspOver = TRUE;
      isApromUpdate = FALSE;
      break;
    }
  }               
  calcChecksum();
  uartBuf[8] = checksum;
  uartBuf[9] = checksum >> 8;
  sendPack();
}