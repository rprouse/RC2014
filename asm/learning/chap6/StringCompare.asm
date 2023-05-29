
; Compare two strings. If both are the same, set RES 0x00 otherwise 0xFF
  org 100H      ; CPM Program start address

  ld hl,str1
  ld de,str2
  ld b,0FFH     ; Mark as different
next:
  ld a,(de)     ; Load the next byte
  cp (hl)       ; Do the characters match?
  jr nz,end

  cp 0
  jp z,match    ; NULL terminator, we're done

  inc hl        ; go to next char
  inc de
  jr next

match:
  ld b,0H       ; Mark the two strings as equal

end:
  ld a,b
  ld (res),a
  ret

str1:  db "Cat",0
str2:  db "Catty",0
res:   db 09
