; Lookup the square of a value in a table
  org 100H

  ld a,(op1)
  ld l,a
  ld h,0
  ld de,sqtab
  add hl,de
  ld a,(hl)
  ld (res),a


op1: db 3
res: db 0

sqtab:
  db 0
  db 1
  db 4
  db 9
  db 16
  db 25
  db 36
  db 49
