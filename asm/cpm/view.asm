; Views a file passed in on the command line

; =============================================================================
  org $100                  ; CPM Program start address
  jp main                   ; skip over the data block

  include "cpm.inc"

data:
; Error messages
usage:      db "Usage: VIEW [DRIVE:]<FILENAME.EXT>\r\n$"
err_open:   db "Failed to open file\r\n$"
err_read:   db "Error reading file\r\n$"

main:
  ; Check the FCB contains a file
  ld hl, fcb1
  inc hl
  ld a, (hl)                ; Load the first char of the filename
  cp space
  jp nz, open_file          ; If it is a space, no file was given on the cmdline
  ld de, usage
  call write_string         ; Display usage info
  jp boot                   ; Warm boot CP/M

open_file:
  ; Call BDOS function to open the file
  ld de, fcb1
  ld c, f_open              ; Function number for "open file"
  call bdos

  ; Check if the file was opened successfully
  cp $FF                    ; FF in A indicates an error
  jp nz, file_opened_successfully

  ; Handle error opening file
  ld de, err_open
  call write_string

  jp boot                   ; Warm boot CP/M

file_opened_successfully:
  ; File is now open for reading
  ; Start reading in the data 128 bytes at a time
  ld de, fcb1
  ld c, f_read
  call bdos
  cp a, 1                   ; 1 is EOF
  jr z, eof
  cp a, 0                   ; 0 is success
  jr nz, read_error

  ; Successfully read 128 bytes, output it
  ld hl, dma
  ld b, $80
write_loop:
  ld a, (hl)
  inc hl
  cp subz                   ; Is it a SUB/Ctrl+Z char?
  jr z, eof                 ; Stop output

  call write_char
  djnz write_loop

  jr file_opened_successfully ; Read the next 128 bytes

read_error:
  ld de, err_read
  call write_string

eof:
  jp boot                   ; Warm boot CP/M
