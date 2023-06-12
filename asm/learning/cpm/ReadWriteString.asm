; Write string to CP/M console
  org 100H      ; CPM Program start address

  jp main

  include "cpm.inc"

main:
  ld hl,prompt
  call PRINT_STR

  ld hl,data
  call GET_STR

  ; Add a $ to the end of the string
  ld a,(data)
  ld c,a
  ld b,0
  ld hl,data+2
  add hl,bc
  ld (hl),'$'

  ld hl, data
  inc hl
  inc hl
  call PRINT_STR

  ret

prompt:
  db "Enter string: $"

data:
  db 0FH,'-',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'$'
