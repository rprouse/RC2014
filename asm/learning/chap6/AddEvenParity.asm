
; Add a one to the high bit of each character of a string if
; it will make the number of bits in the character even
  org 100H      ; CPM Program start address

  ld hl,data
next:
  ld a,(hl)     ; Load the next byte
  cp 0
  jp z,end      ; NULL terminator, we're done

  or 80H        ; Set the parity bit and test parity
  jp po,noteven ; Is the parity odd?

  ld (hl),a     ; Parity is even, save the change back
noteven:
  inc hl        ; go to next char
  jr next

end:
  ret

data:  db 31H,32H,33H,34H,35H,36H,0
