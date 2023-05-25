
; Sum the data
  org 100H      ; CPM Program start address

  ld hl,count
  ld b,(hl)
  xor a         ; Zero the accumulator
sum:
  inc hl
  add (hl)      ; Add the next value
  dec b
  jr nz,sum

  ld (res),a    ; Store the result
  ret

count: db 03H
data:  db 28H,55H,26H
res:   db 0      ; Result should be A3
