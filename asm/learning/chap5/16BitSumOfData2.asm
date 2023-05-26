
; Sum 16 bit data in 16 Bits
  org 100H      ; CPM Program start address

  ld hl,count
  ld b,(hl)
  xor a         ; Zero out the sum
  ld d,a        ; Use d for the low byte
  ld e,a        ; Use e for the high byte
next:
  inc hl
  ld a,d
  add (hl)      ; Add the low byte of the next value
  ld d,a

  inc hl
  ld a,e
  adc (hl)      ; Add the high byte with carry
  ld e,a

  djnz next     ; decrement b and jump back in non-zero

  inc hl
  ld (hl),d     ; Store the result
  inc hl
  ld (hl),e
  ret

count: db 03H
data:  db 0F1H,28H,1AH,30H,89H,4BH
res:   db 0,0   ; Result should be 94,A4
