
; Shift the value at (op1) left two bits and store the result at (res)
  org 100H      ; CPM Program start address

  ld a,(op1)    ; Get the data
  sla a         ; Shift left one bits
  sla a
  ld (res),a    ; Store the result
  ret

op1:  db 5DH
res:  db 0      ; Result should be 74
