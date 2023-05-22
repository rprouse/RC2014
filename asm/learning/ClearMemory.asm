
; Clear the memory at (res)
  org 100H      ; CPM Program start address

  xor a         ; SUB A, LD A,0 would also work
  ld (res),a    ; Store the result
  ret

res:  db 6FH
