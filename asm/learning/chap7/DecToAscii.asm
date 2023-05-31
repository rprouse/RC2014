; Convert an decimal number to ASCII. If out of range store space.
  org 100H

  ld a,(data)
  cp 10
  jr nc,invalid ; jump if we are > 9
  add '0'
  jr done

invalid:
  ld a,' '

done:
  ld (res),a
  ret

data: db 07H
; data: db 0AH  ; Out of range
; data: db 0FFH  ; Out of range
res:  db 0

