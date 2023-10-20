
; Calculate checksum of the data
  org 100H      ; CPM Program start address

  ld hl,count
  ld b,(hl)
  xor a         ; Zero the accumulator
next:
  inc hl
  xor (hl)      ; XOR the next value
  dec b
  jr nz,next

  ld (res),a    ; Store the result
  ret

count: db 03H
data:  db 28H,55H,26H
res:   db 0      ; Result should be 5B
