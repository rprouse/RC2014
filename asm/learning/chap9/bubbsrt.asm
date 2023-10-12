; Bubble sort a list of values in ascending order

  org $0100
  jp main

main:
  ld c, 0         ; Flag to indicate a swap has happened
  ld hl, length
  ld b, (hl)      ; Load the length of the list
  dec b           ; Number of pairs is one less than length
  inc hl          ; Point to the start of the list

pass:
  ld a, (hl)      ; Get the next value from the array
  inc hl
  cp (hl)         ; Compare to the next value
  jr c, next      ; It isn't less than the next value, so continue
  ld d, (hl)      ; First value is bigger, swap them
  ld (hl), a
  dec hl
  ld (hl), d
  inc hl
  ld c, 1         ; Mark that we made a swap

next:
  djnz pass       ; Keep checking until the end of the list
  dec c           ; Was the interchange flag set?
  jr z, main      ; We made a swap, so do another pass

  ret

length: db $06
list:   db $2A, $B5, $60, $3F, $D1, $19
