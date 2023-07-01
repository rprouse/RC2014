; Write string to CP/M console
  org 100H      ; CPM Program start address

  jp main

  include "cpm.inc"

main:
  ld hl,hello_world
  call write_string
  ret

hello_world:
  db "Hello Z80 World from CP/M\r\n$"
