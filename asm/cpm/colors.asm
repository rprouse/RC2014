; Get a file listing
  org 100H      ; CPM Program start address

  jp main

  include "cpm.inc"

main:
  ld de, ansi
  ld b, $09
  ld a, '0'

loop:
  ld (color), a    ; Update the ANSI color string with the next color
  call write_string
  inc a
  djnz loop

  ret

ansi: db $1B, "[38;5;0mHello world\r\n$"
color: equ ansi + 7
