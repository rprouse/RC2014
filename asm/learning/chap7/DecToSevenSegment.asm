; Convert a decimal value to 7-Segment dispay value
  org 100H

  ld a,(data)
  cp 10
  jr c,valid
  xor a
  jr done

valid:
  ld b,0
  ld c,a
  ld hl,sseg
  add hl,bc
  ld a,(hl)

done:
  ld (res),a
  ret

sseg: db 3FH
      db 06H
      db 5BH
      db 4FH
      db 66H
      db 6DH
      db 7DH
      db 07H
      db 7FH
      db 6FH
data: db 03H
; data: db 28H
res:  db 0   ; Should be 4F or 00
