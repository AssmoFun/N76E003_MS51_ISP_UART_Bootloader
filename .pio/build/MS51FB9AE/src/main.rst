                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _UART1_ISR
                                     13 	.globl _Timer0_ISR
                                     14 	.globl _writeAprom
                                     15 	.globl _eraseAprom
                                     16 	.globl _readConfig
                                     17 	.globl _ispRead4Bytes
                                     18 	.globl _sendPack
                                     19 	.globl _calcChecksum
                                     20 	.globl _MOSI
                                     21 	.globl _P00
                                     22 	.globl _MISO
                                     23 	.globl _P01
                                     24 	.globl _RXD_1
                                     25 	.globl _P02
                                     26 	.globl _P03
                                     27 	.globl _STADC
                                     28 	.globl _P04
                                     29 	.globl _P05
                                     30 	.globl _TXD
                                     31 	.globl _P06
                                     32 	.globl _RXD
                                     33 	.globl _P07
                                     34 	.globl _IT0
                                     35 	.globl _IE0
                                     36 	.globl _IT1
                                     37 	.globl _IE1
                                     38 	.globl _TR0
                                     39 	.globl _TF0
                                     40 	.globl _TR1
                                     41 	.globl _TF1
                                     42 	.globl _P10
                                     43 	.globl _P11
                                     44 	.globl _P12
                                     45 	.globl _SCL
                                     46 	.globl _P13
                                     47 	.globl _SDA
                                     48 	.globl _P14
                                     49 	.globl _P15
                                     50 	.globl _TXD_1
                                     51 	.globl _P16
                                     52 	.globl _P17
                                     53 	.globl _RI
                                     54 	.globl _TI
                                     55 	.globl _RB8
                                     56 	.globl _TB8
                                     57 	.globl _REN
                                     58 	.globl _SM2
                                     59 	.globl _SM1
                                     60 	.globl _FE
                                     61 	.globl _SM0
                                     62 	.globl _P20
                                     63 	.globl _EX0
                                     64 	.globl _ET0
                                     65 	.globl _EX1
                                     66 	.globl _ET1
                                     67 	.globl _ES
                                     68 	.globl _EBOD
                                     69 	.globl _EADC
                                     70 	.globl _EA
                                     71 	.globl _P30
                                     72 	.globl _PX0
                                     73 	.globl _PT0
                                     74 	.globl _PX1
                                     75 	.globl _PT1
                                     76 	.globl _PS
                                     77 	.globl _PBOD
                                     78 	.globl _PADC
                                     79 	.globl _I2CPX
                                     80 	.globl _AA
                                     81 	.globl _SI
                                     82 	.globl _STO
                                     83 	.globl _STA
                                     84 	.globl _I2CEN
                                     85 	.globl _CM_RL2
                                     86 	.globl _TR2
                                     87 	.globl _TF2
                                     88 	.globl _P
                                     89 	.globl _OV
                                     90 	.globl _RS0
                                     91 	.globl _RS1
                                     92 	.globl _F0
                                     93 	.globl _AC
                                     94 	.globl _CY
                                     95 	.globl _CLRPWM
                                     96 	.globl _PWMF
                                     97 	.globl _LOAD
                                     98 	.globl _PWMRUN
                                     99 	.globl _ADCHS0
                                    100 	.globl _ADCHS1
                                    101 	.globl _ADCHS2
                                    102 	.globl _ADCHS3
                                    103 	.globl _ETGSEL0
                                    104 	.globl _ETGSEL1
                                    105 	.globl _ADCS
                                    106 	.globl _ADCF
                                    107 	.globl _RI_1
                                    108 	.globl _TI_1
                                    109 	.globl _RB8_1
                                    110 	.globl _TB8_1
                                    111 	.globl _REN_1
                                    112 	.globl _SM2_1
                                    113 	.globl _SM1_1
                                    114 	.globl _FE_1
                                    115 	.globl _SM0_1
                                    116 	.globl _EIPH1
                                    117 	.globl _EIP1
                                    118 	.globl _PMD
                                    119 	.globl _PMEN
                                    120 	.globl _PDTCNT
                                    121 	.globl _PDTEN
                                    122 	.globl _SCON_1
                                    123 	.globl _EIPH
                                    124 	.globl _AINDIDS
                                    125 	.globl _SPDR
                                    126 	.globl _SPSR
                                    127 	.globl _SPCR2
                                    128 	.globl _SPCR
                                    129 	.globl _CAPCON4
                                    130 	.globl _CAPCON3
                                    131 	.globl _B
                                    132 	.globl _EIP
                                    133 	.globl _C2H
                                    134 	.globl _C2L
                                    135 	.globl _PIF
                                    136 	.globl _PIPEN
                                    137 	.globl _PINEN
                                    138 	.globl _PICON
                                    139 	.globl _ADCCON0
                                    140 	.globl _C1H
                                    141 	.globl _C1L
                                    142 	.globl _C0H
                                    143 	.globl _C0L
                                    144 	.globl _ADCDLY
                                    145 	.globl _ADCCON2
                                    146 	.globl _ADCCON1
                                    147 	.globl _ACC
                                    148 	.globl _PWMCON1
                                    149 	.globl _PIOCON0
                                    150 	.globl _PWM3L
                                    151 	.globl _PWM2L
                                    152 	.globl _PWM1L
                                    153 	.globl _PWM0L
                                    154 	.globl _PWMPL
                                    155 	.globl _PWMCON0
                                    156 	.globl _FBD
                                    157 	.globl _PNP
                                    158 	.globl _PWM3H
                                    159 	.globl _PWM2H
                                    160 	.globl _PWM1H
                                    161 	.globl _PWM0H
                                    162 	.globl _PWMPH
                                    163 	.globl _PSW
                                    164 	.globl _ADCMPH
                                    165 	.globl _ADCMPL
                                    166 	.globl _PWM5L
                                    167 	.globl _TH2
                                    168 	.globl _PWM4L
                                    169 	.globl _TL2
                                    170 	.globl _RCMP2H
                                    171 	.globl _RCMP2L
                                    172 	.globl _T2MOD
                                    173 	.globl _T2CON
                                    174 	.globl _TA
                                    175 	.globl _PIOCON1
                                    176 	.globl _RH3
                                    177 	.globl _PWM5H
                                    178 	.globl _RL3
                                    179 	.globl _PWM4H
                                    180 	.globl _T3CON
                                    181 	.globl _ADCRH
                                    182 	.globl _ADCRL
                                    183 	.globl _I2ADDR
                                    184 	.globl _I2CON
                                    185 	.globl _I2TOC
                                    186 	.globl _I2CLK
                                    187 	.globl _I2STAT
                                    188 	.globl _I2DAT
                                    189 	.globl _SADDR_1
                                    190 	.globl _SADEN_1
                                    191 	.globl _SADEN
                                    192 	.globl _IP
                                    193 	.globl _PWMINTC
                                    194 	.globl _IPH
                                    195 	.globl _P2S
                                    196 	.globl _P1SR
                                    197 	.globl _P1M2
                                    198 	.globl _P1S
                                    199 	.globl _P1M1
                                    200 	.globl _P0SR
                                    201 	.globl _P0M2
                                    202 	.globl _P0S
                                    203 	.globl _P0M1
                                    204 	.globl _P3
                                    205 	.globl _IAPCN
                                    206 	.globl _IAPFD
                                    207 	.globl _P3SR
                                    208 	.globl _P3M2
                                    209 	.globl _P3S
                                    210 	.globl _P3M1
                                    211 	.globl _BODCON1
                                    212 	.globl _WDCON
                                    213 	.globl _SADDR
                                    214 	.globl _IE
                                    215 	.globl _IAPAH
                                    216 	.globl _IAPAL
                                    217 	.globl _IAPUEN
                                    218 	.globl _IAPTRG
                                    219 	.globl _BODCON0
                                    220 	.globl _AUXR1
                                    221 	.globl _P2
                                    222 	.globl _CHPCON
                                    223 	.globl _EIE1
                                    224 	.globl _EIE
                                    225 	.globl _SBUF_1
                                    226 	.globl _SBUF
                                    227 	.globl _SCON
                                    228 	.globl _CKEN
                                    229 	.globl _CKSWT
                                    230 	.globl _CKDIV
                                    231 	.globl _CAPCON2
                                    232 	.globl _CAPCON1
                                    233 	.globl _CAPCON0
                                    234 	.globl _SFRS
                                    235 	.globl _P1
                                    236 	.globl _WKCON
                                    237 	.globl _CKCON
                                    238 	.globl _TH1
                                    239 	.globl _TH0
                                    240 	.globl _TL1
                                    241 	.globl _TL0
                                    242 	.globl _TMOD
                                    243 	.globl _TCON
                                    244 	.globl _PCON
                                    245 	.globl _RWK
                                    246 	.globl _RCTRIM1
                                    247 	.globl _RCTRIM0
                                    248 	.globl _DPH
                                    249 	.globl _DPL
                                    250 	.globl _SP
                                    251 	.globl _P0
                                    252 ;--------------------------------------------------------
                                    253 ; special function registers
                                    254 ;--------------------------------------------------------
                                    255 	.area RSEG    (ABS,DATA)
      000000                        256 	.org 0x0000
                           000080   257 _P0	=	0x0080
                           000081   258 _SP	=	0x0081
                           000082   259 _DPL	=	0x0082
                           000083   260 _DPH	=	0x0083
                           000084   261 _RCTRIM0	=	0x0084
                           000085   262 _RCTRIM1	=	0x0085
                           000086   263 _RWK	=	0x0086
                           000087   264 _PCON	=	0x0087
                           000088   265 _TCON	=	0x0088
                           000089   266 _TMOD	=	0x0089
                           00008A   267 _TL0	=	0x008a
                           00008B   268 _TL1	=	0x008b
                           00008C   269 _TH0	=	0x008c
                           00008D   270 _TH1	=	0x008d
                           00008E   271 _CKCON	=	0x008e
                           00008F   272 _WKCON	=	0x008f
                           000090   273 _P1	=	0x0090
                           000091   274 _SFRS	=	0x0091
                           000092   275 _CAPCON0	=	0x0092
                           000093   276 _CAPCON1	=	0x0093
                           000094   277 _CAPCON2	=	0x0094
                           000095   278 _CKDIV	=	0x0095
                           000096   279 _CKSWT	=	0x0096
                           000097   280 _CKEN	=	0x0097
                           000098   281 _SCON	=	0x0098
                           000099   282 _SBUF	=	0x0099
                           00009A   283 _SBUF_1	=	0x009a
                           00009B   284 _EIE	=	0x009b
                           00009C   285 _EIE1	=	0x009c
                           00009F   286 _CHPCON	=	0x009f
                           0000A0   287 _P2	=	0x00a0
                           0000A2   288 _AUXR1	=	0x00a2
                           0000A3   289 _BODCON0	=	0x00a3
                           0000A4   290 _IAPTRG	=	0x00a4
                           0000A5   291 _IAPUEN	=	0x00a5
                           0000A6   292 _IAPAL	=	0x00a6
                           0000A7   293 _IAPAH	=	0x00a7
                           0000A8   294 _IE	=	0x00a8
                           0000A9   295 _SADDR	=	0x00a9
                           0000AA   296 _WDCON	=	0x00aa
                           0000AB   297 _BODCON1	=	0x00ab
                           0000AC   298 _P3M1	=	0x00ac
                           0000AC   299 _P3S	=	0x00ac
                           0000AD   300 _P3M2	=	0x00ad
                           0000AD   301 _P3SR	=	0x00ad
                           0000AE   302 _IAPFD	=	0x00ae
                           0000AF   303 _IAPCN	=	0x00af
                           0000B0   304 _P3	=	0x00b0
                           0000B1   305 _P0M1	=	0x00b1
                           0000B1   306 _P0S	=	0x00b1
                           0000B2   307 _P0M2	=	0x00b2
                           0000B2   308 _P0SR	=	0x00b2
                           0000B3   309 _P1M1	=	0x00b3
                           0000B3   310 _P1S	=	0x00b3
                           0000B4   311 _P1M2	=	0x00b4
                           0000B4   312 _P1SR	=	0x00b4
                           0000B5   313 _P2S	=	0x00b5
                           0000B7   314 _IPH	=	0x00b7
                           0000B7   315 _PWMINTC	=	0x00b7
                           0000B8   316 _IP	=	0x00b8
                           0000B9   317 _SADEN	=	0x00b9
                           0000BA   318 _SADEN_1	=	0x00ba
                           0000BB   319 _SADDR_1	=	0x00bb
                           0000BC   320 _I2DAT	=	0x00bc
                           0000BD   321 _I2STAT	=	0x00bd
                           0000BE   322 _I2CLK	=	0x00be
                           0000BF   323 _I2TOC	=	0x00bf
                           0000C0   324 _I2CON	=	0x00c0
                           0000C1   325 _I2ADDR	=	0x00c1
                           0000C2   326 _ADCRL	=	0x00c2
                           0000C3   327 _ADCRH	=	0x00c3
                           0000C4   328 _T3CON	=	0x00c4
                           0000C4   329 _PWM4H	=	0x00c4
                           0000C5   330 _RL3	=	0x00c5
                           0000C5   331 _PWM5H	=	0x00c5
                           0000C6   332 _RH3	=	0x00c6
                           0000C6   333 _PIOCON1	=	0x00c6
                           0000C7   334 _TA	=	0x00c7
                           0000C8   335 _T2CON	=	0x00c8
                           0000C9   336 _T2MOD	=	0x00c9
                           0000CA   337 _RCMP2L	=	0x00ca
                           0000CB   338 _RCMP2H	=	0x00cb
                           0000CC   339 _TL2	=	0x00cc
                           0000CC   340 _PWM4L	=	0x00cc
                           0000CD   341 _TH2	=	0x00cd
                           0000CD   342 _PWM5L	=	0x00cd
                           0000CE   343 _ADCMPL	=	0x00ce
                           0000CF   344 _ADCMPH	=	0x00cf
                           0000D0   345 _PSW	=	0x00d0
                           0000D1   346 _PWMPH	=	0x00d1
                           0000D2   347 _PWM0H	=	0x00d2
                           0000D3   348 _PWM1H	=	0x00d3
                           0000D4   349 _PWM2H	=	0x00d4
                           0000D5   350 _PWM3H	=	0x00d5
                           0000D6   351 _PNP	=	0x00d6
                           0000D7   352 _FBD	=	0x00d7
                           0000D8   353 _PWMCON0	=	0x00d8
                           0000D9   354 _PWMPL	=	0x00d9
                           0000DA   355 _PWM0L	=	0x00da
                           0000DB   356 _PWM1L	=	0x00db
                           0000DC   357 _PWM2L	=	0x00dc
                           0000DD   358 _PWM3L	=	0x00dd
                           0000DE   359 _PIOCON0	=	0x00de
                           0000DF   360 _PWMCON1	=	0x00df
                           0000E0   361 _ACC	=	0x00e0
                           0000E1   362 _ADCCON1	=	0x00e1
                           0000E2   363 _ADCCON2	=	0x00e2
                           0000E3   364 _ADCDLY	=	0x00e3
                           0000E4   365 _C0L	=	0x00e4
                           0000E5   366 _C0H	=	0x00e5
                           0000E6   367 _C1L	=	0x00e6
                           0000E7   368 _C1H	=	0x00e7
                           0000E8   369 _ADCCON0	=	0x00e8
                           0000E9   370 _PICON	=	0x00e9
                           0000EA   371 _PINEN	=	0x00ea
                           0000EB   372 _PIPEN	=	0x00eb
                           0000EC   373 _PIF	=	0x00ec
                           0000ED   374 _C2L	=	0x00ed
                           0000EE   375 _C2H	=	0x00ee
                           0000EF   376 _EIP	=	0x00ef
                           0000F0   377 _B	=	0x00f0
                           0000F1   378 _CAPCON3	=	0x00f1
                           0000F2   379 _CAPCON4	=	0x00f2
                           0000F3   380 _SPCR	=	0x00f3
                           0000F3   381 _SPCR2	=	0x00f3
                           0000F4   382 _SPSR	=	0x00f4
                           0000F5   383 _SPDR	=	0x00f5
                           0000F6   384 _AINDIDS	=	0x00f6
                           0000F7   385 _EIPH	=	0x00f7
                           0000F8   386 _SCON_1	=	0x00f8
                           0000F9   387 _PDTEN	=	0x00f9
                           0000FA   388 _PDTCNT	=	0x00fa
                           0000FB   389 _PMEN	=	0x00fb
                           0000FC   390 _PMD	=	0x00fc
                           0000FE   391 _EIP1	=	0x00fe
                           0000FF   392 _EIPH1	=	0x00ff
                                    393 ;--------------------------------------------------------
                                    394 ; special function bits
                                    395 ;--------------------------------------------------------
                                    396 	.area RSEG    (ABS,DATA)
      000000                        397 	.org 0x0000
                           0000FF   398 _SM0_1	=	0x00ff
                           0000FF   399 _FE_1	=	0x00ff
                           0000FE   400 _SM1_1	=	0x00fe
                           0000FD   401 _SM2_1	=	0x00fd
                           0000FC   402 _REN_1	=	0x00fc
                           0000FB   403 _TB8_1	=	0x00fb
                           0000FA   404 _RB8_1	=	0x00fa
                           0000F9   405 _TI_1	=	0x00f9
                           0000F8   406 _RI_1	=	0x00f8
                           0000EF   407 _ADCF	=	0x00ef
                           0000EE   408 _ADCS	=	0x00ee
                           0000ED   409 _ETGSEL1	=	0x00ed
                           0000EC   410 _ETGSEL0	=	0x00ec
                           0000EB   411 _ADCHS3	=	0x00eb
                           0000EA   412 _ADCHS2	=	0x00ea
                           0000E9   413 _ADCHS1	=	0x00e9
                           0000E8   414 _ADCHS0	=	0x00e8
                           0000DF   415 _PWMRUN	=	0x00df
                           0000DE   416 _LOAD	=	0x00de
                           0000DD   417 _PWMF	=	0x00dd
                           0000DC   418 _CLRPWM	=	0x00dc
                           0000D7   419 _CY	=	0x00d7
                           0000D6   420 _AC	=	0x00d6
                           0000D5   421 _F0	=	0x00d5
                           0000D4   422 _RS1	=	0x00d4
                           0000D3   423 _RS0	=	0x00d3
                           0000D2   424 _OV	=	0x00d2
                           0000D0   425 _P	=	0x00d0
                           0000CF   426 _TF2	=	0x00cf
                           0000CA   427 _TR2	=	0x00ca
                           0000C8   428 _CM_RL2	=	0x00c8
                           0000C6   429 _I2CEN	=	0x00c6
                           0000C5   430 _STA	=	0x00c5
                           0000C4   431 _STO	=	0x00c4
                           0000C3   432 _SI	=	0x00c3
                           0000C2   433 _AA	=	0x00c2
                           0000C0   434 _I2CPX	=	0x00c0
                           0000BE   435 _PADC	=	0x00be
                           0000BD   436 _PBOD	=	0x00bd
                           0000BC   437 _PS	=	0x00bc
                           0000BB   438 _PT1	=	0x00bb
                           0000BA   439 _PX1	=	0x00ba
                           0000B9   440 _PT0	=	0x00b9
                           0000B8   441 _PX0	=	0x00b8
                           0000B0   442 _P30	=	0x00b0
                           0000AF   443 _EA	=	0x00af
                           0000AE   444 _EADC	=	0x00ae
                           0000AD   445 _EBOD	=	0x00ad
                           0000AC   446 _ES	=	0x00ac
                           0000AB   447 _ET1	=	0x00ab
                           0000AA   448 _EX1	=	0x00aa
                           0000A9   449 _ET0	=	0x00a9
                           0000A8   450 _EX0	=	0x00a8
                           0000A0   451 _P20	=	0x00a0
                           00009F   452 _SM0	=	0x009f
                           00009F   453 _FE	=	0x009f
                           00009E   454 _SM1	=	0x009e
                           00009D   455 _SM2	=	0x009d
                           00009C   456 _REN	=	0x009c
                           00009B   457 _TB8	=	0x009b
                           00009A   458 _RB8	=	0x009a
                           000099   459 _TI	=	0x0099
                           000098   460 _RI	=	0x0098
                           000097   461 _P17	=	0x0097
                           000096   462 _P16	=	0x0096
                           000096   463 _TXD_1	=	0x0096
                           000095   464 _P15	=	0x0095
                           000094   465 _P14	=	0x0094
                           000094   466 _SDA	=	0x0094
                           000093   467 _P13	=	0x0093
                           000093   468 _SCL	=	0x0093
                           000092   469 _P12	=	0x0092
                           000091   470 _P11	=	0x0091
                           000090   471 _P10	=	0x0090
                           00008F   472 _TF1	=	0x008f
                           00008E   473 _TR1	=	0x008e
                           00008D   474 _TF0	=	0x008d
                           00008C   475 _TR0	=	0x008c
                           00008B   476 _IE1	=	0x008b
                           00008A   477 _IT1	=	0x008a
                           000089   478 _IE0	=	0x0089
                           000088   479 _IT0	=	0x0088
                           000087   480 _P07	=	0x0087
                           000087   481 _RXD	=	0x0087
                           000086   482 _P06	=	0x0086
                           000086   483 _TXD	=	0x0086
                           000085   484 _P05	=	0x0085
                           000084   485 _P04	=	0x0084
                           000084   486 _STADC	=	0x0084
                           000083   487 _P03	=	0x0083
                           000082   488 _P02	=	0x0082
                           000082   489 _RXD_1	=	0x0082
                           000081   490 _P01	=	0x0081
                           000081   491 _MISO	=	0x0081
                           000080   492 _P00	=	0x0080
                           000080   493 _MOSI	=	0x0080
                                    494 ;--------------------------------------------------------
                                    495 ; overlayable register banks
                                    496 ;--------------------------------------------------------
                                    497 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        498 	.ds 8
                                    499 ;--------------------------------------------------------
                                    500 ; internal ram data
                                    501 ;--------------------------------------------------------
                                    502 	.area DSEG    (DATA)
                                    503 ;--------------------------------------------------------
                                    504 ; overlayable items in internal ram
                                    505 ;--------------------------------------------------------
                                    506 ;--------------------------------------------------------
                                    507 ; Stack segment in internal ram
                                    508 ;--------------------------------------------------------
                                    509 	.area	SSEG
      000070                        510 __start__stack:
      000070                        511 	.ds	1
                                    512 
                                    513 ;--------------------------------------------------------
                                    514 ; indirectly addressable internal ram data
                                    515 ;--------------------------------------------------------
                                    516 	.area ISEG    (DATA)
                                    517 ;--------------------------------------------------------
                                    518 ; absolute internal ram data
                                    519 ;--------------------------------------------------------
                                    520 	.area IABS    (ABS,DATA)
                                    521 	.area IABS    (ABS,DATA)
                                    522 ;--------------------------------------------------------
                                    523 ; bit data
                                    524 ;--------------------------------------------------------
                                    525 	.area BSEG    (BIT)
                                    526 ;--------------------------------------------------------
                                    527 ; paged external ram data
                                    528 ;--------------------------------------------------------
                                    529 	.area PSEG    (PAG,XDATA)
                                    530 ;--------------------------------------------------------
                                    531 ; external ram data
                                    532 ;--------------------------------------------------------
                                    533 	.area XSEG    (XDATA)
                                    534 ;--------------------------------------------------------
                                    535 ; absolute external ram data
                                    536 ;--------------------------------------------------------
                                    537 	.area XABS    (ABS,XDATA)
                                    538 ;--------------------------------------------------------
                                    539 ; external initialized ram data
                                    540 ;--------------------------------------------------------
                                    541 	.area XISEG   (XDATA)
                                    542 	.area HOME    (CODE)
                                    543 	.area GSINIT0 (CODE)
                                    544 	.area GSINIT1 (CODE)
                                    545 	.area GSINIT2 (CODE)
                                    546 	.area GSINIT3 (CODE)
                                    547 	.area GSINIT4 (CODE)
                                    548 	.area GSINIT5 (CODE)
                                    549 	.area GSINIT  (CODE)
                                    550 	.area GSFINAL (CODE)
                                    551 	.area CSEG    (CODE)
                                    552 ;--------------------------------------------------------
                                    553 ; interrupt vector
                                    554 ;--------------------------------------------------------
                                    555 	.area HOME    (CODE)
      000000                        556 __interrupt_vect:
      000000 02 00 81         [24]  557 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  558 	reti
      000004                        559 	.ds	7
      00000B 02 00 E7         [24]  560 	ljmp	_Timer0_ISR
      00000E                        561 	.ds	5
      000013 32               [24]  562 	reti
      000014                        563 	.ds	7
      00001B 32               [24]  564 	reti
      00001C                        565 	.ds	7
      000023 32               [24]  566 	reti
      000024                        567 	.ds	7
      00002B 32               [24]  568 	reti
      00002C                        569 	.ds	7
      000033 32               [24]  570 	reti
      000034                        571 	.ds	7
      00003B 32               [24]  572 	reti
      00003C                        573 	.ds	7
      000043 32               [24]  574 	reti
      000044                        575 	.ds	7
      00004B 32               [24]  576 	reti
      00004C                        577 	.ds	7
      000053 32               [24]  578 	reti
      000054                        579 	.ds	7
      00005B 32               [24]  580 	reti
      00005C                        581 	.ds	7
      000063 32               [24]  582 	reti
      000064                        583 	.ds	7
      00006B 32               [24]  584 	reti
      00006C                        585 	.ds	7
      000073 32               [24]  586 	reti
      000074                        587 	.ds	7
      00007B 02 01 23         [24]  588 	ljmp	_UART1_ISR
                                    589 ;--------------------------------------------------------
                                    590 ; global & static initialisations
                                    591 ;--------------------------------------------------------
                                    592 	.area HOME    (CODE)
                                    593 	.area GSINIT  (CODE)
                                    594 	.area GSFINAL (CODE)
                                    595 	.area GSINIT  (CODE)
                                    596 	.globl __sdcc_gsinit_startup
                                    597 	.globl __sdcc_program_startup
                                    598 	.globl __start__stack
                                    599 	.globl __mcs51_genXINIT
                                    600 	.globl __mcs51_genXRAMCLEAR
                                    601 	.globl __mcs51_genRAMCLEAR
                                    602 	.area GSFINAL (CODE)
      0000E4 02 00 7E         [24]  603 	ljmp	__sdcc_program_startup
                                    604 ;--------------------------------------------------------
                                    605 ; Home
                                    606 ;--------------------------------------------------------
                                    607 	.area HOME    (CODE)
                                    608 	.area HOME    (CODE)
      00007E                        609 __sdcc_program_startup:
      00007E 02 01 58         [24]  610 	ljmp	_main
                                    611 ;	return from main will return to caller
                                    612 ;--------------------------------------------------------
                                    613 ; code
                                    614 ;--------------------------------------------------------
                                    615 	.area CSEG    (CODE)
                                    616 ;------------------------------------------------------------
                                    617 ;Allocation info for local variables in function 'Timer0_ISR'
                                    618 ;------------------------------------------------------------
                                    619 ;	src\main.c:12: void Timer0_ISR(void) __interrupt (1)
                                    620 ;	-----------------------------------------
                                    621 ;	 function Timer0_ISR
                                    622 ;	-----------------------------------------
      0000E7                        623 _Timer0_ISR:
                           000007   624 	ar7 = 0x07
                           000006   625 	ar6 = 0x06
                           000005   626 	ar5 = 0x05
                           000004   627 	ar4 = 0x04
                           000003   628 	ar3 = 0x03
                           000002   629 	ar2 = 0x02
                           000001   630 	ar1 = 0x01
                           000000   631 	ar0 = 0x00
      0000E7 C0 E0            [24]  632 	push	acc
      0000E9 C0 07            [24]  633 	push	ar7
      0000EB C0 06            [24]  634 	push	ar6
      0000ED C0 D0            [24]  635 	push	psw
      0000EF 75 D0 00         [24]  636 	mov	psw,#0x00
                                    637 ;	src\main.c:15: if (timerIsp && --timerIsp == 0) timerIspOver = TRUE;
      0000F2 E5 63            [12]  638 	mov	a,_timerIsp
      0000F4 45 64            [12]  639 	orl	a,(_timerIsp + 1)
      0000F6 60 14            [24]  640 	jz	00102$
      0000F8 E5 63            [12]  641 	mov	a,_timerIsp
      0000FA 24 FF            [12]  642 	add	a,#0xff
      0000FC FE               [12]  643 	mov	r6,a
      0000FD E5 64            [12]  644 	mov	a,(_timerIsp + 1)
      0000FF 34 FF            [12]  645 	addc	a,#0xff
      000101 FF               [12]  646 	mov	r7,a
      000102 8E 63            [24]  647 	mov	_timerIsp,r6
      000104 8F 64            [24]  648 	mov	(_timerIsp + 1),r7
      000106 EE               [12]  649 	mov	a,r6
      000107 4F               [12]  650 	orl	a,r7
      000108 70 02            [24]  651 	jnz	00102$
                                    652 ;	assignBit
      00010A D2 01            [12]  653 	setb	_timerIspOver
      00010C                        654 00102$:
                                    655 ;	src\main.c:16: if (timerUart && --timerUart == 0) timerUartOver = TRUE;
      00010C E5 62            [12]  656 	mov	a,_timerUart
      00010E 60 0A            [24]  657 	jz	00107$
      000110 E5 62            [12]  658 	mov	a,_timerUart
      000112 14               [12]  659 	dec	a
      000113 FF               [12]  660 	mov	r7,a
      000114 8F 62            [24]  661 	mov	_timerUart,r7
      000116 70 02            [24]  662 	jnz	00107$
                                    663 ;	assignBit
      000118 D2 00            [12]  664 	setb	_timerUartOver
      00011A                        665 00107$:
                                    666 ;	src\main.c:17: }
      00011A D0 D0            [24]  667 	pop	psw
      00011C D0 06            [24]  668 	pop	ar6
      00011E D0 07            [24]  669 	pop	ar7
      000120 D0 E0            [24]  670 	pop	acc
      000122 32               [24]  671 	reti
                                    672 ;	eliminated unneeded push/pop dpl
                                    673 ;	eliminated unneeded push/pop dph
                                    674 ;	eliminated unneeded push/pop b
                                    675 ;------------------------------------------------------------
                                    676 ;Allocation info for local variables in function 'UART1_ISR'
                                    677 ;------------------------------------------------------------
                                    678 ;	src\main.c:25: void UART_ISR(void) __interrupt (UART_ISR_NUMBER)
                                    679 ;	-----------------------------------------
                                    680 ;	 function UART1_ISR
                                    681 ;	-----------------------------------------
      000123                        682 _UART1_ISR:
      000123 C0 E0            [24]  683 	push	acc
      000125 C0 07            [24]  684 	push	ar7
      000127 C0 00            [24]  685 	push	ar0
      000129 C0 D0            [24]  686 	push	psw
      00012B 75 D0 00         [24]  687 	mov	psw,#0x00
                                    688 ;	src\main.c:28: UART_INTERRUPT_RX_FLAG = 0;
                                    689 ;	assignBit
      00012E C2 F8            [12]  690 	clr	_RI_1
                                    691 ;	src\main.c:29: uartBuf[indexRx++] = UART_SBUF;
      000130 E5 61            [12]  692 	mov	a,_indexRx
      000132 FF               [12]  693 	mov	r7,a
      000133 04               [12]  694 	inc	a
      000134 F5 61            [12]  695 	mov	_indexRx,a
      000136 EF               [12]  696 	mov	a,r7
      000137 24 21            [12]  697 	add	a,#_uartBuf
      000139 F8               [12]  698 	mov	r0,a
      00013A A6 9A            [24]  699 	mov	@r0,_SBUF_1
                                    700 ;	src\main.c:30: if (indexRx == 1){
      00013C 74 01            [12]  701 	mov	a,#0x01
      00013E B5 61 07         [24]  702 	cjne	a,_indexRx,00104$
                                    703 ;	src\main.c:31: timerUart = UART_TIMOUT;
      000141 75 62 05         [24]  704 	mov	_timerUart,#0x05
                                    705 ;	src\main.c:32: timerUartOver = FALSE;
                                    706 ;	assignBit
      000144 C2 00            [12]  707 	clr	_timerUartOver
      000146 80 07            [24]  708 	sjmp	00106$
      000148                        709 00104$:
                                    710 ;	src\main.c:34: else if (indexRx == PACK_SIZE) DISABLE_GLOBAL_INTERRUPT;
      000148 74 40            [12]  711 	mov	a,#0x40
      00014A B5 61 02         [24]  712 	cjne	a,_indexRx,00106$
                                    713 ;	assignBit
      00014D C2 AF            [12]  714 	clr	_EA
      00014F                        715 00106$:
                                    716 ;	src\main.c:35: }
      00014F D0 D0            [24]  717 	pop	psw
      000151 D0 00            [24]  718 	pop	ar0
      000153 D0 07            [24]  719 	pop	ar7
      000155 D0 E0            [24]  720 	pop	acc
      000157 32               [24]  721 	reti
                                    722 ;	eliminated unneeded push/pop ar1
                                    723 ;	eliminated unneeded push/pop dpl
                                    724 ;	eliminated unneeded push/pop dph
                                    725 ;	eliminated unneeded push/pop b
                                    726 ;------------------------------------------------------------
                                    727 ;Allocation info for local variables in function 'main'
                                    728 ;------------------------------------------------------------
                                    729 ;hircMap0                  Allocated to registers r7 
                                    730 ;hircMap1                  Allocated to registers r6 
                                    731 ;------------------------------------------------------------
                                    732 ;	src\main.c:37: void main (void)
                                    733 ;	-----------------------------------------
                                    734 ;	 function main
                                    735 ;	-----------------------------------------
      000158                        736 _main:
                                    737 ;	src\main.c:92: IAPAH = 0x00;
      000158 75 A7 00         [24]  738 	mov	_IAPAH,#0x00
                                    739 ;	src\main.c:94: IAPAL = HIRC_24_MHz;
      00015B 75 A6 38         [24]  740 	mov	_IAPAL,#0x38
                                    741 ;	src\main.c:95: IAPTRG |= 0x01;
      00015E 43 A4 01         [24]  742 	orl	_IAPTRG,#0x01
                                    743 ;	src\main.c:96: uint8_t hircMap0 = IAPFD;
      000161 AF AE            [24]  744 	mov	r7,_IAPFD
                                    745 ;	src\main.c:98: IAPAL = HIRC_24_MHz+1;
      000163 75 A6 39         [24]  746 	mov	_IAPAL,#0x39
                                    747 ;	src\main.c:99: IAPTRG |= 0x01;
      000166 43 A4 01         [24]  748 	orl	_IAPTRG,#0x01
                                    749 ;	src\main.c:100: uint8_t hircMap1 = IAPFD;
      000169 AE AE            [24]  750 	mov	r6,_IAPFD
                                    751 ;	src\main.c:102: TA = 0xAA; TA = 0x55;
      00016B 75 C7 AA         [24]  752 	mov	_TA,#0xaa
      00016E 75 C7 55         [24]  753 	mov	_TA,#0x55
                                    754 ;	src\main.c:103: RCTRIM0 = hircMap0;
      000171 8F 84            [24]  755 	mov	_RCTRIM0,r7
                                    756 ;	src\main.c:105: TA = 0xAA; TA = 0x55;
      000173 75 C7 AA         [24]  757 	mov	_TA,#0xaa
      000176 75 C7 55         [24]  758 	mov	_TA,#0x55
                                    759 ;	src\main.c:106: RCTRIM1 = hircMap1;
      000179 8E 85            [24]  760 	mov	_RCTRIM1,r6
                                    761 ;	src\main.c:116: RH3 = HIBYTE(65536 - 13); // 255 = 0xFF
      00017B 75 C6 FF         [24]  762 	mov	_RH3,#0xff
                                    763 ;	src\main.c:117: RL3 = LOBYTE(65536 - 13); // 243 = 0xF3
      00017E 75 C5 F3         [24]  764 	mov	_RL3,#0xf3
                                    765 ;	src\main.c:151: SCON_1 = 0x50;
      000181 75 F8 50         [24]  766 	mov	_SCON_1,#0x50
                                    767 ;	src\main.c:153: T3CON = 0x88;
      000184 75 C4 88         [24]  768 	mov	_T3CON,#0x88
                                    769 ;	src\main.c:155: P16_QUASI_MODE;
      000187 53 B3 BF         [24]  770 	anl	_P1M1,#0xbf
      00018A 53 B4 BF         [24]  771 	anl	_P1M2,#0xbf
                                    772 ;	src\main.c:156: ENABLE_UART1_INTERRUPT;
      00018D 43 9C 01         [24]  773 	orl	_EIE1,#0x01
                                    774 ;	src\main.c:160: set_TCON_TR0;
                                    775 ;	assignBit
      000190 D2 8C            [12]  776 	setb	_TR0
                                    777 ;	src\main.c:161: ENABLE_TIMER0_INTERRUPT;
                                    778 ;	assignBit
      000192 D2 A9            [12]  779 	setb	_ET0
                                    780 ;	src\main.c:163: TA = 0xAA; TA = 0x55;
      000194 75 C7 AA         [24]  781 	mov	_TA,#0xaa
      000197 75 C7 55         [24]  782 	mov	_TA,#0x55
                                    783 ;	src\main.c:164: CHPCON |= 0x01;
      00019A 43 9F 01         [24]  784 	orl	_CHPCON,#0x01
                                    785 ;	src\main.c:165: ENABLE_GLOBAL_INTERRUPT;
                                    786 ;	assignBit
      00019D D2 AF            [12]  787 	setb	_EA
                                    788 ;	src\main.c:167: while(1){
      00019F                        789 00120$:
                                    790 ;	src\main.c:168: if (!EA){
      00019F 30 AF 03         [24]  791 	jnb	_EA,00180$
      0001A2 02 02 47         [24]  792 	ljmp	00114$
      0001A5                        793 00180$:
                                    794 ;	src\main.c:169: if (isApromUpdate) writeAprom(NEXT);
      0001A5 30 02 06         [24]  795 	jnb	_isApromUpdate,00102$
      0001A8 75 82 08         [24]  796 	mov	dpl,#0x08
      0001AB 12 03 41         [24]  797 	lcall	_writeAprom
      0001AE                        798 00102$:
                                    799 ;	src\main.c:170: switch (uartBuf[0]){
      0001AE AF 21            [24]  800 	mov	r7,_uartBuf
      0001B0 BF A0 02         [24]  801 	cjne	r7,#0xa0,00182$
      0001B3 80 63            [24]  802 	sjmp	00109$
      0001B5                        803 00182$:
      0001B5 BF A2 02         [24]  804 	cjne	r7,#0xa2,00183$
      0001B8 80 4E            [24]  805 	sjmp	00107$
      0001BA                        806 00183$:
      0001BA BF A3 02         [24]  807 	cjne	r7,#0xa3,00184$
      0001BD 80 4E            [24]  808 	sjmp	00108$
      0001BF                        809 00184$:
      0001BF BF A4 02         [24]  810 	cjne	r7,#0xa4,00185$
      0001C2 80 15            [24]  811 	sjmp	00104$
      0001C4                        812 00185$:
      0001C4 BF A6 02         [24]  813 	cjne	r7,#0xa6,00186$
      0001C7 80 34            [24]  814 	sjmp	00106$
      0001C9                        815 00186$:
      0001C9 BF AB 03         [24]  816 	cjne	r7,#0xab,00187$
      0001CC 02 02 53         [24]  817 	ljmp	00122$
      0001CF                        818 00187$:
      0001CF BF AE 02         [24]  819 	cjne	r7,#0xae,00188$
      0001D2 80 05            [24]  820 	sjmp	00104$
      0001D4                        821 00188$:
                                    822 ;	src\main.c:172: case CMD_SYNC_PACKNO:
      0001D4 BF B1 68         [24]  823 	cjne	r7,#0xb1,00112$
      0001D7 80 0D            [24]  824 	sjmp	00105$
      0001D9                        825 00104$:
                                    826 ;	src\main.c:173: calcChecksum();
      0001D9 12 02 60         [24]  827 	lcall	_calcChecksum
                                    828 ;	src\main.c:174: sendPack();
      0001DC 12 02 9D         [24]  829 	lcall	_sendPack
                                    830 ;	src\main.c:176: timerIsp = 0;
      0001DF E4               [12]  831 	clr	a
      0001E0 F5 63            [12]  832 	mov	_timerIsp,a
      0001E2 F5 64            [12]  833 	mov	(_timerIsp + 1),a
                                    834 ;	src\main.c:177: break;
                                    835 ;	src\main.c:180: case CMD_GET_DEVICEID:
      0001E4 80 59            [24]  836 	sjmp	00112$
      0001E6                        837 00105$:
                                    838 ;	src\main.c:181: ispRead4Bytes(READ_ID_TYPE);
      0001E6 75 82 0C         [24]  839 	mov	dpl,#0x0c
      0001E9 12 02 B3         [24]  840 	lcall	_ispRead4Bytes
                                    841 ;	src\main.c:182: uartBuf[8]  = temp4bytes.DID_low;
      0001EC 85 69 29         [24]  842 	mov	(_uartBuf + 0x0008),_temp4bytes
                                    843 ;	src\main.c:183: uartBuf[9]  = temp4bytes.DID_high;
      0001EF 85 6A 2A         [24]  844 	mov	(_uartBuf + 0x0009),(_temp4bytes + 0x0001)
                                    845 ;	src\main.c:187: uartBuf[10] = temp4bytes.PID_low;
      0001F2 85 6B 2B         [24]  846 	mov	(_uartBuf + 0x000a),(_temp4bytes + 0x0002)
                                    847 ;	src\main.c:188: uartBuf[11] = temp4bytes.PID_high;
      0001F5 85 6C 2C         [24]  848 	mov	(_uartBuf + 0x000b),(_temp4bytes + 0x0003)
                                    849 ;	src\main.c:192: sendPack();  
      0001F8 12 02 9D         [24]  850 	lcall	_sendPack
                                    851 ;	src\main.c:193: break;
                                    852 ;	src\main.c:195: case CMD_GET_FWVER:
      0001FB 80 42            [24]  853 	sjmp	00112$
      0001FD                        854 00106$:
                                    855 ;	src\main.c:196: calcChecksum();
      0001FD 12 02 60         [24]  856 	lcall	_calcChecksum
                                    857 ;	src\main.c:197: uartBuf[8] = FW_VERSION;
      000200 75 29 29         [24]  858 	mov	(_uartBuf + 0x0008),#0x29
                                    859 ;	src\main.c:198: sendPack();  
      000203 12 02 9D         [24]  860 	lcall	_sendPack
                                    861 ;	src\main.c:199: break;
                                    862 ;	src\main.c:201: case CMD_READ_CONFIG:
      000206 80 37            [24]  863 	sjmp	00112$
      000208                        864 00107$:
                                    865 ;	src\main.c:202: readConfig();
      000208 12 02 E7         [24]  866 	lcall	_readConfig
                                    867 ;	src\main.c:203: break;
                                    868 ;	src\main.c:205: case CMD_ERASE_ALL:
      00020B 80 32            [24]  869 	sjmp	00112$
      00020D                        870 00108$:
                                    871 ;	src\main.c:206: eraseAprom();
      00020D 12 03 08         [24]  872 	lcall	_eraseAprom
                                    873 ;	src\main.c:207: calcChecksum();
      000210 12 02 60         [24]  874 	lcall	_calcChecksum
                                    875 ;	src\main.c:208: sendPack();
      000213 12 02 9D         [24]  876 	lcall	_sendPack
                                    877 ;	src\main.c:209: break;
                                    878 ;	src\main.c:211: case CMD_UPDATE_APROM:
      000216 80 27            [24]  879 	sjmp	00112$
      000218                        880 00109$:
                                    881 ;	src\main.c:212: eraseAprom();
      000218 12 03 08         [24]  882 	lcall	_eraseAprom
                                    883 ;	src\main.c:213: flashAddress = 0;
      00021B E4               [12]  884 	clr	a
      00021C F5 65            [12]  885 	mov	_flashAddress,a
      00021E F5 66            [12]  886 	mov	(_flashAddress + 1),a
                                    887 ;	src\main.c:214: programSize  = uartBuf[12];
      000220 85 2D 67         [24]  888 	mov	_programSize,(_uartBuf + 0x000c)
                                    889 ;	1-genFromRTrack replaced	mov	(_programSize + 1),#0x00
      000223 F5 68            [12]  890 	mov	(_programSize + 1),a
                                    891 ;	src\main.c:215: programSize |= uartBuf[13] << 8;
      000225 AF 2E            [24]  892 	mov	r7,(_uartBuf + 0x000d)
      000227 7E 00            [12]  893 	mov	r6,#0x00
      000229 AC 67            [24]  894 	mov	r4,_programSize
      00022B AD 68            [24]  895 	mov	r5,(_programSize + 1)
      00022D EC               [12]  896 	mov	a,r4
      00022E 42 06            [12]  897 	orl	ar6,a
      000230 ED               [12]  898 	mov	a,r5
      000231 42 07            [12]  899 	orl	ar7,a
      000233 8E 67            [24]  900 	mov	_programSize,r6
      000235 8F 68            [24]  901 	mov	(_programSize + 1),r7
                                    902 ;	src\main.c:216: isApromUpdate = TRUE;
                                    903 ;	assignBit
      000237 D2 02            [12]  904 	setb	_isApromUpdate
                                    905 ;	src\main.c:217: writeAprom(FIRST);
      000239 75 82 10         [24]  906 	mov	dpl,#0x10
      00023C 12 03 41         [24]  907 	lcall	_writeAprom
                                    908 ;	src\main.c:264: }
      00023F                        909 00112$:
                                    910 ;	src\main.c:265: timerUart = 0;
      00023F 75 62 00         [24]  911 	mov	_timerUart,#0x00
                                    912 ;	src\main.c:266: indexRx = 0;
      000242 75 61 00         [24]  913 	mov	_indexRx,#0x00
                                    914 ;	src\main.c:267: ENABLE_GLOBAL_INTERRUPT;
                                    915 ;	assignBit
      000245 D2 AF            [12]  916 	setb	_EA
      000247                        917 00114$:
                                    918 ;	src\main.c:270: if (timerUartOver) 
      000247 30 00 03         [24]  919 	jnb	_timerUartOver,00116$
                                    920 ;	src\main.c:271: indexRx = 0;
      00024A 75 61 00         [24]  921 	mov	_indexRx,#0x00
      00024D                        922 00116$:
                                    923 ;	src\main.c:273: if (timerIspOver)
      00024D 20 01 03         [24]  924 	jb	_timerIspOver,00191$
      000250 02 01 9F         [24]  925 	ljmp	00120$
      000253                        926 00191$:
                                    927 ;	src\main.c:276: _APROM:
      000253                        928 00122$:
                                    929 ;	src\main.c:277: DISABLE_GLOBAL_INTERRUPT;
                                    930 ;	assignBit
      000253 C2 AF            [12]  931 	clr	_EA
                                    932 ;	src\main.c:287: TA = 0xAA; TA = 0x55;
      000255 75 C7 AA         [24]  933 	mov	_TA,#0xaa
      000258 75 C7 55         [24]  934 	mov	_TA,#0x55
                                    935 ;	src\main.c:289: CHPCON = 0x80;
      00025B 75 9F 80         [24]  936 	mov	_CHPCON,#0x80
                                    937 ;	src\main.c:291: while(1);
      00025E                        938 00124$:
                                    939 ;	src\main.c:292: }
      00025E 80 FE            [24]  940 	sjmp	00124$
                                    941 	.area CSEG    (CODE)
                                    942 	.area CONST   (CODE)
                                    943 	.area XINIT   (CODE)
                                    944 	.area CABS    (ABS,CODE)
