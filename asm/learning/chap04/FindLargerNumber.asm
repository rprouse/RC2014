
; Store the larger of (op1) and (op2) at (res1)
  org 100H      ; CPM Program start address

  ld hl,op1     ; Set a pointer to op1
  ld a,(hl)     ; Get the data for op1
  inc hl
  ; cp sets the carry to 1 if a borrow is required, ie if op2 > op1
  cp (hl)       ; Compare op1 to op2
  jr nc,done    ; Is the second operand smaller?
  ld a,(hl)     ; No, load op2 because is the larger

done:
  inc hl
  ld (hl),a     ; Save the result
  ret

op1:  db 3FH
op2:  db 2BH    ; Also try the reverse
res:  db 0      ; Result should be 3F
