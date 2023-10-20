; Convert an ASCII hex representation to a hex value and store to
; result. If the value is out of range, store FF
  org 100H

  ld a,(data)
  cp '0'
  jr c,invalid  ; out of range low?
  cp ':'        ; one above '9'
  jr nc,high    ; jump if we are > '9'
  sub '0'
  jr done

high:
  cp 'A'
  jr c,invalid  ; between '9' and 'A'
  cp 'G'
  jr nc,invalid ; is out of range high?
  sub 37H
  jr done

invalid:
  ld a,0FFH

done:
  ld (res),a
  ret

; data: db 2BH  ; Out of range low
; data: db ':'  ; Out of range middle
data: db 43H  ; 'C'
; data:  db 36H  ; '6'
; data: db 55H  ; Out of range high
res:  db 0   ; Should be 0C or 06 or FF

