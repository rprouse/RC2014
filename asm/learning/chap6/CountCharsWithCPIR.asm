
; Count the characters in a string using the CPIR instruction
; CPIR repeatedly increments HL and compares the data at (HL)
; to A. When they match it stops processing. For each step, it
; also decrements BC. We can use that to get the count
  org 100H      ; CPM Program start address

  ld hl,data
  ld bc,0       ; Zero out the count
  ld a,'\n'     ; String to compare

  cpir

  ld a,0FFH     ; BC was decremented, so we need to find out how much
  sub c

  ld (res),a     ; Store the result
  ret

data:  db "RATHER\n"
res:   db 0   ; Result should be 06
