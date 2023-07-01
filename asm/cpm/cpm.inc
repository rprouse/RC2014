; =============================================================================
; Definitions and methods for CP/M development

; =============================================================================
; Base page memory declarations in the first 255 bytes of memory
;
boot        equ $0          ; The CP/M warm boot vector
bdos        equ $5          ; CP/M BDOS vector address
fcb1        equ $5C         ; CP/M default File Control Block (FCB)
fcb2        equ $6C         ; CP/M secondary File Control Block (FCB)
cmdlen      equ $80         ; The length of the command line tail that follows
cmdline     equ $81         ; The tail of the command line, 127 bytes long
dma         equ $80         ; default dma buffer, 128 bytes long

cntrlc      equ $3

; =============================================================================
; define bdos functions
;
c_read      equ $01         ; console input
c_write     equ $02         ; console output
c_writestr  equ $09         ; output string, '$' terminated, to console output
c_readstr   equ $0A         ; buffered console input
c_stat      equ $0B         ; console status, nonzero if char waiting
drv_set     equ $0E         ; select drive
f_open      equ $0F         ; open file
f_close     equ $10         ; close file
f_sfirst    equ $11         ; search for first
f_snext     equ $12         ; search for next
f_read      equ $14         ; read next file record
f_write     equ $15         ; write record
f_make      equ $16         ; create file
drv_get     equ $19         ; get current drive
f_setdma    equ $1A         ; set dma address
drv_dpb     equ $1F         ; get dpb address
f_usernum   equ $20         ; get/set user number
drv_reset   equ $25         ; selectively reset a disk drive

; =============================================================================
; Other defines
;
cr          equ $0D         ; Cursor return
lf          equ $0A         ; Line feed
subz        equ $1A         ; SUB or Ctrl-Z
space       equ $20         ; Space character

; =============================================================================
; Data
;
str_newline:
    db "\r\n$"

; =============================================================================
; Macros
macro push_all
  push af
  push bc
  push de
  push hl
endm

macro pop_all
  pop hl
  pop de
  pop bc
  pop af
endm

; =============================================================================
; General BDOS functions

; =============================================================================
; Wait for a character from the keyboard; then echo it to the screen and return
; it in the A register
read_char:
    ld c, c_read
    call bdos
    ret

; =============================================================================
; Writes a newline CR/LF to the console
write_newline:
    push de

    ld de, str_newline
    call write_string

    pop de
    ret

; =============================================================================
; Reads a string into (DE)
read_string:
    push_all

    ld c, c_readstr
    call bdos

    pop_all
    ret

; =============================================================================
; Writes a $ terminated string pointed at by (DE)
; This is the BDOS c_writestr call
write_string:
  push_all

  ld c, c_writestr
  call bdos

  pop_all
  ret

; =============================================================================
; Writes the character in the A register to the console
write_char:
  push_all

  ld e, a
  ld c, c_write
  call bdos

  pop_all
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
; Combined routine for conversion of different sized binary numbers into
; directly printable ASCII(Z)-string
; Input value in registers, number size and -related to that- registers to fill
; is selected by calling the correct entry:
;
;  entry  inputregister(s)  decimal value 0 to:
;   B2D8             A                    255  (3 digits)
;   B2D16           HL                  65535   5   "
;   B2D24         E:HL               16777215   8   "
;   B2D32        DE:HL             4294967295  10   "
;   B2D48     BC:DE:HL        281474976710655  15   "
;   B2D64  IX:BC:DE:HL   18446744073709551615  20   "
;
; The resulting string is placed into a small buffer attached to this routine,
; this buffer needs no initialization and can be modified as desired.
; The number is aligned to the right, and leading 0's are replaced with spaces.
; On exit HL points to the first digit, (B)C = number of decimals
; This way any re-alignment / postprocessing is made easy.
; Changes: AF,BC,DE,HL,IX
; P.S. some examples below

; by Alwin Henseler


b2d8:    ld h,0
         ld l,a
b2d16:   ld e,0
b2d24:   ld d,0
b2d32:   ld bc,0
b2d48:   ld ix,0          ; zero all non-used bits
b2d64:
         ld (b2dinv),hl
         ld (b2dinv+2),de
         ld (b2dinv+4),bc
         ld (b2dinv+6),ix ; place full 64-bit input value in buffer
         ld hl,b2dbuf
         ld de,b2dbuf+1
         ld (hl),' '
b2dfilc: equ $-1            ; address of fill-character
         ld bc,18
         ldir               ; fill 1st 19 bytes of buffer with spaces
         ld (b2dend-1),bc ;set bcd value to "0" & place terminating 0
         ld e,1             ; no. of bytes in bcd value
         ld hl,b2dinv+8     ; (address msb input)+1
         ld bc,0909h
         xor a
b2dskp0: dec b
         jr z,b2dsiz        ; all 0: continue with postprocessing
         dec hl
         or (hl)            ; find first byte <>0
         jr z,b2dskp0
b2dfnd1: dec c
         rla
         jr nc,b2dfnd1      ; determine no. of most significant 1-bit
         rra
         ld d,a             ; byte from binary input value
b2dlus2: push hl
         push bc
b2dlus1: ld hl,b2dend-1     ; address lsb of bcd value
         ld b,e             ; current length of bcd value in bytes
         rl d               ; highest bit from input value -> carry
b2dlus0: ld a,(hl)
         adc a,a
         daa
         ld (hl),a          ; double 1 bcd byte from intermediate result
         dec hl
         djnz b2dlus0       ; and go on to double entire bcd value (+carry!)
         jr nc,b2dnxt
         inc e              ; carry at msb -> bcd value grew 1 byte larger
         ld (hl),1          ; initialize new msb of bcd value
b2dnxt:  dec c
         jr nz,b2dlus1      ; repeat for remaining bits from 1 input byte
         pop bc             ; no. of remaining bytes in input value
         ld c,8             ; reset bit-counter
         pop hl             ; pointer to byte from input value
         dec hl
         ld d,(hl)          ; get next group of 8 bits
         djnz b2dlus2       ; and repeat until last byte from input value
b2dsiz:  ld hl,b2dend       ; address of terminating 0
         ld c,e             ; size of bcd value in bytes
         or a
         sbc hl,bc          ; calculate address of msb bcd
         ld d,h
         ld e,l
         sbc hl,bc
         ex de,hl           ; hl=address bcd value, de=start of decimal value
         ld b,c             ; no. of bytes bcd
         sla c              ; no. of bytes decimal (possibly 1 too high)
         ld a,'0'
         rld                ; shift bits 4-7 of (hl) into bit 0-3 of a
         cp '0'             ; (hl) was > 9h?
         jr nz,b2dexph      ; if yes, start with recording high digit
         dec c              ; correct number of decimals
         inc de             ; correct start address
         jr b2dexpl         ; continue with converting low digit
b2dexp:  rld                ; shift high digit (hl) into low digit of a
b2dexph: ld (de),a          ; record resulting ascii-code
         inc de
b2dexpl: rld
         ld (de),a
         inc de
         inc hl             ; next bcd-byte
         djnz b2dexp        ; and go on to convert each bcd-byte into 2 ascii
         sbc hl,bc          ; return with hl pointing to 1st decimal
         ret

b2dinv:  ds 8               ; space for 64-bit input value (lsb first)
b2dbuf:  ds 20              ; space for 20 decimal digits
b2dend:  ds 2, '$';s 1      ; space for terminating 0
