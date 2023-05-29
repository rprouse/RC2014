
; Count the characters in a string
  org 100H      ; CPM Program start address

  ld hl,data
  ld c,0        ; Zero out the count
  ld a,0        ; Character to compare.
next:
  cp (hl)
  jr z,end      ; Are we at the null yet?

  inc c         ; Found a char, increment the count and
  inc hl        ; go to next char
  jr next

end:
  inc hl
  ld (hl),c     ; Store the result
  ret

data:  db "RATHER",0
res:   db 0   ; Result should be 06
