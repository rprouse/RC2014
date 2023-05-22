
; Complement the value at (op1) and store the result at (res)
  org $100      ; CPM Program start address

  ld a,(op1)    ; Get the data
  cpl           ; Complement
  ld (res),a    ; Store the result
  ret

op1:  db 6AH
res:  db 0      ; Result should be 95
