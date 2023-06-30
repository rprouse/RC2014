; An example program that views command line options passed to the program

; =============================================================================
; Base page memory declarations in the first 255 bytes of memory
boot        equ $0          ; The CP/M warm boot vector
bdos        equ $5          ; CP/M BDOS vector address
fcb1        equ $5C         ; CP/M default File Control Block (FCB)
fcb2        equ $6C         ; CP/M secondary File Control Block (FCB)
cmdlen      equ $80         ; The length of the command line tail that follows
cmdline     equ $81         ; The tail of the command line, 127 bytes long
dma         equ $80         ; default dma buffer, 128 bytes long

; =============================================================================
; BDOS functions
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

data:
fcb1_msg:   db "FCB #1: $"
fcb2_msg:   db "FCB #2: $"
cmd_msg:    db "Commandline:\r\n$"

main:
  ld de, fcb1_msg
  call write_str            ; Write the FCB1 header
  ld hl, fcb1
  call display_fcb          ; Display the first File Control Block

  ld de, fcb2_msg
  call write_str            ; Write the FCB2 header
  ld hl, fcb2
  ;call display_fcb          ; Display the second File Control Block

  ld de, cmd_msg
  call write_str            ; Write the commandline header
  ;call display_commandline  ; Display the command line tail

  ; Warm boot CP/M
  jp boot

; =============================================================================
; Displays a file control block starting at register (HL)
; When a program starts, if the first two command line arguments are
; filenames, CP/M will load them into the two FCBs in low memory.
; This method displays the drive and filename in the FCB
display_fcb:
  ld a,(hl)                 ; Load the first byte, the drive, of the FCB
  inc hl
  cp 0
  jr z, display_filename    ; If it is 0, it is the default drive, don't show

  add 'A'-1                 ; Convert the drive number to a letter
  call write_char           ; Output the drive letter
  ld a, ':'
  call write_char           ; Output the colon after the drive letter

display_filename:
  ld b, 8                   ; The first part of the filename is 8 chars long
  call write_str_skip_space

display_extension:
  ld a, '.'
  call write_char           ; For simplicity, I'm always outputing the dot
                            ; even if the extension is empty
  ld b, 3                   ; The extension is three chars long
  call write_str_skip_space

  call write_newline        ; Newline at the end
  ret

; =============================================================================
; Displays the command line tail in the buffer with each word separated by
; spaces on a new line
display_commandline:
  ld hl, cmdlen
  ld b, (hl)                ; Get the length of the command line
cmd_loop:
  inc hl
  ld a, (hl)
  cp space
  call z, write_newline     ; If it is a space, print \r\n instead
  jr z, cmd_next
  call write_char           ; Output the next char of the command line
cmd_next:
  djnz cmd_loop

  call write_newline        ; Newline at the end
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

; =============================================================================
; Writes a string pointed at by (HL) with a length in the B register
; to the console. This isn't the BDOS c_writestr call which is $ terminated
; This skips spaces but continues incrementing HL
write_str_skip_space:
  ld a, (hl)                ; Load the next char of the string
  inc hl
  ;cp space                  ; Is it a space
  ;jr z, skip_space          ; Don't display spaces but continue to inc HL
  call write_char           ; Display the next char of the string
skip_space:
  djnz write_str_skip_space
  ret
