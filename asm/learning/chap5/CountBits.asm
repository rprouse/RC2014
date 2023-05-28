
; Count the number of 1 bits in a value
  org 100H      ; CPM Program start address

  ld hl,data
  ld a,(hl)
  ld b,8
  ld c,0        ; C holds the count of bits
next:
  bit 7,a       ; Check if the high bit is 1
  jr z,notone
  inc c         ; Found a 1, increment the counter

notone:
  rla           ; Rotate one left to count the next bit
  djnz next     ; decrement b and jump back in non-zero

  inc hl
  ld (hl),c    ; Store the result
  ret

data:  db 3BH
res:   db 0      ; Result should be 05
