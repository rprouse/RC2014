
; Sum the data in 16 Bits
  org 100H      ; CPM Program start address

  ld hl,count
  ld b,(hl)
sum:
  inc hl
  ld a,(res)    ; Load the low byte of the result
  add (hl)      ; Add the next value
  ld (res),a    ; Store the low byte of the result

  ld a,(res+1)  ; Load the high byte of the result
  adc 0         ; Add the carry to the high byte
  ld (res+1),a  ; Store the hight byte of the result

  dec b
  jr nz,sum

  ret

count: db 03H
data:  db 0C8H,0FAH,96H
res:   db 0,0   ; Result should be 58,02
