; Views a file

  org 100H      ; CPM Program start address

  jp main

  include "cpm.inc"

main:
  ; Set up the FCB
  ld hl, fcbdr
  ld (hl), 0 ; Use default drive
  ld hl, filename
  ld de, (fcbfn)
  ld bc, 7
  ldir
  ld hl, filetype
  ld de, (fcbtn)
  ld bc, 3
  ldir
  ld hl, fcbex
  ld (hl), 0 ; Set to 0 when opening a file
  ld hl, fcbrc
  ld (hl), 0 ; Set to 0 when opening a file

  ; Call BDOS function to open the file
  ld de, fcb
  ld c, F_OPEN  ; Function number for "open file"
  call BDOS

  ; Check if the file was opened successfully
  ld a, l
  or a
  jp z, file_opened_successfully

  ; Handle error opening file
  ld hl, err_open
  call PRINT_STR
  ret

file_opened_successfully:
  ; File is now open for reading
  ; Set the DMA address to read into
  ld de, buffer
  ld c, F_SETDMA
  call BDOS

  ; Start reading in the data 128 bytes at a time
  ld de, fcb
  ld c, F_READ
  call BDOS
  cp a, 1        ; 1 is EOF
  jr z, eof
  cp a, 0        ; 0 is success
  jr nz, read_error

  ; Successfully read 128 bytes, output it
  ld hl, buffer
  ld bc, 128
write_loop:
    ld a, (hl)
    inc hl
    ld e, a
    ld c, C_WRITE
    call BDOS
    djnz write_loop

read_error:
  ld hl, err_read
  call PRINT_STR
  ret

eof:
  ret

; Error messages
err_open: db "Failed to open file\r\n$"
err_read: db "Error reading file\r\n$"

filename: db "READ     "
filetype: db "ME "
; fcb - File control block definitions
fcb:    defs 36,0
fcbdr   equ fcb+00h   ; Drive. 0 for default, 1-16 for A-P.
fcbfn   equ fcb+01h   ; Filename, 7-bit ASCII.
fcbtn   equ fcb+09h   ; Filetype, 7-bit ASCII.
fcbex   equ fcb+0Ch   ; Set this to 0 when opening a file and then leave it
fcbrc   equ fcb+0Fh   ; Set this to 0 when opening a file and then leave it
fcbal   equ fcb+10h   ; Image of the second half of the directory entry
fcbcr   equ fcb+20h   ; Current record within extent.
fcbin   equ fcb+21h   ; Fcb length

buffer: defs 128      ; Allocate 128 byte buffer for file data
