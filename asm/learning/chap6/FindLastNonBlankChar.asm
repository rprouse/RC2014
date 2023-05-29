
; Find the last non-space in a null terminated string
; Store the memory location in RES
  org 100H      ; CPM Program start address

  ld hl,str
  ld a,0        ; Start by finding the null terminator
  ld b,0        ; Counter so we don't go past beginning of str
next:
  cp (hl)       ; NULL terminator?
  jr z,null
  inc hl
  inc b
  jr next

null:
  ld a,' '      ; Start walking back to find a non-space

next2:
  dec hl
  cp (hl)       ; Is it a space?
  jr nz,done
  djnz next2    ; decrement b and jump back in non-zero

done:
  ld (res),hl
  ret

; str:  db "Cat",0
; str:  db "Cat  ",0
str:  db "  ",0
;str:  db 0      ; TODO: This returns the memory location before
res:  db 0,0
