
; Mask the four most significant bits at (op1) and store the result at (res)
  org $100      ; CPM Program start address

  ld a,(op1)    ; Get the data
  and 0FH       ; Mask the four most significant bits
  ld (res),a    ; Store the result
  ret

op1:  db 3DH
res:  db 0      ; Result should be 0D
