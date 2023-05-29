
; Replace leading zeros in a string with spaces
  org 100H      ; CPM Program start address

  ld hl,data
next:
  ld a,(hl)     ; Load the next byte
  cp 0
  jp z,end      ; NULL terminator, we're done

  cp '0'
  jr nz,end     ; Found something other than a leading 0

  ld (hl),' '   ; Replace 0 with a space
  inc hl        ; go to next char
  jr next

end:
  ret

; data:  db 0
data:  db "0086",0
; data:  db "86",0
