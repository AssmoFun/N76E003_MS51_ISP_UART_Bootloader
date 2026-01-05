;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module isp_uart
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _MOSI
	.globl _P00
	.globl _MISO
	.globl _P01
	.globl _RXD_1
	.globl _P02
	.globl _P03
	.globl _STADC
	.globl _P04
	.globl _P05
	.globl _TXD
	.globl _P06
	.globl _RXD
	.globl _P07
	.globl _IT0
	.globl _IE0
	.globl _IT1
	.globl _IE1
	.globl _TR0
	.globl _TF0
	.globl _TR1
	.globl _TF1
	.globl _P10
	.globl _P11
	.globl _P12
	.globl _SCL
	.globl _P13
	.globl _SDA
	.globl _P14
	.globl _P15
	.globl _TXD_1
	.globl _P16
	.globl _P17
	.globl _RI
	.globl _TI
	.globl _RB8
	.globl _TB8
	.globl _REN
	.globl _SM2
	.globl _SM1
	.globl _FE
	.globl _SM0
	.globl _P20
	.globl _EX0
	.globl _ET0
	.globl _EX1
	.globl _ET1
	.globl _ES
	.globl _EBOD
	.globl _EADC
	.globl _EA
	.globl _P30
	.globl _PX0
	.globl _PT0
	.globl _PX1
	.globl _PT1
	.globl _PS
	.globl _PBOD
	.globl _PADC
	.globl _I2CPX
	.globl _AA
	.globl _SI
	.globl _STO
	.globl _STA
	.globl _I2CEN
	.globl _CM_RL2
	.globl _TR2
	.globl _TF2
	.globl _P
	.globl _OV
	.globl _RS0
	.globl _RS1
	.globl _F0
	.globl _AC
	.globl _CY
	.globl _CLRPWM
	.globl _PWMF
	.globl _LOAD
	.globl _PWMRUN
	.globl _ADCHS0
	.globl _ADCHS1
	.globl _ADCHS2
	.globl _ADCHS3
	.globl _ETGSEL0
	.globl _ETGSEL1
	.globl _ADCS
	.globl _ADCF
	.globl _RI_1
	.globl _TI_1
	.globl _RB8_1
	.globl _TB8_1
	.globl _REN_1
	.globl _SM2_1
	.globl _SM1_1
	.globl _FE_1
	.globl _SM0_1
	.globl _EIPH1
	.globl _EIP1
	.globl _PMD
	.globl _PMEN
	.globl _PDTCNT
	.globl _PDTEN
	.globl _SCON_1
	.globl _EIPH
	.globl _AINDIDS
	.globl _SPDR
	.globl _SPSR
	.globl _SPCR2
	.globl _SPCR
	.globl _CAPCON4
	.globl _CAPCON3
	.globl _B
	.globl _EIP
	.globl _C2H
	.globl _C2L
	.globl _PIF
	.globl _PIPEN
	.globl _PINEN
	.globl _PICON
	.globl _ADCCON0
	.globl _C1H
	.globl _C1L
	.globl _C0H
	.globl _C0L
	.globl _ADCDLY
	.globl _ADCCON2
	.globl _ADCCON1
	.globl _ACC
	.globl _PWMCON1
	.globl _PIOCON0
	.globl _PWM3L
	.globl _PWM2L
	.globl _PWM1L
	.globl _PWM0L
	.globl _PWMPL
	.globl _PWMCON0
	.globl _FBD
	.globl _PNP
	.globl _PWM3H
	.globl _PWM2H
	.globl _PWM1H
	.globl _PWM0H
	.globl _PWMPH
	.globl _PSW
	.globl _ADCMPH
	.globl _ADCMPL
	.globl _PWM5L
	.globl _TH2
	.globl _PWM4L
	.globl _TL2
	.globl _RCMP2H
	.globl _RCMP2L
	.globl _T2MOD
	.globl _T2CON
	.globl _TA
	.globl _PIOCON1
	.globl _RH3
	.globl _PWM5H
	.globl _RL3
	.globl _PWM4H
	.globl _T3CON
	.globl _ADCRH
	.globl _ADCRL
	.globl _I2ADDR
	.globl _I2CON
	.globl _I2TOC
	.globl _I2CLK
	.globl _I2STAT
	.globl _I2DAT
	.globl _SADDR_1
	.globl _SADEN_1
	.globl _SADEN
	.globl _IP
	.globl _PWMINTC
	.globl _IPH
	.globl _P2S
	.globl _P1SR
	.globl _P1M2
	.globl _P1S
	.globl _P1M1
	.globl _P0SR
	.globl _P0M2
	.globl _P0S
	.globl _P0M1
	.globl _P3
	.globl _IAPCN
	.globl _IAPFD
	.globl _P3SR
	.globl _P3M2
	.globl _P3S
	.globl _P3M1
	.globl _BODCON1
	.globl _WDCON
	.globl _SADDR
	.globl _IE
	.globl _IAPAH
	.globl _IAPAL
	.globl _IAPUEN
	.globl _IAPTRG
	.globl _BODCON0
	.globl _AUXR1
	.globl _P2
	.globl _CHPCON
	.globl _EIE1
	.globl _EIE
	.globl _SBUF_1
	.globl _SBUF
	.globl _SCON
	.globl _CKEN
	.globl _CKSWT
	.globl _CKDIV
	.globl _CAPCON2
	.globl _CAPCON1
	.globl _CAPCON0
	.globl _SFRS
	.globl _P1
	.globl _WKCON
	.globl _CKCON
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _RWK
	.globl _RCTRIM1
	.globl _RCTRIM0
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _isApromUpdate
	.globl _timerIspOver
	.globl _timerUartOver
	.globl _temp4bytes
	.globl _programSize
	.globl _flashAddress
	.globl _timerIsp
	.globl _timerUart
	.globl _indexRx
	.globl _uartBuf
	.globl _calcChecksum
	.globl _sendPack
	.globl _ispRead4Bytes
	.globl _readConfig
	.globl _eraseAprom
	.globl _writeAprom
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_RCTRIM0	=	0x0084
_RCTRIM1	=	0x0085
_RWK	=	0x0086
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_CKCON	=	0x008e
_WKCON	=	0x008f
_P1	=	0x0090
_SFRS	=	0x0091
_CAPCON0	=	0x0092
_CAPCON1	=	0x0093
_CAPCON2	=	0x0094
_CKDIV	=	0x0095
_CKSWT	=	0x0096
_CKEN	=	0x0097
_SCON	=	0x0098
_SBUF	=	0x0099
_SBUF_1	=	0x009a
_EIE	=	0x009b
_EIE1	=	0x009c
_CHPCON	=	0x009f
_P2	=	0x00a0
_AUXR1	=	0x00a2
_BODCON0	=	0x00a3
_IAPTRG	=	0x00a4
_IAPUEN	=	0x00a5
_IAPAL	=	0x00a6
_IAPAH	=	0x00a7
_IE	=	0x00a8
_SADDR	=	0x00a9
_WDCON	=	0x00aa
_BODCON1	=	0x00ab
_P3M1	=	0x00ac
_P3S	=	0x00ac
_P3M2	=	0x00ad
_P3SR	=	0x00ad
_IAPFD	=	0x00ae
_IAPCN	=	0x00af
_P3	=	0x00b0
_P0M1	=	0x00b1
_P0S	=	0x00b1
_P0M2	=	0x00b2
_P0SR	=	0x00b2
_P1M1	=	0x00b3
_P1S	=	0x00b3
_P1M2	=	0x00b4
_P1SR	=	0x00b4
_P2S	=	0x00b5
_IPH	=	0x00b7
_PWMINTC	=	0x00b7
_IP	=	0x00b8
_SADEN	=	0x00b9
_SADEN_1	=	0x00ba
_SADDR_1	=	0x00bb
_I2DAT	=	0x00bc
_I2STAT	=	0x00bd
_I2CLK	=	0x00be
_I2TOC	=	0x00bf
_I2CON	=	0x00c0
_I2ADDR	=	0x00c1
_ADCRL	=	0x00c2
_ADCRH	=	0x00c3
_T3CON	=	0x00c4
_PWM4H	=	0x00c4
_RL3	=	0x00c5
_PWM5H	=	0x00c5
_RH3	=	0x00c6
_PIOCON1	=	0x00c6
_TA	=	0x00c7
_T2CON	=	0x00c8
_T2MOD	=	0x00c9
_RCMP2L	=	0x00ca
_RCMP2H	=	0x00cb
_TL2	=	0x00cc
_PWM4L	=	0x00cc
_TH2	=	0x00cd
_PWM5L	=	0x00cd
_ADCMPL	=	0x00ce
_ADCMPH	=	0x00cf
_PSW	=	0x00d0
_PWMPH	=	0x00d1
_PWM0H	=	0x00d2
_PWM1H	=	0x00d3
_PWM2H	=	0x00d4
_PWM3H	=	0x00d5
_PNP	=	0x00d6
_FBD	=	0x00d7
_PWMCON0	=	0x00d8
_PWMPL	=	0x00d9
_PWM0L	=	0x00da
_PWM1L	=	0x00db
_PWM2L	=	0x00dc
_PWM3L	=	0x00dd
_PIOCON0	=	0x00de
_PWMCON1	=	0x00df
_ACC	=	0x00e0
_ADCCON1	=	0x00e1
_ADCCON2	=	0x00e2
_ADCDLY	=	0x00e3
_C0L	=	0x00e4
_C0H	=	0x00e5
_C1L	=	0x00e6
_C1H	=	0x00e7
_ADCCON0	=	0x00e8
_PICON	=	0x00e9
_PINEN	=	0x00ea
_PIPEN	=	0x00eb
_PIF	=	0x00ec
_C2L	=	0x00ed
_C2H	=	0x00ee
_EIP	=	0x00ef
_B	=	0x00f0
_CAPCON3	=	0x00f1
_CAPCON4	=	0x00f2
_SPCR	=	0x00f3
_SPCR2	=	0x00f3
_SPSR	=	0x00f4
_SPDR	=	0x00f5
_AINDIDS	=	0x00f6
_EIPH	=	0x00f7
_SCON_1	=	0x00f8
_PDTEN	=	0x00f9
_PDTCNT	=	0x00fa
_PMEN	=	0x00fb
_PMD	=	0x00fc
_EIP1	=	0x00fe
_EIPH1	=	0x00ff
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_SM0_1	=	0x00ff
_FE_1	=	0x00ff
_SM1_1	=	0x00fe
_SM2_1	=	0x00fd
_REN_1	=	0x00fc
_TB8_1	=	0x00fb
_RB8_1	=	0x00fa
_TI_1	=	0x00f9
_RI_1	=	0x00f8
_ADCF	=	0x00ef
_ADCS	=	0x00ee
_ETGSEL1	=	0x00ed
_ETGSEL0	=	0x00ec
_ADCHS3	=	0x00eb
_ADCHS2	=	0x00ea
_ADCHS1	=	0x00e9
_ADCHS0	=	0x00e8
_PWMRUN	=	0x00df
_LOAD	=	0x00de
_PWMF	=	0x00dd
_CLRPWM	=	0x00dc
_CY	=	0x00d7
_AC	=	0x00d6
_F0	=	0x00d5
_RS1	=	0x00d4
_RS0	=	0x00d3
_OV	=	0x00d2
_P	=	0x00d0
_TF2	=	0x00cf
_TR2	=	0x00ca
_CM_RL2	=	0x00c8
_I2CEN	=	0x00c6
_STA	=	0x00c5
_STO	=	0x00c4
_SI	=	0x00c3
_AA	=	0x00c2
_I2CPX	=	0x00c0
_PADC	=	0x00be
_PBOD	=	0x00bd
_PS	=	0x00bc
_PT1	=	0x00bb
_PX1	=	0x00ba
_PT0	=	0x00b9
_PX0	=	0x00b8
_P30	=	0x00b0
_EA	=	0x00af
_EADC	=	0x00ae
_EBOD	=	0x00ad
_ES	=	0x00ac
_ET1	=	0x00ab
_EX1	=	0x00aa
_ET0	=	0x00a9
_EX0	=	0x00a8
_P20	=	0x00a0
_SM0	=	0x009f
_FE	=	0x009f
_SM1	=	0x009e
_SM2	=	0x009d
_REN	=	0x009c
_TB8	=	0x009b
_RB8	=	0x009a
_TI	=	0x0099
_RI	=	0x0098
_P17	=	0x0097
_P16	=	0x0096
_TXD_1	=	0x0096
_P15	=	0x0095
_P14	=	0x0094
_SDA	=	0x0094
_P13	=	0x0093
_SCL	=	0x0093
_P12	=	0x0092
_P11	=	0x0091
_P10	=	0x0090
_TF1	=	0x008f
_TR1	=	0x008e
_TF0	=	0x008d
_TR0	=	0x008c
_IE1	=	0x008b
_IT1	=	0x008a
_IE0	=	0x0089
_IT0	=	0x0088
_P07	=	0x0087
_RXD	=	0x0087
_P06	=	0x0086
_TXD	=	0x0086
_P05	=	0x0085
_P04	=	0x0084
_STADC	=	0x0084
_P03	=	0x0083
_P02	=	0x0082
_RXD_1	=	0x0082
_P01	=	0x0081
_MISO	=	0x0081
_P00	=	0x0080
_MOSI	=	0x0080
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_uartBuf::
	.ds 64
_indexRx::
	.ds 1
_timerUart::
	.ds 1
_timerIsp::
	.ds 2
_flashAddress::
	.ds 2
_programSize::
	.ds 2
_temp4bytes::
	.ds 4
_writeAprom_writeType_65536_84:
	.ds 1
_writeAprom_checksum_65536_85:
	.ds 2
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
_calcChecksum_checksum_65536_65:
	.ds 2
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
_timerUartOver::
	.ds 1
_timerIspOver::
	.ds 1
_isApromUpdate::
	.ds 1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;	lib\isp_uart\isp_uart.c:7: volatile  uint16_t  timerIsp = ISP_WAIT_TIMEOUT;
	mov	_timerIsp,#0x5e
	mov	(_timerIsp + 1),#0x01
;	lib\isp_uart\isp_uart.c:13: volatile  BIT timerIspOver = FALSE;
;	assignBit
	clr	_timerIspOver
;	lib\isp_uart\isp_uart.c:14: BIT isApromUpdate = FALSE;
;	assignBit
	clr	_isApromUpdate
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'calcChecksum'
;------------------------------------------------------------
;checksum                  Allocated with name '_calcChecksum_checksum_65536_65'
;i                         Allocated to registers r5 
;------------------------------------------------------------
;	lib\isp_uart\isp_uart.c:86: void calcChecksum(void)
;	-----------------------------------------
;	 function calcChecksum
;	-----------------------------------------
_calcChecksum:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	lib\isp_uart\isp_uart.c:88: uint16_t checksum = 0;
	clr	a
	mov	_calcChecksum_checksum_65536_65,a
	mov	(_calcChecksum_checksum_65536_65 + 1),a
;	lib\isp_uart\isp_uart.c:89: for (uint8_t i = 0; i < PACK_SIZE; i++)
	mov	r5,#0x00
00105$:
	cjne	r5,#0x40,00122$
00122$:
	jnc	00101$
;	lib\isp_uart\isp_uart.c:90: checksum += uartBuf[i];    
	mov	a,r5
	add	a,#_uartBuf
	mov	r1,a
	mov	ar4,@r1
	mov	r3,#0x00
	mov	r2,_calcChecksum_checksum_65536_65
	mov	r7,(_calcChecksum_checksum_65536_65 + 1)
	mov	a,r4
	add	a,r2
	mov	r2,a
	mov	a,r3
	addc	a,r7
	mov	r7,a
	mov	_calcChecksum_checksum_65536_65,r2
	mov	(_calcChecksum_checksum_65536_65 + 1),r7
;	lib\isp_uart\isp_uart.c:89: for (uint8_t i = 0; i < PACK_SIZE; i++)
	inc	r5
	sjmp	00105$
00101$:
;	lib\isp_uart\isp_uart.c:91: uartBuf[0] = checksum;
	mov	r6,_calcChecksum_checksum_65536_65
	mov	_uartBuf,r6
;	lib\isp_uart\isp_uart.c:92: uartBuf[1] = checksum >> 8;
	mov	r7,(_calcChecksum_checksum_65536_65 + 1)
	mov	(_uartBuf + 0x0001),r7
;	lib\isp_uart\isp_uart.c:93: if (uartBuf[4]++ == 0x00)
	mov	a,(_uartBuf + 0x0004)
	mov	r7,a
	inc	a
	mov	(_uartBuf + 0x0004),a
	mov	a,r7
	jnz	00107$
;	lib\isp_uart\isp_uart.c:94: uartBuf[5]++;
	mov	a,(_uartBuf + 0x0005)
	mov	r7,a
	inc	a
	mov	(_uartBuf + 0x0005),a
00107$:
;	lib\isp_uart\isp_uart.c:95: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'sendPack'
;------------------------------------------------------------
;i                         Allocated to registers r7 
;------------------------------------------------------------
;	lib\isp_uart\isp_uart.c:97: void sendPack(void)
;	-----------------------------------------
;	 function sendPack
;	-----------------------------------------
_sendPack:
;	lib\isp_uart\isp_uart.c:99: for (uint8_t i = 0; i < PACK_SIZE; i++){
	mov	r7,#0x00
00106$:
	cjne	r7,#0x40,00127$
00127$:
	jnc	00108$
;	lib\isp_uart\isp_uart.c:100: UART_SBUF = uartBuf[i];
	mov	a,r7
	add	a,#_uartBuf
	mov	r1,a
	mov	_SBUF_1,@r1
;	lib\isp_uart\isp_uart.c:101: while (!UART_INTERRUPT_TX_FLAG);
00101$:
;	lib\isp_uart\isp_uart.c:102: UART_INTERRUPT_TX_FLAG = 0;
;	assignBit
	jbc	_TI_1,00129$
	sjmp	00101$
00129$:
;	lib\isp_uart\isp_uart.c:99: for (uint8_t i = 0; i < PACK_SIZE; i++){
	inc	r7
	sjmp	00106$
00108$:
;	lib\isp_uart\isp_uart.c:104: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ispRead4Bytes'
;------------------------------------------------------------
;readType                  Allocated to registers r7 
;i                         Allocated to registers r5 
;------------------------------------------------------------
;	lib\isp_uart\isp_uart.c:106: void ispRead4Bytes(read_t readType)
;	-----------------------------------------
;	 function ispRead4Bytes
;	-----------------------------------------
_ispRead4Bytes:
	mov	r7,dpl
;	lib\isp_uart\isp_uart.c:108: IAPCN = readType;
	mov	_IAPCN,r7
;	lib\isp_uart\isp_uart.c:109: IAPAH = 0x00;
	mov	_IAPAH,#0x00
;	lib\isp_uart\isp_uart.c:111: for (uint8_t i = 0; i < 4; i++){
	clr	a
	cjne	r7,#0xc0,00143$
	inc	a
00143$:
	mov	r6,a
	clr	a
	cjne	r7,#0x0c,00145$
	inc	a
00145$:
	mov	r7,a
	mov	r5,#0x00
00114$:
	cjne	r5,#0x04,00147$
00147$:
	jnc	00112$
;	lib\isp_uart\isp_uart.c:112: IAPAL = i;
	mov	_IAPAL,r5
;	lib\isp_uart\isp_uart.c:113: if (readType == READ_CONFIG_TYPE && i == 3)
	mov	a,r6
	jz	00104$
	cjne	r5,#0x03,00104$
;	lib\isp_uart\isp_uart.c:114: IAPAL = 4;
	mov	_IAPAL,#0x04
;	lib\isp_uart\isp_uart.c:115: trig_IAPGO();
00104$:
	mov	_TA,#0xaa
	mov	_TA,#0x55
	orl	_IAPTRG,#0x01
;	lib\isp_uart\isp_uart.c:116: temp4bytes.raw[i] = IAPFD;
	mov	a,r5
	add	a,#_temp4bytes
	mov	r0,a
	mov	@r0,_IAPFD
;	lib\isp_uart\isp_uart.c:118: if (readType == READ_ID_TYPE && i == 1){
	mov	a,r7
	jz	00115$
	cjne	r5,#0x01,00115$
;	lib\isp_uart\isp_uart.c:119: if (temp4bytes.DID_high != 0x67)
	mov	a,#0x67
	cjne	a,(_temp4bytes + 0x0001),00112$
;	lib\isp_uart\isp_uart.c:120: break; 
00115$:
;	lib\isp_uart\isp_uart.c:111: for (uint8_t i = 0; i < 4; i++){
	inc	r5
	sjmp	00114$
00112$:
;	lib\isp_uart\isp_uart.c:124: calcChecksum();
;	lib\isp_uart\isp_uart.c:125: }
	ljmp	_calcChecksum
;------------------------------------------------------------
;Allocation info for local variables in function 'readConfig'
;------------------------------------------------------------
;	lib\isp_uart\isp_uart.c:127: void readConfig(void)
;	-----------------------------------------
;	 function readConfig
;	-----------------------------------------
_readConfig:
;	lib\isp_uart\isp_uart.c:129: ispRead4Bytes(READ_CONFIG_TYPE);
	mov	dpl,#0xc0
	lcall	_ispRead4Bytes
;	lib\isp_uart\isp_uart.c:130: uartBuf[8]  = temp4bytes.CONF0;
	mov	(_uartBuf + 0x0008),_temp4bytes
;	lib\isp_uart\isp_uart.c:131: uartBuf[9]  = temp4bytes.CONF1;
	mov	(_uartBuf + 0x0009),(_temp4bytes + 0x0001)
;	lib\isp_uart\isp_uart.c:132: uartBuf[10] = temp4bytes.CONF2;
	mov	(_uartBuf + 0x000a),(_temp4bytes + 0x0002)
;	lib\isp_uart\isp_uart.c:133: uartBuf[11] = 0xFF;
	mov	(_uartBuf + 0x000b),#0xff
;	lib\isp_uart\isp_uart.c:134: uartBuf[12] = temp4bytes.CONF4;
	mov	(_uartBuf + 0x000c),(_temp4bytes + 0x0003)
;	lib\isp_uart\isp_uart.c:135: uartBuf[13] = 0xFF;
	mov	(_uartBuf + 0x000d),#0xff
;	lib\isp_uart\isp_uart.c:136: uartBuf[14] = 0xFF;
	mov	(_uartBuf + 0x000e),#0xff
;	lib\isp_uart\isp_uart.c:137: uartBuf[15] = 0xFF;
	mov	(_uartBuf + 0x000f),#0xff
;	lib\isp_uart\isp_uart.c:138: sendPack();
;	lib\isp_uart\isp_uart.c:139: }
	ljmp	_sendPack
;------------------------------------------------------------
;Allocation info for local variables in function 'eraseAprom'
;------------------------------------------------------------
;pageAddr                  Allocated to registers r6 r7 
;------------------------------------------------------------
;	lib\isp_uart\isp_uart.c:141: void eraseAprom(void)
;	-----------------------------------------
;	 function eraseAprom
;	-----------------------------------------
_eraseAprom:
;	lib\isp_uart\isp_uart.c:143: TA = 0xAA; TA = 0x55;
	mov	_TA,#0xaa
	mov	_TA,#0x55
;	lib\isp_uart\isp_uart.c:144: IAPUEN |= 0x01;
	orl	_IAPUEN,#0x01
;	lib\isp_uart\isp_uart.c:145: IAPFD = 0xFF;
	mov	_IAPFD,#0xff
;	lib\isp_uart\isp_uart.c:146: IAPCN = PAGE_ERASE_AP;
	mov	_IAPCN,#0x22
;	lib\isp_uart\isp_uart.c:147: for (uint16_t pageAddr = 0; pageAddr < APROM_SIZE; pageAddr += PAGE_SIZE){        
	mov	r6,#0x00
	mov	r7,#0x00
00106$:
	mov	ar5,r7
	mov	a,#0x100 - 0x44
	add	a,r5
	jc	00108$
;	lib\isp_uart\isp_uart.c:148: IAPAL = LOBYTE(pageAddr);
	mov	_IAPAL,r6
;	lib\isp_uart\isp_uart.c:149: IAPAH = HIBYTE(pageAddr);
	mov	_IAPAH,r7
;	lib\isp_uart\isp_uart.c:150: trig_IAPGO();
	mov	_TA,#0xaa
	mov	_TA,#0x55
	orl	_IAPTRG,#0x01
;	lib\isp_uart\isp_uart.c:147: for (uint16_t pageAddr = 0; pageAddr < APROM_SIZE; pageAddr += PAGE_SIZE){        
	mov	ar4,r6
	mov	ar5,r7
	mov	a,#0x80
	add	a,r4
	mov	r4,a
	clr	a
	addc	a,r5
	mov	r5,a
	mov	ar6,r4
	mov	ar7,r5
	sjmp	00106$
00108$:
;	lib\isp_uart\isp_uart.c:152: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'writeAprom'
;------------------------------------------------------------
;writeType                 Allocated with name '_writeAprom_writeType_65536_84'
;checksum                  Allocated with name '_writeAprom_checksum_65536_85'
;i                         Allocated to registers r4 
;------------------------------------------------------------
;	lib\isp_uart\isp_uart.c:154: void writeAprom(apromWrite_t writeType)
;	-----------------------------------------
;	 function writeAprom
;	-----------------------------------------
_writeAprom:
	mov	_writeAprom_writeType_65536_84,dpl
;	lib\isp_uart\isp_uart.c:156: uint16_t checksum = 0;
	clr	a
	mov	_writeAprom_checksum_65536_85,a
	mov	(_writeAprom_checksum_65536_85 + 1),a
;	lib\isp_uart\isp_uart.c:157: for (uint8_t i = writeType; i < PACK_SIZE; i++){
	mov	r4,_writeAprom_writeType_65536_84
00119$:
	cjne	r4,#0x40,00147$
00147$:
	jc	00148$
	ljmp	00117$
00148$:
;	lib\isp_uart\isp_uart.c:159: IAPCN = BYTE_PROGRAM_AP;
	mov	_IAPCN,#0x21
;	lib\isp_uart\isp_uart.c:160: IAPAL = flashAddress;
	mov	_IAPAL,_flashAddress
;	lib\isp_uart\isp_uart.c:161: IAPAH = flashAddress >> 8;
	mov	_IAPAH,(_flashAddress + 1)
;	lib\isp_uart\isp_uart.c:162: IAPFD = uartBuf[i];
	mov	a,r4
	add	a,#_uartBuf
	mov	r1,a
	mov	_IAPFD,@r1
;	lib\isp_uart\isp_uart.c:163: trig_IAPGO();
	mov	_TA,#0xaa
	mov	_TA,#0x55
	orl	_IAPTRG,#0x01
;	lib\isp_uart\isp_uart.c:165: IAPCN = BYTE_READ_AP;
	mov	_IAPCN,#0x00
;	lib\isp_uart\isp_uart.c:166: trig_IAPGO();
	mov	_TA,#0xaa
	mov	_TA,#0x55
	orl	_IAPTRG,#0x01
;	lib\isp_uart\isp_uart.c:168: if ((IAPFD != uartBuf[i]) || (CHPCON == 0x43))
	mov	a,r4
	add	a,#_uartBuf
	mov	r1,a
	mov	a,@r1
	cjne	a,_IAPFD,00108$
	mov	a,#0x43
	cjne	a,_CHPCON,00111$
;	lib\isp_uart\isp_uart.c:169: while (1);
00108$:
	sjmp	00108$
00111$:
;	lib\isp_uart\isp_uart.c:170: checksum += uartBuf[i];
	mov	a,r4
	add	a,#_uartBuf
	mov	r1,a
	mov	ar3,@r1
	mov	r2,#0x00
	mov	r7,_writeAprom_checksum_65536_85
	mov	r6,(_writeAprom_checksum_65536_85 + 1)
	mov	a,r3
	add	a,r7
	mov	r7,a
	mov	a,r2
	addc	a,r6
	mov	r6,a
	mov	_writeAprom_checksum_65536_85,r7
	mov	(_writeAprom_checksum_65536_85 + 1),r6
;	lib\isp_uart\isp_uart.c:171: if (++flashAddress == programSize){
	inc	_flashAddress
	clr	a
	cjne	a,_flashAddress,00153$
	inc	(_flashAddress + 1)
00153$:
	mov	a,_programSize
	cjne	a,_flashAddress,00120$
	mov	a,(_programSize + 1)
	cjne	a,(_flashAddress + 1),00120$
;	lib\isp_uart\isp_uart.c:172: if (writeType == NEXT)
	mov	a,#0x08
	cjne	a,_writeAprom_writeType_65536_84,00114$
;	lib\isp_uart\isp_uart.c:173: timerIspOver = TRUE;
;	assignBit
	setb	_timerIspOver
00114$:
;	lib\isp_uart\isp_uart.c:174: isApromUpdate = FALSE;
;	assignBit
	clr	_isApromUpdate
;	lib\isp_uart\isp_uart.c:175: break;
	sjmp	00117$
00120$:
;	lib\isp_uart\isp_uart.c:157: for (uint8_t i = writeType; i < PACK_SIZE; i++){
	inc	r4
	ljmp	00119$
00117$:
;	lib\isp_uart\isp_uart.c:178: calcChecksum();
	lcall	_calcChecksum
;	lib\isp_uart\isp_uart.c:179: uartBuf[8] = checksum;
	mov	r5,_writeAprom_checksum_65536_85
	mov	(_uartBuf + 0x0008),r5
;	lib\isp_uart\isp_uart.c:180: uartBuf[9] = checksum >> 8;
	mov	r7,(_writeAprom_checksum_65536_85 + 1)
	mov	(_uartBuf + 0x0009),r7
;	lib\isp_uart\isp_uart.c:181: sendPack();
;	lib\isp_uart\isp_uart.c:182: }
	ljmp	_sendPack
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
