
; Find the largest unsigned value
  org 100H      ; CPM Program start address

  ld hl,count
  ld b,(hl)     ; Counter
  xor a         ; A will hold the max
next:
  inc hl
  cp (hl)
  jr nc,notbigger
  ld a,(hl)     ; Found a larger number
notbigger:
  djnz next     ; decrement b and jump back in non-zero

  ld (res),a     ; Store the results
  ret

count: db 05H
data:  db 67H,79H,15H,0E3H,72H
res:   db 0     ; Result should be E3
