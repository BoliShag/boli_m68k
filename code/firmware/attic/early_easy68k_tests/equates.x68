*-----------------------------------------------------------
* EQUates for Rosco_m68k
*
* Copyright (c)2019 Ross Bamford. See LICENSE
*-----------------------------------------------------------

; Memory layout
RAMBASE     equ     $0
RAMLIMIT    equ     $100000

IOBASE      equ     $F80000

ROMBASE     equ     $FC0000

; Initialisation
INIT_SSP    equ     RAMLIMIT
INIT_PC     equ     ROMBASE+$400

; MFP Location
MFPBASE     equ     IOBASE
; MFP GPIO Registers
MFP_GPDR    equ     MFPBASE+$01
MFP_AER     equ     MFPBASE+$03
MFP_DDR     equ     MFPBASE+$05
; MFP Interrupt Controller Registers
MFP_IERA    equ     MFPBASE+$07
MFP_IERB    equ     MFPBASE+$09
MFP_IPRA    equ     MFPBASE+$0B
MFP_IPRB    equ     MFPBASE+$0D
MFP_ISRA    equ     MFPBASE+$0F
MFP_ISRB    equ     MFPBASE+$11
MFP_IMRA    equ     MFPBASE+$13
MFP_IMRB    equ     MFPBASE+$15
MFP_VR      equ     MFPBASE+$17
; MFP Timer Registers
MFP_TACR    equ     MFPBASE+$19
MFP_TBCR    equ     MFPBASE+$1B
MFP_TCDCR   equ     MFPBASE+$1D
MFP_TADR    equ     MFPBASE+$1F
MFP_TBDR    equ     MFPBASE+$21
MFP_TCDR    equ     MFPBASE+$23
MFP_TDDR    equ     MFPBASE+$25
; MFP USART Registers
MFP_SCR     equ     MFPBASE+$27
MFP_UCR     equ     MFPBASE+$29
MFP_RSR     equ     MFPBASE+$2B
MFP_TSR     equ     MFPBASE+$2D
MFP_UDR     equ     MFPBASE+$2F




*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
