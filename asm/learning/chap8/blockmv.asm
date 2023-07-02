; Move a block of memory from one location to another

  org 100H

main:
  ld hl, data
  ld bc, datalen
  ld de, dest
  ldir
  ret

data:    db "Hello World"
datalen: equ ($ - data)
dest:    ds 256
