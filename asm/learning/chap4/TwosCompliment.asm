
; Twos complement the value at (op1) and store the result at (res)
  org 100H      ; CPM Program start address

  ld a,(op1)    ; Get the data
  cpl           ; Complement
  add a,1       ; Add one
  ld (res),a    ; Store the result
  ret

op1:  db 3EH
res:  db 0      ; Result should be C2
