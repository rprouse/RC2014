
; Store high nibble of (op1) at (res1) and low nibble at (res2)
  org 100H      ; CPM Program start address

  ld hl,op1     ; Set a pointer to op1
  ld a,(hl)     ; Get the data for op1
  ld b,a        ; Make a copy for later

  rra           ; Shift right 4 times
  rra
  rra
  rra
  and 0FH       ; Mask off the high bits
  inc hl        ; Point HL at res1
  ld a,(hl)     ; Save the result

  ld a,b        ; Grab the copy
  and 0FH       ; Mask off the high bits
  inc hl        ; Point HL at res2
  ld a,(hl)     ; Save the result
  ret

op1:  db 3EH
res1: db 0      ; Result should be 03
res2: db 0      ; Result should be 0E
