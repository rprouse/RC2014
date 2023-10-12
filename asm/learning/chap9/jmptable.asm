; Simple 16 bit jump table

  org $0100

  jp main

main:
  ld hl, index
  ld a, (hl)
  rla             ; Double the index because 16-bits

  ld hl, table    ; Set HL to the first element in the table
  ld e, a         ; Low byte of DE is the index
  ld d, 0
  add hl, de      ; Add the index in DE to HL

  ld e, (hl)      ; Load the low byte from the table
  inc hl
  ld d, (hl)      ; Load the high byte from the table
  ex de, hl

  jp (hl)         ; Jump to the location in the table


index: db $02
table: db $48, $00
       db $4C, $00
       db $50, $00
       db $54, $00