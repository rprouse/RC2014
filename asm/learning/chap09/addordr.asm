; Add an entry to an ordered list if it
; doesn't exist and move remaining entries
; up one

  org $0100

  jp main

main:
  ld hl, value
  ld a, (hl)        ; Load the value to search for
  inc hl
  ld b, (hl)        ; Load the list length
  inc hl

loop:
  cp (hl)
  jp z, found       ; Found, nothing to do, exit
  jp c, larger      ; We found a value that is larger than A
  inc hl
  djnz loop

  ; If we get to here, the value wasn't in the list and
  ; nothing in the list was larger, so insert on the end
  ld (hl), a
  jr inclength

larger:
  inc b
largerloop:
  ld c, (hl)
  ld (hl), a
  inc hl
  ld a, c
  djnz largerloop

inclength:
  ld a, (length)
  inc a             ; Increment and save the length
  ld (length), a

found:
  ret


value:    db $6B
length:   db $04
list:     db $37, $55, $7D, $A1, $00
