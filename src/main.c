#include "numicro_8051.h"
#include "../lib/isp_uart/isp_uart.h"
//#include <stdint.h>
//#include <stdbool.h>
//===========================================================================================================
#if defined __C51__
void Timer0_ISR(void) interrupt 1
#elif defined __ICC8051__
#pragma vector = 0x0B
__interrupt void Timer0_ISR(void)
#elif defined __SDCC__
void Timer0_ISR(void) __interrupt (1)
#endif
{
  if (timerIsp && --timerIsp == 0) timerIspOver = TRUE;
  if (timerUart && --timerUart == 0) timerUartOver = TRUE;
}
//-----------------------------------------------------------------------------------------------------------
#if defined __C51__
void UART_ISR(void) interrupt UART_ISR_NUMBER
#elif defined __ICC8051__
#pragma vector = UART_ISR_VECTOR
__interrupt void UART_ISR(void)
#elif defined __SDCC__
void UART_ISR(void) __interrupt (UART_ISR_NUMBER)
#endif
{
  UART_INTERRUPT_RX_FLAG = 0;
  uartBuf[indexRx++] = UART_SBUF;
  if (indexRx == 1){
    timerUart = UART_TIMOUT;
    timerUartOver = FALSE;
  }
  else if (indexRx == PACK_SIZE) DISABLE_GLOBAL_INTERRUPT;
}
//===========================================================================================================
void main (void)
{
  // Initial UART setup for ISP programmer GUI - Always use 115200 baud
  // Change the F_CPU frequency to the overclocked value
#if RESTORE_16_MHZ_CLOCK
#if defined N76E003
  // first call change 16->16.6 MHz
  changeHirc();
#else
  changeHirc(HIRC_OVERCLOCK);
#endif
#else
#if defined N76E003
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

    // clear Power On Flag for don't toch RCTRIM0 & RCTRIM1 after other resets
    clr_POF;
  } */

  // The method from the OpenNuvoton set 16->16.6 MHz
  //IAPCN = READ_UID; // Isn't it necessary for the first read after power-up ?
  IAPAH = 0x00;

  IAPAL = HIRC_16_MHz;
  IAPTRG |= 0x01;
  uint8_t hircMap0 = IAPFD;

  IAPAL = HIRC_16_MHz+1;
  IAPTRG |= 0x01;
  uint8_t hircMap1 = IAPFD;

  uint8_t trim = ((hircMap0 << 1) | (hircMap1 & 1)) - 13;  // 40kHz per 1 bit, 40*13=520 kHz
  hircMap0 = trim >> 1;
  hircMap1 = trim & 1;

  TA = 0xAA; TA = 0x55;
  RCTRIM0 = hircMap0;

  TA = 0xAA; TA = 0x55;
  RCTRIM1 = hircMap1;

#elif defined MS51FB9AE
  //IAPCN = READ_UID; // Isn't it necessary for the first read after power-up ?
  IAPAH = 0x00;

  IAPAL = HIRC_24_MHz;
  IAPTRG |= 0x01;
  uint8_t hircMap0 = IAPFD;

  IAPAL = HIRC_24_MHz+1;
  IAPTRG |= 0x01;
  uint8_t hircMap1 = IAPFD;

  TA = 0xAA; TA = 0x55;
  RCTRIM0 = hircMap0;

  TA = 0xAA; TA = 0x55;
  RCTRIM1 = hircMap1;
#endif
#endif // #if RESTORE_16_MHZ_CLOCK
  
#if defined N76E003
  // set 115277.78 (115200 bps + 0.068%) for 16.6 MHz
  RH3 = HIBYTE(65536 - 9);  // 255 = 0xFF
  RL3 = LOBYTE(65536 - 9);  // 247 = 0xF7
#elif defined MS51FB9AE
  // set 115384.6 (115200 bps + 0.16%) for 24 MHz
  RH3 = HIBYTE(65536 - 13); // 255 = 0xFF
  RL3 = LOBYTE(65536 - 13); // 243 = 0xF3
#endif

#if USED_UART == 0
  // UART0 Mode1, REN=1
  SCON = 0x50;
  // UART0 Double Rate Enable
  PCON |= 0x80;
  // Timer3 as UART0 clock source + Timer3 start
  T3CON = 0x28;

  /* // Timer1 using code
  // UART0 Mode1, REN=1
  SCON = 0x50;
  // UART0 Double Rate Enable
  PCON |= 0x80;
  // Timer1 as UART0 clock source
  CKCON |= 0x10;
  // Timer1 set to Mode2 auto reload mode (must)
  TMOD |= 0x20;
#if defined N76E003
  TH1 = 0xF7;
#elif defined MS51FB9AE
  TH1 = 0xF3;
#endif
  // Timer1 start
  TR1 = 1; */

  // config TX0 as output
  P06_QUASI_MODE;
  ENABLE_UART0_INTERRUPT;

#else // #if USED_UART == 1
  // UART1 Mode1, REN_1=1
  SCON_1 = 0x50;
  // UART1 Double Baud Rate Enable + Timer3 start
  T3CON = 0x88;
  // config TX1 as output
  P16_QUASI_MODE;
  ENABLE_UART1_INTERRUPT;
#endif

  // Start Timer0 with default 4.09/5,91 ms timout at 24/16.6 MHz
  set_TCON_TR0;
  ENABLE_TIMER0_INTERRUPT;
  // enable IAP function
  TA = 0xAA; TA = 0x55;
  CHPCON |= 0x01;
  ENABLE_GLOBAL_INTERRUPT;

  while(1){
    if (!EA){
      if (isApromUpdate) writeAprom(NEXT);
      switch (uartBuf[0]){
        case CMD_CONNECT:
        case CMD_SYNC_PACKNO:
          calcChecksum();
          sendPack();
          // clear timerIsp for no exit from ISP mode from timeout
          timerIsp = 0;
          break;

        // please for ISP programmer GUI, ID always use following rule to transmit
        case CMD_GET_DEVICEID:
          ispRead4Bytes(READ_ID_TYPE);
          uartBuf[8]  = temp4bytes.DID_low;
          uartBuf[9]  = temp4bytes.DID_high;
#ifdef N76E003
          if (temp4bytes.DID_high == 0x67){
#endif
            uartBuf[10] = temp4bytes.PID_low;
            uartBuf[11] = temp4bytes.PID_high;
#ifdef N76E003
          }  
#endif         
          sendPack();  
          break;
        
        case CMD_GET_FWVER:
          calcChecksum();
          uartBuf[8] = FW_VERSION;
          sendPack();  
          break;
        
        case CMD_READ_CONFIG:
          readConfig();
          break;

        case CMD_ERASE_ALL:
          eraseAprom();
          calcChecksum();
          sendPack();
          break;

        case CMD_UPDATE_APROM:
          eraseAprom();
          flashAddress = 0;
          programSize  = uartBuf[12];
          programSize |= uartBuf[13] << 8;
          isApromUpdate = TRUE;
          writeAprom(FIRST);
          break;

#if LDROM_SIZE == 2
        case CMD_UPDATE_CONFIG:
          temp4bytes.CONF0 = uartBuf[8];
          temp4bytes.CONF1 = uartBuf[9];
          temp4bytes.CONF2 = uartBuf[10];
          temp4bytes.CONF4 = uartBuf[12];

          // allow configuration changes
          TA=0xAA; TA=0x55;
          IAPUEN |= 0x04;

          // Erase CONFIG
          IAPCN = PAGE_ERASE_CONFIG;
          IAPAH = 0x00;
          IAPAL = 0x00;
          IAPFD = 0xFF;
          trig_IAPGO;

          // Program CONFIG 
          IAPCN = BYTE_PROGRAM_CONFIG;
          IAPAH = 0x00;

          for (uint8_t i = 0; i < 4; i++){
            IAPAL = i;
            if (i == 3)
              IAPAL = 4;
            IAPFD = temp4bytes.raw[i];
            trig_IAPGO;
          }
          
          // prohibit configuration changes
          TA=0xAA; TA=0x55;
          IAPUEN &= 0xFB;

          // Read new CONFIG
          readConfig();
          break;
#endif // #if LDROM_SIZE == 2

        case CMD_RUN_APROM:
          goto _APROM;

        default:
          break;
      }
      timerUart = 0;
      indexRx = 0;
      ENABLE_GLOBAL_INTERRUPT;
    }
    // for uart time out or buffer error
    if (timerUartOver) 
      indexRx = 0;
    // For connect timer out
    if (timerIspOver)
      break;
  }
_APROM:
  DISABLE_GLOBAL_INTERRUPT;
#if RESTORE_16_MHZ_CLOCK
  // restore default clock before software reset
#ifdef N76E003
  // not first call restore default 16 MHz
  changeHirc();
#else // #ifdef MS51FB9AE
  changeHirc(HIRC_16_MHz);
#endif
#endif // #if RESTORE_16_MHZ_CLOCK
  TA = 0xAA; TA = 0x55;
  // disable IAP function + set boot from APROM + software reset enable
  CHPCON = 0x80;
  // trap the CPU
  while(1);
}