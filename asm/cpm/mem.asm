; View zero page memory

; =============================================================================
  org $100                  ; CPM Program start address
  jp main                   ; skip over the data block

  include "cpm.inc"

main:
  ld hl, 0                  ; Start at memory location 0
  ld b, $0                  ; Print out 256 bytes

loop:
  ld a, l                   ; Write the address every 16 bytes
  and $0F
  cp 0
  call z, write_address

  ld a, (hl)                ; Load and output the next byte
  inc hl
  call write_hex
  ld a, space
  call write_char

  ld a, l                   ; Write a newline every 16 bytes
  and $0F
  cp 0
  call z, dump_bytes
  call z, write_newline

  djnz loop

  ret

; =============================================================================
; Dump the last 16 bytes
dump_bytes:
  push hl
  push de
  push bc
  push af

  ld a, space
  call write_char

  ld de, $FFF0              ; Subtract $0010 (2's compliment add)
  add hl, de
  ld b, $10

dump_loop:
  ld a, (hl)
  inc hl

  cp $20                    ; Compare A to the lower bound of printable ASCII
  jr c, not_printable       ; If A is less than 0x20, it's not printable
  cp $7E                    ; Compare A to the upper bound of printable ASCII
  jr nc, not_printable      ; If A is greater than 0x7E, it's not printable
  jr end_check
not_printable:
  ld a, '.'                 ; A is not printable ASCII
end_check:
  call write_char
  djnz dump_loop

  pop af
  pop bc
  pop de
  pop hl
  ret

; =============================================================================
; Print the address in the HL register as hex with two spaces at the end
write_address:
  push af

  ld a, h
  call write_hex
  ld a, l
  call write_hex
  ld a, space
  call write_char
  call write_char

  pop af
  ret
