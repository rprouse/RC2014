; Write string to CP/M console
  org 100H      ; CPM Program start address

  jp main

  include "cpm.inc"

main:
  ld hl,hello_world
  call PRINT_STR
  ret

hello_world:
  db "Hello Z80 World from CP/M$"
