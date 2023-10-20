; Removes an entry from the list if it exists
; and moves all subsequent entries down

  org $0100

  jp main

main:
  ld hl, value
  ld a, (hl)        ; Load the value to search for
  inc hl
  ld b, (hl)        ; Load the length
  inc hl

loop:
  cp (hl)           ; Compare current value to the list value
  jp z, found
  inc hl
  djnz loop

  ret               ; We didn't find the value, no change

found:
  ld de, hl
  inc hl

foundloop:
  ld a, (hl)
  ld (de), a
  inc hl
  inc de
  djnz foundloop

  ld a, (length)
  dec a
  ld (length), a

  ret

value:    db $6B
length:   db $04
list:     db $37, $6B, $28, $1D
