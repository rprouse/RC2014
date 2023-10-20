; Convert the hex value at data to ascii and store at res
; This assumes the high nibble is zero, it just converts the
; low nibble.
  org 100H

  ld a,(data)
  cp 0AH
  jr nc,high    ; The value is A to F, jump
  add 30H       ; The value is 0 to 9, add '0'
  jr done

high:
  add 37H       ; Add 'A' minus 10

done:
  ld (res),a
  ret

data: db 06H
; data: db 0CH
res:  db 0   ; Should be 36 '6' or 43 'C'
