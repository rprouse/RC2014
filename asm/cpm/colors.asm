; Get a file listing
  org 100H      ; CPM Program start address

  jp main

esc equ $1B

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

  ld de, reset     ; Reset the terminal
  call write_string
  ret

ansi: db esc, "[38;5;0mHello world\r\n$"
color: equ ansi + 7
reset: db esc, "[0m$"
