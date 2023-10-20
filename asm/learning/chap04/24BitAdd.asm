
; Add 24-bit values at (op1) and (op2) and store the result at (res)
  org 100H      ; CPM Program start address

  ld a,(op1)    ; Get the low byte of op1
  ld b,a
  ld a,(op2)    ; Get the low byte of op2
  add a,b
  ld (res),a    ; Store the low byte result

  ld a,(op1+1)  ; Get the middle byte of op1
  ld b,a
  ld a,(op2+1)  ; Get the middle byte of op2
  adc a,b       ; Add with cary
  ld (res+1),a  ; Store the result

  ld a,(op1+2)  ; Get the high byte of op1
  ld b,a
  ld a,(op2+2)  ; Get the high byte of op2
  adc a,b       ; Add with cary
  ld (res+2),a  ; Store the result
  ret

op1:  db 2AH,67H,35H
op2:  db 0F8H,0A4H,51H
res:  db 0,0,0    ; 35672A + 51A4F8 = 870C22
