; Convert an ASCII binary number to a binary value and store in res
; Set valid to FF if invalid, 00 if valid
  org 100H

  ld hl,data
  ld b,8
  ld d,0

next:
  ld a,(hl)
  sub '0'     ; Convert to binary and check if 0
  jr z,zero
  sub 1       ; Sub one more to check if 1
  jr nz,invalid

one:
  ld c,1
  jr inc

zero:
  ld c,0

inc:
  ld a,d
  sla a       ; Shift left
  add c       ; Add the 0 or 1 from above
  ld d,a
  inc hl
  djnz next

done:
  ld hl,res
  ld (hl),d
  inc hl
  ld (hl),00H
  ret

invalid:
  ld hl,res
  ld (hl),00H
  inc hl
  ld (hl),0FFH
  ret

data:  db "11010010",0
res:   db 0   ; Should be D2
valid: db 0FH
