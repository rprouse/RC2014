
; Mask the four least significant bits at (op1) and store the result at (res)
  org 100H      ; CPM Program start address

  ld a,(op1)    ; Get the data
  and 0F0H       ; Mask the four least significant bits
  ld (res),a    ; Store the result
  ret

op1:  db 0C4H
res:  db 0      ; Result should be C0
