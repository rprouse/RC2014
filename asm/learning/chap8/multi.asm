; Multiply two 8-bit numbers

  org $100

main:
  ld hl, data1
  ld e, (hl)        ; Load the multiplicand
  ld d, 0           ; Extend to 16 bits
  inc hl
  ld a, (hl)        ; Load the multiplier

  ld hl, 0          ; HL will hold the product
  ld b, 8           ; We are multiplying an 8-bit multiplier

mult:
  add hl, hl        ; Shift product left 1 bit
  rla               ; Shift multiplier left 1 bit
  jr nc,nocarry     ; Is there a carry from the multiplier?
  add hl, de        ; Yes, add multiplicand to product

nocarry:
  djnz mult

  ld (result), hl   ; Save the result
  ret


data1:  db $6F
data2:  db $61
result: db 0, 0    ; 0x0F, 0x2A => 111 x 97 = 10,767
