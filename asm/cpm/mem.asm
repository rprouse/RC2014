; View zero page memory

; =============================================================================
; BDOS functions
bdos        equ $5          ; CP/M BDOS vector address
c_write     equ $02         ; console output
c_writestr  equ $09         ; output string, '$' terminated, to console output

; =============================================================================
; Other defines
cr          equ $0D         ; Cursor return
lf          equ $0A         ; Line feed
space       equ $20         ; Space character

; =============================================================================
  org $100                  ; CPM Program start address
  jp main                   ; skip over the data block

main:
  ld hl, 0                  ; Start at memory location 0
  ld b, $0                  ; Print out 256 bytes

loop:
  ld a, l                   ; Write the address every 16 bytes
  and $0F
  cp 0
  call z, write_address

  ld a, (hl)                ; Load and output the next byte
  inc hl
  call write_hex
  ld a, space
  call write_char

  ld a, l                   ; Write a newline every 16 bytes
  and $0F
  cp 0
  call z, write_newline

  djnz loop

  ret

; =============================================================================
; Print the address in the HL register as hex with two spaces at the end
write_address:
  push af

  ld a, h
  call write_hex
  ld a, l
  call write_hex
  ld a, space
  call write_char
  call write_char

  pop af
  ret

; =============================================================================
; Print a hexadecimal byte in the A register
write_hex:
  push af
  rrca
  rrca
  rrca
  rrca                      ; get high nibble
  call pass1
  pop af
pass1:
  and $0F
  add $30
  cp $3A
  jr c, num                 ; A < $3a - 0-9
  add $07                   ; else A-F
num:
  call write_char
  ret

; =============================================================================
; Writes the character in the A register to the console
write_char:
  push af
  push bc
  push de
  push hl

  ld e, a
  ld c, c_write
  call bdos

  pop hl
  pop de
  pop bc
  pop af
  ret

; =============================================================================
; Writes a newline CR/LF to the console
write_newline:
  push af
  push bc
  push de
  push hl

  ld c, c_write
  ld e, cr
  call bdos
  ld e, lf
  call bdos

  pop hl
  pop de
  pop bc
  pop af
  ret

; =============================================================================
; Writes a $ terminated string pointed at by (DE)
; This is the BDOS c_writestr call
write_str:
  push af
  push bc
  push de
  push hl

  ld c, c_writestr
  call bdos

  pop hl
  pop de
  pop bc
  pop af
  ret
