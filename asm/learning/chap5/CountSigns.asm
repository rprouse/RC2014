
; Count the number of positives, negatives and zeros
  org 100H      ; CPM Program start address

  ld hl,count
  ld b,(hl)
  ld c,0        ; Count of negatives
  ld d,0        ; Count of zeros
  ld e,0        ; Count of positives

next:
  inc hl
  ld a,(hl)

  cp 0
  jr nz,notzero
  inc d
  jr loop

notzero:
  jp p,positives
  inc c
  jr loop

positives:
  inc e

loop:
  djnz next     ; decrement b and jump back in non-zero

  ld hl,neg
  ld (hl),c
  inc hl
  ld (hl),d
  inc hl
  ld (hl),e

  ret

count:  db 06H
data:   db 68H,0F2H,87H,00H,59H,2AH
neg:    db 0FFH
zrs:    db 0FFH
pos:    db 0FFH
