; Views a file passed in on the command line

; =============================================================================
; Base page memory declarations in the first 255 bytes of memory
boot        equ $0          ; The CP/M warm boot vector
bdos        equ $5          ; CP/M BDOS vector address
fcb         equ $5C         ; CP/M default File Control Block (FCB)
dma         equ $80         ; default dma buffer, 128 bytes long

; =============================================================================
; BDOS functions
c_write     equ $02         ; console output
c_writestr  equ $09         ; output string, '$' terminated, to console output
f_open      equ $0f         ; open file
f_close     equ $10         ; close file
f_read      equ $14         ; read next file record

; =============================================================================
; Other defines
subz        equ $1A         ; SUB or Ctrl-Z
space       equ $20         ; Space character

; =============================================================================
  org $100                  ; CPM Program start address
  jp main                   ; skip over the data block

data:
; Error messages
usage:      db "Usage: VIEW [DRIVE:]<FILENAME.EXT>\r\n$"
err_open:   db "Failed to open file\r\n$"
err_read:   db "Error reading file\r\n$"

main:
  ; Check the FCB contains a file
  ld hl, fcb
  inc hl
  ld a, (hl)                ; Load the first char of the filename
  cp space
  jp nz, open_file          ; If it is a space, no file was given on the cmdline
  ld de, usage
  ld c, c_writestr
  call bdos                 ; Display usage info
  jp boot                   ; Warm boot CP/M

open_file:
  ; Call BDOS function to open the file
  ld de, fcb
  ld c, f_open              ; Function number for "open file"
  call bdos

  ; Check if the file was opened successfully
  ld a, l
  or a
  jp z, file_opened_successfully

  ; Handle error opening file
  ld de, err_open
  ld c, c_writestr
  call bdos
  jp boot                   ; Warm boot CP/M

file_opened_successfully:
  ; File is now open for reading
  ; Start reading in the data 128 bytes at a time
  ld de, fcb
  ld c, f_read
  call bdos
  cp a, 1                   ; 1 is EOF
  jr z, eof
  cp a, 0                   ; 0 is success
  jr nz, read_error

  ; Successfully read 128 bytes, output it
  ld hl, dma
  ld bc, 128
write_loop:
  ld a, (hl)
  inc hl
  cp subz                   ; Is it a SUB/Ctrl+Z char?
  jp z, eof                 ; Stop output

  ld e, a
  ld c, c_write
  call bdos
  djnz write_loop

read_error:
  ld de, err_read
  ld c, c_writestr
  call bdos

eof:
  jp boot                   ; Warm boot CP/M
