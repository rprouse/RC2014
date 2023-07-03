; Multiply two 8-bit numbers

  org $100

main:
  ld hl, (dividend)
  ld a, (divisor)
  ld c, a
  ld b, 8                 ; number of bit in the divisor

div:
  add hl, hl              ; shift dividend left 1 bit
  ld  a, h                ; can divisor be subtracted?
  sub c
  jr c, continue          ; no, go to next bit
  ld h, a                 ; yes, subtract divisor from dividend
  inc l                   ; add one to quotient

continue:
  djnz div

  ld (result), hl         ; save the quotient and remainder
  ret

dividend:   db $6D, $32   ; 12909
divisor:    db $47        ;    71
result:     db 0          ;   181 (0xB5)
remainder:  db 0          ;    58 (0x3A)
