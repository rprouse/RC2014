
; Count the characters in a s
  org 100H      ; CPM Program start address

  ld hl,data
  ld c,0        ; Zero out the count
next:
  ld a,(hl)
  sub '\n'
  jr z,end      ; Are we at the \n yet?

  inc c         ; Found a char, increment the count and
  inc hl        ; go to next char
  jr next

end:
  inc hl
  ld (hl),c     ; Store the result
  ret

data:  db "RATHER\n"
res:   db 0   ; Result should be 06
