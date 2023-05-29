; Convert the hex value at data to ascii and store at res
; This assumes the high nibble is zero, it just converts the
; low nibble.
  org 100H

  ld a,(data)
  add  a,90h
  daa
  adc  a,40h
  daa

done:
  ld (res),a
  ret

; data: db 06H
data: db 0CH
res:  db 0   ; Should be 36 '6' or 43 'C'
