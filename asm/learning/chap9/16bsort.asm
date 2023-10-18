; 16 bit descending bubble sort a list of values

  org $0100
  jp main

main:
  ld c, 0         ; Flag to indicate a swap has happened
  ld hl, length
  ld b, (hl)      ; Load the length of the list
  dec b           ; Number of pairs is one less than length
  inc hl          ; Point to the start of the list

pass:
  ld d, (hl)      ; Get the low byte from the array
  inc hl
  ld a, (hl)      ; Get the high byte from the array
  inc hl
  ld ix, hl
  cp (ix+1)       ; Compare the high byte of the next value
  jr nc, next     ; It is less than the next value, so continue
  ld a, d
  cp (ix)         ; Compare the low byte of the next value
  jr nc, next

  ld d, (ix)      ; First value is smaller, swap the LSB
  ld (ix), a
  ld (ix-1), d

  ld d, (ix+1)    ; Swap the MSB
  ld a, (ix-2)
  ld (ix+1), d
  ld (ix-1), a

  ld c, 1         ; Mark that we made a swap

next:
  djnz pass       ; Keep checking until the end of the list
  dec c           ; Was the interchange flag set?
  jr z, main      ; We made a swap, so do another pass

  ret

length: db $03
list:   db $2A, $B5, $60, $3F, $D1, $19
