
; Sum the data in 16 Bits
  org 100H      ; CPM Program start address

  ld hl,count
  ld b,(hl)
  xor a         ; Zero out the sum
  ld c,a        ; Use c for the carry
sum:
  inc hl
  add (hl)      ; Add the next value
  jr nc,nocarry
  inc c         ; Add the carry
nocarry:
  djnz sum      ; decrement b and jump back in non-zero

  ld hl,res
  ld (hl),a     ; Store the results
  inc hl
  ld (hl),c
  ret

count: db 03H
data:  db 0C8H,0FAH,96H
res:   db 0,0   ; Result should be 58,02
