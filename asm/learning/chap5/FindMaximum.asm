
; Find the largest unsigned value
  org 100H      ; CPM Program start address

  ld hl,count
  ld b,(hl)
  inc hl
  ld c,(hl)     ; C will hold the max value
next:
  ld a,(hl)
  inc hl
  cp c
  jr c,notbigger
  ld c,a        ; Found a larger number
notbigger:
  djnz next     ; decrement b and jump back in non-zero

  ld (hl),c     ; Store the results
  ret

count: db 05H
data:  db 67H,79H,15H,0E3H,72H
res:   db 0     ; Result should be E3
