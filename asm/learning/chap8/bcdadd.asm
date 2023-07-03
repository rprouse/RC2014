; Adds two 8 digit BCD numbers

  org $100

main:
  ld hl, datalen
  ld b, (hl)        ; The numbers are 4 bytes long
  ld hl, data1
  ld de, data2
  xor a             ; Clear the carry flag
bcdadd:
  ld a,(de)         ; load a digit of the second number
  adc (hl)          ; add a digit of the first number
  daa               ; make the addition BCD
  ld (hl), a        ; store results in data1
  inc de
  inc hl
  djnz bcdadd

  ret

data1:   db $85, $19, $70, $36   ;  36701985
data2:   db $59, $34, $66, $12   ; +12663459
                                 ;----------
                                 ; =49365444
datalen: equ ($ - data2)
