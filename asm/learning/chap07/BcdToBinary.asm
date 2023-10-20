; Convert two BCD numbers in data to a binary number in result
; To do so, we multiply the most significant digit by 10
; Multiply by 10 is equivilent to 2N + 8N which can be reduced to
; Left shifts or add self
  org 100H

  ld hl,data ; Load the most significant digit (MSD)
  ld a,(hl)
  add a      ; MSD times two
  ld b,a     ; Save MSD times two
  add a      ; MSD times four
  add a      ; MSD times eight
  add b      ; MSD*2 + MSD*8

  inc hl     ; Point to least significant digit (LSD)
  add (hl)

  ld (res),a ; Store result
  ret

; data: db 02H,09H
data: db 07H,01H
res:  db 0   ; Should be 1D or 47

