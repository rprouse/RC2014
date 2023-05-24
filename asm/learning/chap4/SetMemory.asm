
; Set the memory to FF at (res)
  org 100H      ; CPM Program start address

  ld a,0FFH
  ld (res),a    ; Store the result
  ret

res:  db 6FH
