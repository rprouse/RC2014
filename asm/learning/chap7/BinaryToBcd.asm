; Convert binary value to BCD
  org 100H

  ld hl,res
  ld a,(data)

	ld	c, a
	ld	b, 8
	xor	a
loop:
	sla	c
	adc	a, a
	daa
	djnz loop

  ld b,a
  and 0F0H
  srl a
  srl a
  srl a
  srl a
  ld (res),a ; Store result
  ld a,b
  and 0FH
  ld (res+1),a
  ret

data: db 1DH
; data: db 47H
res:  db 0,0   ; Should be 02,09 or 07,01

