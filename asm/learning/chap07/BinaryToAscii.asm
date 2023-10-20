; Convert binary value to the binary ASCII representation
  org 100H

  ld hl,data ; Load the data
  ld a,(hl)
  ld b,8     ; 8 binary digits
  inc hl

conv:
  rla
  jp c,one   ; If the MSBit was a one there will be a carry
  ld (hl),'0'
  jr next

one:
  ld (hl),'1'

next:
  inc hl
  djnz conv

  ret

data: db 0D2H
res:  db 0,0,0,0,0,0,0,0 ; "11010010"
