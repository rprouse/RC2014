
; Add 16-bit values at (op1) and (op2) and store the result at (res)
  org 100H      ; CPM Program start address

  ld a,(op1)    ; Get the low byte of op1
  ld b,a
  ld a,(op2)    ; Get the low byte of op2
  add a,b
  ld (res),a    ; Store the low byte result

  ld a,(op1+1)  ; Get the high byte of op1
  ld b,a
  ld a,(op2+1)  ; Get the high byte of op2
  adc a,b       ; Add with cary
  ld (res+1),a  ; Store the result
  ret

op1:  db 2AH,67H
op2:  db 0F8H,14H
res:  db 0,0    ; 672A + 14F8 = 7C22
