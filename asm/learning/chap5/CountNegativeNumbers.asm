
; Count the number of items that are negative
  org 100H      ; CPM Program start address

  ld hl,count
  ld b,(hl)
  xor a         ; Zero out the count
next:
  inc hl
  bit 7,(hl)    ; Check the high bit
  jr z,notneg
  inc a         ; Found a negative
notneg:
  djnz next     ; decrement b and jump back in non-zero

  ld (res),a    ; Store the results
  ret

count: db 06H
data:  db 68H,0F2H,87H,30H,59H,2AH
res:   db 0     ; Result should be 02
