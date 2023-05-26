
; Shift contents of (OP1) left until the most significant
; bit is one.
  org 100H      ; CPM Program start address

  ld b,0
  ld a,(op1)

  cp a,0        ; Check special case of no ones
  jr z,one

notone:
  bit 7,a       ; Check if the high bit is 1 yet
  jr nz,one

  rl a          ; Rotate left one bit
  inc b         ; Count the rotation
  jr notone

one:
  ld hl,res1    ; Store the result
  ld (hl),a
  inc hl
  ld (hl),b
  ret

op1:   db 0CBH
res1:  db 0FFH
res2:  db 0FFH
