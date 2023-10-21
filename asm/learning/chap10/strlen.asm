; Determine the length of a null terminated string

  org $0100
  jr main

main:
  ld hl, str1
  call strlen
  ; A should be 0x0B
  ret

; Determine the length of a null terminated string. The first
; character of the string should be in HL. The length will be
; in A on return.
strlen:
  push b
  ld a, 0
  ld b, 0

loop:
  cp (hl)
  jr z, end

  inc hl
  inc b

  jr loop

end:
  ld a,  b
  pop b
  ret

; Data
str1: db "Hello world", 0

