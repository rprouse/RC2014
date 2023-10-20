; Convert an ASCII number to a decimal value and store to
; result. If the value is out of range, store FF
  org 100H

  ld a,(data)
  sub '0'
  jp m,invalid  ; out of range low?
  cp 10
  jr c,done     ; is out of range high?

invalid:
  ld a,0FFH

done:
  ld (res),a
  ret

; data: db 2BH  ; Out of range low
; data: db 37H
data: db 55H  ; Out of range high
res:  db 0   ; Should be 7 or FF

