OUTPUT_FORMAT("elf32-m68k")
ENTRY(START)

/* Board memory map */
MEMORY
{
  BASERAM : org = 0x00000000, l = 1M
  ROMSPC  : org = 0x00E00000, l = 1M
  IOSPC   : org = 0x00F00000, l = 1M
}

/* Installed flash memory map */
MEMORY
{
  FLASH   : org = ORIGIN(ROMSPC), l = 256K  /* Minimum flash chip size */
}

/* Firmware RAM map */
MEMORY
{
  VECTS   : org = 0x00000000, l = 0x000400
  SDB     : org = 0x00000400, l = 0x000020
  EFPT    : org = 0x00000420, l = 0x0000E0
  VDA     : org = 0x00000500, l = 0x000C80
  KRES1   : org = 0x00001180, l = 0x000680
  KRES2   : org = 0x00001800, l = 0x000800
  UMEM    : org = 0x00002000, l = LENGTH(BASERAM) - ORIGIN(BASERAM) - ORIGIN(UMEM)
}

PROVIDE(RAMBASE         = ORIGIN(BASERAM));
PROVIDE(RAMLIMIT        = ORIGIN(UMEM)    + LENGTH(UMEM));

PROVIDE(_FIRMWARE_REV   = ORIGIN(FLASH) + 0x400); /* Firmware revision code         */

SECTIONS
{
  .text : ALIGN(4)
  {
    _code = .;
    *(.text*)
    *(.rodata*)
    _code_end = .;
  } >FLASH

  .data : ALIGN(4)
  {
    *(.early_data*)
    _data_start = .;
    _data_load_start = _data_start - ADDR(.data) + LOADADDR(.data);
    *(.data*)
    _data_end = .;
    _data_load_end = _data_end - ADDR(.data) + LOADADDR(.data);
  } >KRES2 AT>FLASH

   .bss (NOLOAD) : ALIGN(4)
  {
    _bss_start = .;
    *(.bss*)
    _bss_end = .;
  } >KRES2
 
  _end = .;
}
