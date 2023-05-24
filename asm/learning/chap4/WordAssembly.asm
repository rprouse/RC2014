; Store low nibble of (op1) and (op2) at (res1)
  org 100H      ; CPM Program start address

  ld a,(op1)    ; Get the data for op1

  rla           ; Shift left 4 times
  rla
  rla
  rla
  and 0F0H      ; Mask off the low bits
  ld b,a        ; Make a copy for later

  ld a,(op2)
  and 0FH       ; Mask off the high bits

  add b
  ld (res1),a   ; Save the result
  ret

op1:  db 6AH
op2:  db 0B3H
res1: db 0      ; Result should be A3