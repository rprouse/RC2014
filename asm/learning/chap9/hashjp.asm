; Jump table with a hash key

  org $0100

  jp main

main:
  ld a, (value)
  ld b, 3

  ld hl, hashes   ; Set HL to the first element in the hash table
  cpir            ; Compare HL to A while B is not zero
  jp nz, end

found:
  ld a, 2
  sub b           ; If we get here, (2 - B) will be the 0 based index into the table
  rla             ; Double the index because 16-bits

  ld hl, table    ; Point HL at the start of the jump table

  ld e, a         ; Low byte of DE is the index
  ld d, 0
  add hl, de      ; Add the index in DE to HL

  ld e, (hl)      ; Load the low byte from the table
  inc hl
  ld d, (hl)      ; Load the high byte from the table
  ex de, hl

  jp (hl)         ; Jump to the location in the table

end:
  ret


value:  db $38
hashes: db $32, $35, $38
table:  db $4B, $00
        db $4D, $00
        db $4F, $00