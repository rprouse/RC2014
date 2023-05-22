
; Shift the value at (op1) left one bit and store the result at (res)
  org $100      ; CPM Program start address

  ld a,(op1)    ; Get the data
  sla a         ; Shift left one bit. ADD A,A would have the same result and be faster
  ld (res),a    ; Store the result
  ret

op1:  db 6FH
res:  db 0      ; Result should be DE
