; Simple test program for my Z80 emulator
; Add the value at (op1) with (op2) and store the result at (res)
  org 100H      ; CPM Program start address

  ld a,(op1)    ; Get the data for op1
  ld hl,op2     ; Get the data for op2
  add (hl)
  ld (res),a    ; Store the result
  ret

op1:  db 38H
op2:  db 2BH
res:  db 0      ; Result should be 63
