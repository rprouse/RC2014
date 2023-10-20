; Convert a binary number to an ascii hex digit

  org $0100
  jp main

main:
  ld a, $01
  call hex2ascii
  ; A should be 0x31

  ld a, $0E
  call hex2ascii
  ; A should be 0x45

  ld a, $93
  call hex2ascii
  ; A should be 0x33

  ld a, $FF
  call hex2ascii
  ; A should be 0x46

  ret

; Convert the contents of the Accumulator to an ASCII character placing
; the result in the Accumulator. The Accumulator should contain a single
; hexadecimal digit from 0x00 to 0x0F.
hex2ascii:
  and $0F         ; Just look at the low nibble
  cp $0A
  jr c, low       ; A is < 0xA

  add 'A'-'9'-1   ; A is A to F so add the character A
low:
  add '0'         ; A is 0 to 9 so add the character 0
  ret