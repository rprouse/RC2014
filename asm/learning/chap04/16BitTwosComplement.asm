
; Store the 16-bit twos complement of (op1) at (res)
  org 100H      ; CPM Program start address

  ld a,(op1)    ; Get the low byte of op1
  cpl
  add a,1
  ld (res),a    ; Store the low byte result

  ld a,(op1+1)  ; Get the high byte of op1
  cpl
  adc 0
  ld (res+1),a  ; Store the result
  ret

op1:  db 72H,00H  ; 00H,58H or 72H,00H
res:  db 0,0      ; 00,A8 or 8E,FF
