
; Compare two strings alphabetically. If both are the same, set RES 0x00
; otherwise 0xFF (-1) if Str1 comes first alphabetically,
; 0x01 if Str2 comes first
  org 100H      ; CPM Program start address

  ld hl,str1
  ld de,str2
  ld b,00H      ; Mark as same
next:
  ld a,(de)     ; Load the next byte
  cp (hl)       ; Is one larger?
  jr c,secondlarger ; str1 > str2
  jr z,checknull    ; str1 == str2
  jr firstlarger    ; str1 < str2

checknull:
  cp 0
  jp z,done     ; NULL terminator, we're done

  inc hl        ; go to next char
  inc de
  jr next

firstlarger:
  ld b,0FFH      ; Mark the first string as larger
  jr done

secondlarger:
  ld b,01H      ; Mark the second string as larger

done:
  ld a,b
  ld (res),a
  ret

str1:  db "Cat",0
str2:  db "Cat",0
res:   db 09
