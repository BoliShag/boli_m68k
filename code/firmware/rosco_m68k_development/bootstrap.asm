;------------------------------------------------------------
;                                  ___ ___ _   
;  ___ ___ ___ ___ ___       _____|  _| . | |_ 
; |  _| . |_ -|  _| . |     |     | . | . | '_|
; |_| |___|___|___|___|_____|_|_|_|___|___|_,_| 
;                     |_____|       firmware v2
;------------------------------------------------------------
; Copyright (c)2019-2021 Ross Bamford and contributors
; See top-level LICENSE.md for licence information.
;
; This is the main bootstrap code for the system. 
; It sets up the exception handlers, initializes the hardware
; including the UART and system timers, sets up the basic
; info in the System Data Block, enables interrupts and 
; calls the main stage1 loader (in main1.c).
;------------------------------------------------------------
    include "../../shared/equates.S"
    include "equates.asm"

    section .text

RESET:
    dc.l    RAMLIMIT                    ; 00: Stack (top of on-board RAM)
    dc.l    START                       ; 01: Initial PC (start of ROM code)
    
VECTORS:
    dc.l    BUS_ERROR_HANDLER           ; 02: Bus Error
    dc.l    ADDRESS_ERROR_HANDLER       ; 03: Address Error
    dc.l    ILLEGAL_INSTRUCTION_HANDLER ; 04: Illegal Instruction
    dc.l    GENERIC_HANDLER             ; 05: Divide by Zero
    dc.l    GENERIC_HANDLER             ; 06: CHK Instruction
    dc.l    GENERIC_HANDLER             ; 07: TRAPV Instruction
    dc.l    GENERIC_HANDLER             ; 08: Privilege Violation
    dc.l    GENERIC_HANDLER             ; 09: Trace
    dc.l    GENERIC_HANDLER             ; 0A: Line 1010 Emulator
    dc.l    GENERIC_HANDLER             ; 0B: Line 1111 Emulator
    dc.l    GENERIC_HANDLER             ; 0C: Reserved
    dc.l    GENERIC_HANDLER             ; 0D: Reserved
    dc.l    GENERIC_HANDLER             ; 0E: Format error (MC68010 Only)
    dc.l    GENERIC_HANDLER             ; 0F: Uninitialized Vector
    
    dcb.l   8,GENERIC_HANDLER           ; 10-17: Reserved
    
    dc.l    GENERIC_HANDLER             ; 18: Spurious Interrupt
    
    dcb.l   7,GENERIC_HANDLER           ; 19-1F: Level 1-7 Autovectors
    dcb.l   13,GENERIC_HANDLER          ; 20-2C: TRAP Handlers (unused)
    dc.l    GENERIC_HANDLER             ; 2D: TRAP#13 handler (replaced later)
    dc.l    TRAP_14_HANDLER             ; 2E: TRAP#14 handler
    dc.l    GENERIC_HANDLER             ; 2F: TRAP#15 handler (replaced later)
    dcb.l   16,GENERIC_HANDLER          ; 30-3F: Remaining Reserved vectors
    dcb.l   4,GENERIC_HANDLER           ; 40-43: MFP GPIO #0-3 (Not used)
    dc.l    GENERIC_HANDLER             ; 44: MFP Timer D (Interrupt not used)
    dc.l    TICK_HANDLER                ; 45: MFP Timer C (System tick)
    dcb.l   2,GENERIC_HANDLER           ; 46-47: MFP GPIO #4-5 (Not used)
    dc.l    GENERIC_HANDLER             ; 48: MFP Timer B (Not used)
    dc.l    GENERIC_HANDLER             ; 49: Transmitter error (Not used)
    dc.l    GENERIC_HANDLER             ; 4A: Transmitter empty (Replaced later)
    dc.l    GENERIC_HANDLER             ; 4B: Receiver error (Replaced later)
    dc.l    GENERIC_HANDLER             ; 4C: Receiver buffer full (Replaced later)
    dc.l    GENERIC_HANDLER             ; 4D: Timer A (Not used)
    dcb.l   2,GENERIC_HANDLER           ; 4E-4F: MFP GPIO #6-7 (Not used)
    dcb.l   176,GENERIC_HANDLER         ; 50-FF: Unused user vectors
    
VEC_END:
VERSION:
    dc.l    RELEASE_VER                 ; Embed the release version in ROM

; First of all, copy the exception table to RAM at 0x0.
; 68010 VBR defaults to that location anyway for 68000 compatibility.
START::
    or.w    #$0700,SR                 ; Disable interrupts for now    
    move.l  #VEC_END,A0               ; Start into A0 (source)
    move.l  #$400,A1                  ; 0x400 into A1 (destination)

.ISR_COPY_LOOP:    
    move.l  A1,D0                     ; Have we reached destination zero?
    beq.s   .ISR_COPY_DONE            ; Halt if so
    
    move.l  -(A0),-(A1)               ; Copy long source to dest, with predecrement.
    bra.s   .ISR_COPY_LOOP            ; Next iteration

.ISR_COPY_DONE:
    bsr.w   INITMFP                   ; Initialise MC68901

    ifnd NO_68681
    bsr.w   INITDUART                 ; Initialise MC68681
    endif
    bsr.w   INITSDB                   ; Initialise System Data Block
    bsr.w   INITMEMCOUNT              ; Initialise memory count in SDB    
    bsr.s   PRINT_BANNER

    bclr.b  #1,MFP_GPDR               ; Turn on GPIO #1 (Red LED)  
    and.w   #$F2FF,SR                 ; Enable interrupts (except video)

    jmp     linit                     ; Init C land, calls through to main1

; main1 is noreturn, so That's All, Folks(tm).

;------------------------------------------------------------
; Subroutines
;
; Show banner
;
; Trashes: D0, MFP_UDR
; Modifies: A0 (Will point to address after null terminator)
PRINT_BANNER:
    lea.l   SZ_BANNER0,A0             ; Load first string into A0
    move.l  EFP_PRINTLN,A3            ; Load function into A3
    
    jsr     (A3)                      ; Print all the banner lines
    
    rts                               ; We're done

; PRINT null-terminated string pointed to by A0
;
; Only used directly during early init; Becomes the default implementation
; of FW_PRINT (pointed to by the EFP table) and likely replaced later.
;
; Trashes: D0, MFP_UDR
; Modifies: A0 (Will point to address after null terminator)
EARLY_PRINT_MFP:
    move.b  (A0)+,D0                  ; Get next character
    beq.s   .PRINT_DONE               ; ... we're done if null.

.BUFF_WAIT:
    btst.b  #7,MFP_TSR                ; Is transmit buffer empty?
    beq.s   .BUFF_WAIT                ; Busywait if not
    
    move.b  D0,MFP_UDR                ; ... otherwise, give character to the MFP
    bra.s   EARLY_PRINT_MFP           ; and loop
.PRINT_DONE:    
    rts                               ; We're done
    

    ifnd NO_68681
EARLY_PRINT_DUART:
    move.l  A1,-(A7)                  ; Save A1...
    move.l  SDB_UARTBASE,A1           ; ... and get DUART base address

.LOOP
    move.b  (A0)+,D0                  ; Get next character
    beq.s   .PRINT_DONE               ; ... we're done if its null.

.BUFF_WAIT:
    btst.b  #3,DUART_SRA(A1)
    beq.s   .BUFF_WAIT
    move.b  D0,DUART_TBA(A1)
    
    bra.s   .LOOP                     ; and loop
.PRINT_DONE:
    move.l  (A7)+,A1                  ; Restore A1
    rts                               ; We're done
    endif
 
; PRINT null-terminated string pointed to by A0 followed by CRLF.
;
; Only used directly during early init; Becomes the default implementation
; of FW_PRINT (pointed to by the EFP table) and likely replaced later.
;
; Trashes: D0, MFP_UDR
; Modifies: A0 (Will point to address after null terminator)
EARLY_PRINTLN_MFP:
    bsr.s   EARLY_PRINT_MFP           ; Print callers message
    move.l  A0,-(A7)                  ; Stash A0 to restore later
    
    lea     SZ_CRLF,A0                ; Load CRLF...
    bsr.s   EARLY_PRINT_MFP           ; ... and print it
        
    move.l  (A7)+,A0                  ; Restore A0
    rts

    ifnd NO_68681
EARLY_PRINTLN_DUART:
    bsr.s   EARLY_PRINT_DUART         ; Print callers message
    move.l  A0,-(A7)                  ; Stash A0 to restore later
    
    lea     SZ_CRLF,A0                ; Load CRLF...
    bsr.s   EARLY_PRINT_DUART         ; ... and print it
        
    move.l  (A7)+,A0                  ; Restore A0
    rts
    endif 

; Initialise System Data Block
;
INITSDB:
    move.l  #$B105D47A,$400           ; Magic at $400
    move.l  #$C001C001,$404           ; OK OSHI Code at $404
    move.w  #50,$408                  ; Heartbeat flash counter at 50 (1 per second)
    move.w  #$FF00,$40A               ; Initial system flags word (enable LEDs and CTS)
    move.l  #0,$40C                   ; Zero upticks

    ifnd NO_68681
    ; Do we have a 68681?
    tst.b   D5
    beq.s   .USEMFP

    ; Setup default implementations in EFP table.
.USEDUART:
    move.l  #EARLY_PRINT_DUART,EFP_PRINT
    move.l  #EARLY_PRINTLN_DUART,EFP_PRINTLN
    move.l  #SENDCHAR_DUART,EFP_PRINTCHAR
    move.l  #SENDCHAR_DUART,EFP_SENDCHAR
    move.l  #RECVCHAR_DUART,EFP_RECVCHAR
    move.l  #CHECKCHAR_DUART,EFP_CHECKCHAR
    bra.s   .COMMON
    
    endif

.USEMFP:
    move.l  #EARLY_PRINT_MFP,EFP_PRINT
    move.l  #EARLY_PRINTLN_MFP,EFP_PRINTLN
    move.l  #SENDCHAR_MFP,EFP_PRINTCHAR
    move.l  #SENDCHAR_MFP,EFP_SENDCHAR
    move.l  #RECVCHAR_MFP,EFP_RECVCHAR
    move.l  #CHECKCHAR_MFP,EFP_CHECKCHAR
    
.COMMON
    move.l  #HALT,EFP_HALT
    move.l  #ANSI_MOVEXY,EFP_MOVEXY
    move.l  #ANSI_CLRSCR,EFP_CLRSCR
    move.l  #.RETURN,EFP_SETCURSOR     ; No-op for default SET CURSOR

.RETURN
    rts


; Count size of the first block of contiguous memory,
; and store it in the SDB.
INITMEMCOUNT:
.TESTVALUE equ $12345678
.BLOCKSIZE equ $80000
.MEMTOP    equ $F80000
    move.l  #.BLOCKSIZE,A0
.LOOP
    move.l  #.TESTVALUE,(A0)
    move.l  (A0),D0
    cmp.l   #.TESTVALUE,D0
    bne.s   .DONE

    cmp.l   #.MEMTOP,A0
    beq.s   .DONE

    add.l   #.BLOCKSIZE,A0
    bra.s   .LOOP

.DONE
    move.l  A0,$414
    rts


; Initialise MFP
;
; Notes on MFP_TDDR value and baud-rate:
; 
; Setting 1 will give 921.6KHZ, which divides to 28800 baud
; Setting 2 will give 460.8KHz, which divides to 14400 baud
;
; However, those baud rates are non-standard (i.e. non-POSIX) and support is patchy.
; Whether they work will depend on your USB<->Serial converter and OS.
; Minicom doesn't support them, Picocom does. C-Kermit doesn't.
;
; Trashes: D0
; Modifies: MFP Regs
INITMFP:
    ; GPIOs
    move.b  #$FF,MFP_DDR              ; All GPIOs are output
    
    ; Timer setup - Timer D controls serial clock, C is kernel tick
    move.b  #$B8,MFP_TCDR             ; Timer C count is 184 for 50Hz (interrupt on rise and fall so 100Hz)
    move.b  #$03,MFP_TDDR             ; Timer D count is 3 for 307.2KHz, divided to 9600 baud
    move.b  #$71,MFP_TCDCR            ; Enable timer C with /200 and D with /4 prescaler
    
    ; USART setup
    move.b  #$88,MFP_UCR              ; /16 clock, async, 8N1
    move.b  #$05,MFP_TSR              ; Set pin state high and enable transmitter

    ; Interrupt setup - Enable timer C interrupt for kernel tick
    move.l  #MFP_VECBASE,D0           ; Set up the base MFP vector at 0x40 (first 16 user vectors)...
    or.l    #8,D0                     ; ... and set software-end-of-interrupt mode
    move.b  D0,MFP_VR                 ; ... then write to MFP vector register
    or.b    #$20,MFP_IERB             ; Enable Timer C interrupt, but leave it masked for now
                                      ; (kmain will call START_HEART later)
   
    move.l  #MFPBASE,SDB_UARTBASE     ; Default UART starts out as MFP, may get overwritten later... 
    ; Indicate success and return
    rts


    ifnd NO_68681
; Initialise MC68681 DUART if present
;
; If an MC68681 is found, this will set D5 to 1. Otherwise, D5 will be 0.
; This is used to signal INITSDB that it should use the DUART vectors instead of
; the MFP ones.
INITDUART:
    ; Let's try the r2 DUART board first...
    move.l  #DUART_BASE_R2,A0         ; Set R2 the base address
    bsr.s   INITDUART_ATBASE          ; Try detect / and basic init
    tst.b   D5                        ; Did we find it?
    beq.s   .TRY_R1                   ; If no, try the R1 instead.

    ; Else, we found an r2. Set it up for 115200
    move.b  #$A0,DUART_CRA(A0)        ; Enable extended TX rates
    move.b  #$80,DUART_CRA(A0)        ; Enable extended RX rates
    move.b  #$80,DUART_ACR(A0)        ; Select bit rate set 2
    move.b  #$88,DUART_CSRA(A0)       ; 115K2
    bra.s   .COMMON_INIT

.TRY_R1
    move.l  #DUART_BASE_R1,A0         ; Set the R1 base address
    bsr.s   INITDUART_ATBASE          ; Try detect / and basic init
    tst.b   D5                        ; Did we find it?
    beq.s   .DONE                     ; If no, we don't have a 68681

    ; Else, we found an r1. Set it up for 115200
    move.b  #$60,DUART_ACR(A0)        ; Set 0, Counter, X1/X2, /16
    move.b  DUART_CRA(A0),D0          ; Enable undocumented rates
    move.b  #$66,DUART_CSRA(A0)       ; 1200 per spec, uses counter instead

    move.b  #0,DUART_CUR(A0)          ; Counter high: 0
    move.b  #2,DUART_CLR(A0)          ; Counter  low: 2  (115.2KHz)
    move.b  R_STARTCNTCMD(A0),D0      ; Start count

.COMMON_INIT
    move.l  A0,SDB_UARTBASE           ; Store the base address in SDB

    move.b  #$13,DUART_MR1A(A0)       ; (Rx RTS, RxRDY, Char, No parity, 8 bits)
    move.b  #$07,DUART_MR2A(A0)       ; (Normal, No TX CTS/RTS, 1 stop bit)

    ; Debug - output clocks on OP2 for scope
    ;move.b  #%00000010,DUART_OPCR(A0)  ; RxCA (1x) on OP2, TxCA (1x) on OP3
    move.b  #%00000000,DUART_OPCR(A0)  ; All output port disabled

    move.b  #%00000101,DUART_CRA(A0)   ; Enable TX/RX

.DONE
    rts

; Try to initialise the DUART at the base address in A0.
INITDUART_ATBASE:
    move.b  #0,D5                     ; Indicate no MC68681 by default

    ; On r1.2, not having a 68681 will generate a bus error. We can look
    ; for this on the first access, and if we get one, just bail immediately.
    move.b  #0,BERR_FLAG              ; Zero bus error flag

    move.l  $8,BERR_SAVED             ; Save the original bus error handler
    move.l  #BERR_HANDLER,$8          ; Install temporary bus error handler

    move.b  #$0,DUART_IMR(A0)         ; Mask all interrupts

    ; If the first write generated a bus error, we may as well fail fast...
    tst.b   BERR_FLAG                 ; Was there a bus error?
    bne.s   .DONE                     ; Bail now if so...

    ; We now know that _something_ is present in the 68681 IO space, and 
    ; is capable of DTACK generation. Let's see if it looks like 68681...
    ; 
    ; IVR is a convenient register that allows both read and write. We'll check its
    ; initial value is as expected, then set ensure the initial read wasn't
    ; a fluke. Note that, with the basic 68681 board, vectored interrupts are 
    ; never used, so setting this has no effect - it's just a test. 
    ;
    ; This is hardly definitive, but should be good-enough for our purposes...
    ;
    move.b  DUART_IVR(A0),D0          ; Get IVR - Should be 0x0F at reset
    cmp.b   #$0F,D0                   
    bne.s   .DONE                     ; If not as expected, no DUART...
 
    move.b  #$50,DUART_IVR(A0)        ; To further verify, try to set IVR
    move.b  DUART_IVR(A0),D0          ; And then check it was set...
    cmp.b   #$50,D0                   ; to 0x50.
    bne.s   .DONE                     ; If not as expected, no DUART...

    ; If any of that generated a bus error, then it doesn't appear to be a 68681...
    tst.b   BERR_FLAG                 ; Was there a bus error?
    bne.s   .DONE                     ; Bail now if so...

    ; Looks like we successfully detected a 68681!
    move.b  #1,D5                     ; Set D5 to indicate to INITSDB that there's a DUART present...
 .DONE:
    move.l  BERR_SAVED,$8             ; Restore bus error handler
    rts
    endif

; Temporary bus error handler, in case no MC68681 is installed
BERR_HANDLER::
    move.l  D0,-(A7)
    move.w  ($A,A7),D0                ; Get format
    and.w   #$F000,D0                 ; Mask vector
    cmp.w   #$8000,D0                 ; Is it an 010 BERR frame?
    bne.w   .NOT010                   ; May be a longer (later CPU) frame if not
                                      ; For 020, this would be either A000 or B000 -
                                      ; for our purposes, they are equivalent. 
                                      ; TODO this might need checking again on later
                                      ; CPUs!

    move.w  ($C,A7),D0                ; If we're here, it's an 010 frame...                
    bset    #15,D0                    ; ... so just set the RR (rerun) flag
    move.w  D0,($C,A7)

    move.l  SDB_CPUINFO,D0            ; Get CPUINFO from SDB
    and.l   #$1FFFFFFF,D0             ; Zero high three bits
    or.l    #$20000000,D0             ; Set them to indicate 010
    move.l  D0,SDB_CPUINFO            ; And update the SDB 
    
    bra.s   .DONE 

.NOT010:
    cmp.w   #$A000,D0                 ; Is it an 020 BERR frame?
    beq.w   .IS020 
    cmp.w   #$B000,D0
    beq.w   .IS020 

    ; If we're here, assume it's a 68000.
    move.l  SDB_CPUINFO,D0            ; Get CPUINFO from SDB
    and.l   #$1FFFFFFF,D0             ; Zero high three bits
    move.l  D0,SDB_CPUINFO            ; And update the SDB 

    bra.s   .DONE

.IS020
    move.w  ($E,A7),D0                ; If we're here, it's an 020 frame...                
    bclr    #8,D0                     ; ... we only care about data faults here... Hopefully :D
    move.w  D0,($E,A7)    

    move.l  SDB_CPUINFO,D0            ; Get CPUINFO from SDB
    and.l   #$1FFFFFFF,D0             ; Zero high three bits
    or.l    #$40000000,D0             ; Set them to indicate 020
    move.l  D0,SDB_CPUINFO            ; And update the SDB

.DONE
    move.b  #1,BERR_FLAG
    move.l  (A7)+,D0
    rte
    

; Convenience to install temporary BERR handler from C
; Zeroes bus error flag (at BERR_FLAG) and stores old handler
; for a subsequent RESTORE_BERR_HANDLER.
INSTALL_TEMP_BERR_HANDLER::
    move.b  #0,BERR_FLAG              ; Zero bus error flag

    move.l  $8,BERR_SAVED             ; Save the original bus error handler
    move.l  #BERR_HANDLER,$8          ; Install temporary bus error handler
    rts

; Convenience to restore BERR handler from C, after a
; call to INSTALL_TEM_BERR_HANDLER.
RESTORE_BERR_HANDLER::
    move.l  BERR_SAVED,$8             ; Restore bus error handler
    rts

    
;------------------------------------------------------------
; Routines for include/machine.h
HALT::
    bsr.s   STOP_HEART
    stop    #$2700
    bra.s   HALT

SET_INTR::
    ; TODO Not yet implemented
    rts

START_HEART::
    bset.b  #5,MFP_IMRB               ; Unmask Timer C interrupt
    rts

STOP_HEART::
    bclr.b  #5,MFP_IMRB               ; Mask Timer C interrupt
    rts

;------------------------------------------------------------
; Exception handlers    
TICK_HANDLER:
    move.l  D0,-(A7)                  ; Save D0
    move.l  D1,-(A7)                  ; Save D1

    ; Increment upticks
    move.l  $40C,D0                   ; Read SDB dword at 12
    add.l   #1,D0                     ; Increment
    move.l  D0,$40C                   ; And write back
    
    ; Heartbeat
    move.w  $408,D0                   ; Read SDB word at 8
    tst.w   D0                        ; Is it zero?
    bne.s   .TICK_HANDLER_DONE        ; Done if not
    
    ; counted to zero, so toggle indicator 0 (if allowed) 
    ; and reset counter
    move.b  $40A,D0                   ; Get sysflags (high byte)
    move.b  MFP_GPDR,D1               ; Get GPDR
    eor.b   #1,D1                     ; Toggle bit 0
    and.b   D0,D1                     ; Mask with flags
    move.b  D1,MFP_GPDR               ; Set GPDR
    
    move.w  #50,D0                    ; Reset counter

.TICK_HANDLER_DONE:
    sub.w   #$1,D0                    ; Decrement counter...
    move.w  D0,$408                   ; ... and write back to SDB
    move.l  (A7)+,D1                  ; Restore D1
    move.l  (A7)+,D0                  ; Restore D0
    move.b  #~$20,MFP_ISRB            ; Clear interrupt-in-service
    rte                               ; We're done

    
; Call busywait from C code...
BUSYWAIT_C::
    move.l  (4,A7),D0
    jmp     BUSYWAIT

BUS_ERROR_HANDLER:
    or.w    #0700,SR                  ; Disable exceptions

    move.b  #0,MFP_IERA               ; Disable MFP interrupts
    move.b  #0,MFP_IERB               
    move.b  #$FF,MFP_DDR              ; All GPIOs are output

    move.b  #0,MFP_IERA
    move.b  #0,MFP_IERB

    move.b  #$FD,MFP_GPDR             ; Turn on red LED
    move.l  #100000,D0                ; Wait a while
    bsr.s   BUSYWAIT

    move.b  #$FF,MFP_GPDR             ; Turn off red LED
    move.l  #200000,D0                ; Wait a while
    bsr.s   BUSYWAIT
    bra.s   BUS_ERROR_HANDLER
    
    rte                               ; Never reached

; Busywait - expects a delay in D0, returns when D0 gets to 0 
;
; Trashes: D0
BUSYWAIT:
    sub.l   #1,D0
    tst.l   D0
    bne.s   BUSYWAIT
    rts

ADDRESS_ERROR_HANDLER:
    or.w    #0700,SR                  ; Disable exceptions
    
    move.b  #0,MFP_IERA               ; Disable MFP interrupts
    move.b  #0,MFP_IERB               
    move.b  #$FF,MFP_DDR              ; All GPIOs are output
    
    move.b  #$FD,MFP_GPDR             ; Turn on red LED
    move.l  #50000,D0                 ; Wait a while
    bsr.s   BUSYWAIT

    move.b  #$FF,MFP_GPDR             ; Turn off red LED
    move.l  #50000,D0                 ; Wait a while
    bsr.s   BUSYWAIT
    
    move.b  #$FD,MFP_GPDR             ; Turn on red LED
    move.l  #50000,D0                 ; Wait a while
    bsr.w   BUSYWAIT

    move.b  #$FF,MFP_GPDR             ; Turn off red LED
    move.l  #200000,D0                ; Wait a while
    bsr.w   BUSYWAIT
    bra.s   ADDRESS_ERROR_HANDLER
    
    rte                               ; Never reached

ILLEGAL_INSTRUCTION_HANDLER:
    or.w    #0700,SR                  ; Disable exceptions

    move.b  #0,MFP_IERA               ; Disable MFP interrupts
    move.b  #0,MFP_IERB               
    move.b  #$FF,MFP_DDR              ; All GPIOs are output

    move.b  #$FD,MFP_GPDR             ; Turn on red LED
    move.l  #50000,D0                 ; Wait a while
    bsr.w   BUSYWAIT

    move.b  #$FF,MFP_GPDR             ; Turn off red LED
    move.l  #50000,D0                 ; Wait a while
    bsr.w   BUSYWAIT
    
    move.b  #$FD,MFP_GPDR             ; Turn on red LED
    move.l  #50000,D0                 ; Wait a while
    bsr.w   BUSYWAIT

    move.b  #$FF,MFP_GPDR             ; Turn off red LED
    move.l  #50000,D0                 ; Wait a while
    bsr.w   BUSYWAIT
    
    move.b  #$FD,MFP_GPDR             ; Turn on red LED
    move.l  #50000,D0                 ; Wait a while
    bsr.w   BUSYWAIT

    move.b  #$FF,MFP_GPDR             ; Turn off red LED
    move.l  #200000,D0                ; Wait a while
    bsr.w   BUSYWAIT
    bra.w   ILLEGAL_INSTRUCTION_HANDLER
    
    rte                               ; Never reached

GENERIC_HANDLER:
    move.l  #$2BADB105,$404
    rte


; Convenience SEND/RECV char functions, using the EFP table.
; These are provided for use by the Easy68k syscalls.S
;
; TODO these should be moved to syscalls_asm.S!
SENDCHAR::
    move.l  A3,-(A7)
    move.l  EFP_SENDCHAR,A3
    jsr     (A3)
    move.l  (A7)+,A3
    rts

RECVCHAR::
    move.l  A3,-(A7)
    move.l  EFP_RECVCHAR,A3
    jsr     (A3)
    move.l  (A7)+,A3
    rts

; Check if a character is ready to receive via UART
;
; Trashes: UART registers
; Modifies: D0.B (return = 0 if no character waiting, nonzero otherwise)
    ifnd NO_68681
CHECKCHAR_DUART:
    move.l  A0,-(A7)              ; Stash A0
    move.l  SDB_UARTBASE,A0       ; Get DUART base address
    move.b  DUART_SRA(A0),D0      ; Get RSR
    andi.b  #1,D0                 ; And with buffer full bit
    move.l  (A7)+,A0              ; Restore A0
    rts
    endif

CHECKCHAR_MFP:
    move.b  MFP_RSR,D0            ; Get RSR
    andi.b  #$80,D0               ; And with buffer full bit
    rts


; Send a single character via UART
;
; Trashes: MFP_UDR
; Modifies: Nothing
    ifnd NO_68681
SENDCHAR_DUART:
    move.l  A0,-(A7)              ; Stash A0
    move.l  SDB_UARTBASE,A0       ; Get DUART base address
.BUSYLOOP
    btst.b  #3,DUART_SRA(A0)
    beq.s   .BUSYLOOP
    move.b  D0,DUART_TBA(A0)
    move.l  (A7)+,A0              ; Restore A0
    rts
    endif

SENDCHAR_MFP:
    move.l  D1,-(A7)              ; Save D1
    move.l  D2,-(A7)              ; Save D2

    move.b  $40A,D2               ; Get sysflags (high byte)
    move.b  MFP_GPDR,D1           ; Get GPDR
    or.b    #$80,D1               ; Raise (inhibit) bit 7 (RTS)
    and.b   D2,D1                 ; Mask with flags
    move.b  D1,MFP_GPDR           ; Set GPDR

.BEGIN    
    move.b  MFP_TSR,D1            ; Get TSR
    btst    #7,D1                 ; Is buffer empty bit set?
    beq.s   .BEGIN                ; No - loop until it is

    move.b  D0,MFP_UDR            ; Put func arg in UDR
    move.l  (A7)+,D2              ; Restore D2
    move.l  (A7)+,D1              ; Restore D1
    rts


; Receive a single character via UART.
; Ignores overrun errors.
;
; Trashes: MFP_UDR
; Modifies: D0 (return)
    ifnd NO_68681
RECVCHAR_DUART:
    move.l  A0,-(A7)              ; Stash A0
    move.l  SDB_UARTBASE,A0       ; Get DUART base address
.BUSYLOOP
    btst.b  #0,DUART_SRA(A0)
    beq.s   .BUSYLOOP
    move.b  DUART_RBA(A0),D0
    move.l  (A7)+,A0              ; Restore A0
    rts
    endif

RECVCHAR_MFP:
    move.l  D1,-(A7)              ; Store D1
    move.b  $40A,D1               ; Get sysflags (high byte)
    
    move.b  MFP_GPDR,D0           ; Get GPDR
    and.b   #$7F,D0               ; Lower bit 7 (RTS)
    and.b   D1,D0                 ; Mask with flags
    move.b  D0,MFP_GPDR           ; Set GPDR

.BEGIN
    move.b  MFP_RSR,D0            ; Get RSR
    btst    #7,D0                 ; Is buffer_full bit set?
    bne.s   .GOTCHR               ; Yes - Go to receive character

    btst    #6,D0                 ; Else, do we have an overrun error?
    bne.s   .GOTERR               ; .. Yes - handle that
    bra.s   .BEGIN                ; .. No - Just loop

.GOTERR
    move.b  MFP_UDR,D0            ; Empty buffer
    move.b  MFP_GPDR,D0           ; Get GPDR
    eor.b   #2,D0                 ; Toggle I1
    and.b   D1,D0                 ; Mask with flags
    move.b  D0,MFP_GPDR           ; Set GPDR
    bra.s   .BEGIN                ; And continue testing...
    
.GOTCHR
    move.b  MFP_UDR,D0            ; Get the data
    move.l  (A7)+,D1              ; Restore D1
    rts


;------------------------------------------------------------
; Consts 
    section .rodata

SZ_BANNER0      dc.b    $D, $A, $1B, "[1;33m                                 ___ ___ _", $D, $A
SZ_BANNER1      dc.b    " ___ ___ ___ ___ ___       _____|  _| . | |_ ", $D, $A
SZ_BANNER2      dc.b    "|  _| . |_ -|  _| . |     |     | . | . | '_|", $D, $A
SZ_BANNER3      dc.b    "|_| |___|___|___|___|_____|_|_|_|___|___|_,_|", $D, $A
SZ_BANNER4      dc.b    "                    |_____|", $1B, "[1;30m  Firmware 2.0.DEV", $1B, "[0m", $D, $A, 0

SZ_CRLF         dc.b    $D, $A, 0

