
; Subtract the value at (op2) from (op1) and store the result at (res)
  org 100H      ; CPM Program start address

  ld a,(op1)    ; Get the data for op1
  ld hl,op2     ; Get the data for op2
  sub (hl)
  ld (res),a    ; Store the result
  ret

op1:  db 77H
op2:  db 39H
res:  db 0      ; Result should be 3E
