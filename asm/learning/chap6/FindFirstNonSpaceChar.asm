
; Count the characters in a string
  org 100H      ; CPM Program start address

  ld hl,data
  ld a,' '     ; String to compare
next:
  cp (hl)
  jr nz,end     ; Is this not a space?

  inc hl        ; go to next char
  jr next

end:
  ld (res),hl   ; Store the result
  ret

data:  db "   F "
res:   db 0,0   ; Result should be memory location of the F
