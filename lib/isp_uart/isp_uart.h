/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef _DT_ISP_UART
#define _DT_ISP_UART

#ifdef __cplusplus
extern "C"{
#endif
/* Includes ------------------------------------------------------------------*/
#include <stdint.h>
//#include <stdbool.h>

/* Mutable defines -----------------------------------------------------------*/
#if defined N76E003
#define ISP_WAIT_TIMEOUT    350     // *5.81 ms for 16.6 MHz ≈ 2 sec
#elif defined MS51FB9AE
#define ISP_WAIT_TIMEOUT    500     // *4.09 ms for 24 MHz ≈ 2 sec
#endif
#define USED_UART           1       // 0 - for UART0, 1 - for UART1
#define LDROM_SIZE          1       // 1 or 2 KB. Select the same LDROM size value in NuMicro ICP Programming Tool
#define FW_VERSION          0x29    // The latest official version of Nuvoton is 0x28. Let's add 1
#if LDROM_SIZE == 2
#define RESTORE_16_MHZ_CLOCK  1     // 1 - restore the clock to default 16 MHz, or 0 - leave the overclock at 16.6/24 MHz
#endif
/* Immutable defines ---------------------------------------------------------*/
#if (USED_UART != 0) && (USED_UART != 1)
#error "USED_UART must be 0 or 1"
#endif
#if (LDROM_SIZE != 1) && (LDROM_SIZE != 2)
#error "LDROM_SIZE must be 1 or 2"
#endif
#if USED_UART == 0
#define UART_SBUF               SBUF
#define UART_INTERRUPT_RX_FLAG  RI
#define UART_INTERRUPT_TX_FLAG  TI
#define UART_ISR UART0_ISR
#define UART_ISR_NUMBER 4
#define UART_ISR_VECTOR 0x23
#else // #if USED_UART == 1
#define UART_SBUF               SBUF_1
#define UART_INTERRUPT_RX_FLAG  RI_1
#define UART_INTERRUPT_TX_FLAG  TI_1
#define UART_ISR UART1_ISR
#define UART_ISR_NUMBER 15
#define UART_ISR_VECTOR 0x7B
#endif
#if defined N76E003
#define APROM_SIZE_MAX      18      // KB
#define HIRC_OVERCLOCK      HIRC_16_6_MHz
#elif defined MS51FB9AE
#define APROM_SIZE_MAX      16      // KB
#define HIRC_OVERCLOCK      HIRC_24_MHz
#else
  #error "Unknown MCU: define N76E003 or MS51FB9AE"
#endif
#define APROM_SIZE          ((APROM_SIZE_MAX-LDROM_SIZE)*1024)
#define UART_TIMOUT         5       // *4.09/5.81 ms
#define PACK_SIZE           64
#define PAGE_SIZE           128

#define BYTE_READ_AP        0x00
#define BYTE_READ_UID       0x04
#define BYTE_READ_ID        0x0C
#define BYTE_PROGRAM_AP     0x21
#define PAGE_ERASE_AP       0x22
#define BYTE_READ_CONFIG    0xC0
#define BYTE_PROGRAM_CONFIG 0xE1
#define PAGE_ERASE_CONFIG   0xE2

#define trig_IAPGO()      \
        do {              \
          TA = 0xAA;      \
          TA = 0x55;      \
          IAPTRG |= 0x01; \
        } while (0)

/* Types ---------------------------------------------------------------------*/
typedef enum{
  CMD_UPDATE_APROM  = 0xA0,
  CMD_UPDATE_CONFIG = 0xA1,
  CMD_READ_CONFIG   = 0xA2,
  CMD_ERASE_ALL     = 0xA3,
  CMD_SYNC_PACKNO   = 0xA4,
  CMD_GET_FWVER     = 0xA6,
  CMD_RUN_APROM     = 0xAB,
  CMD_CONNECT       = 0xAE,
  CMD_GET_DEVICEID  = 0xB1
} command_t;

typedef enum{
  READ_ID_TYPE = BYTE_READ_ID,
  READ_CONFIG_TYPE = BYTE_READ_CONFIG
} read_t;

typedef enum{
  HIRC_16_MHz = 0x30,
  HIRC_16_6_MHz = 0x30, // the same as HIRC_16_MHz but must be tuned
  HIRC_24_MHz = 0x38
} hirc_t;

typedef enum{
  FIRST = 16,   // write from 16th to 64th received bytes in the first received packet
  NEXT = 8      // write from 8th to 64th received bytes in the next received packets
} apromWrite_t;

typedef union{
  uint8_t raw[4];
  struct {
    uint8_t CONF0;
    uint8_t CONF1;
    uint8_t CONF2;
    uint8_t CONF4;
  };
  struct {
    uint8_t DID_low;
    uint8_t DID_high;
    uint8_t PID_low;
    uint8_t PID_high;
  };
} temp4_t;

/* Extern variables ----------------------------------------------------------*/
extern  volatile  uint8_t   uartBuf[PACK_SIZE];
extern  volatile  uint8_t   indexRx;
extern  volatile  uint8_t   timerUart;
extern  volatile  uint16_t  timerIsp;
extern            uint16_t  flashAddress;
extern            uint16_t  programSize;
extern            temp4_t   temp4bytes;

extern  volatile  BIT timerUartOver;
extern  volatile  BIT timerIspOver;
extern            BIT isApromUpdate;
/* Prototypes -----------------------------------------------------------------*/
#if RESTORE_16_MHZ_CLOCK
#if defined N76E003
void changeHirc(void);
#else
void changeHirc(hirc_t hircType);
#endif
#endif 
void calcChecksum(void);
void sendPack(void);
void ispRead4Bytes(read_t readType);
void readConfig(void);
void eraseAprom(void);
void writeAprom(apromWrite_t writeType);

#ifdef __cplusplus
}
#endif
#endif /* _DT_ISP_UART */