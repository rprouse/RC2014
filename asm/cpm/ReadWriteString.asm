; Write string to CP/M console
  org 100H      ; CPM Program start address

  jp main

  include "cpm.inc"

main:
  ld de,prompt
  call write_string

  ld de,data
  call read_string

  ; Add a $ to the end of the string
  ld a,(data)
  ld c,a
  ld b,0
  ld hl,data+2
  add hl,bc
  ld (hl),'$'

  ex de, hl
  ld de, data
  inc de
  inc de
  call write_string

  ret

prompt:
  db "Enter string: $"

data:
  db 0FH,'-',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'$'
