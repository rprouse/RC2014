; Adds an entry to a list if it does not exist

  org $0100

  jp main

main:
  ld hl, value
  ld a, (hl)      ; Load the value to search for
  inc hl
  ld b, (hl)      ; Load the length
  inc hl

loop:
  cp (hl)         ; Is the value in the list?
  jp z,found
  inc hl
  djnz loop

  ld (hl), a      ; We didn't find the value, save it
  ld hl, (length)
  inc (hl)        ; Increment the length of the list

found:
  ret

value:    db $6B
length:   db $04
list:     db $37, $6C, $38, $1D, 0
