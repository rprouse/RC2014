; Get a file listing
  org 100H      ; CPM Program start address

  jp main

  include "cpm.inc"

main:
  ld de,drivestr
  call write_string

  ld c,drv_get
  call bdos
  add 'a'
  call write_char
  call write_newline

  ld de,userstr
  call write_string
  ld c,f_usernum
  ld e,$ff        ; get the user number
  call bdos
  add '0'
  call write_char
  call write_newline

  ld c,f_sfirst
  ld de,fcb_drive
  call f_sfirst
  ld a,'$'
  ld (fcb_extension),a
  ld de,filename
  call write_string
  call write_newline

  ret

drivestr:
  db "Drive: $";
userstr:
  db "User: $";

fcb_drive:    db 1             ; Drive code (0 = use default drive)
fcb_filename: db "UNARC   "    ; Filename (padded with spaces)
fcb_extension: db "DOC"        ; File extension
fcb_extents:  ds 24            ; Rest of the FCB

fcb:        ; CP/M File Control Block
drive: db 0 ; Drive. 0 for default, 1-16 for A-P.
filename:   ; 8 bytes of 7-bit ASCII
  db "?       "
T1: db 0    ; T1' - Read-Only.
T2: db 0    ; T2' - System (hidden). System files in user 0 can be
            ;       opened from other user areas.
T3: db 0    ; Archive. Set if the file has not been changed
            ;       since it was last copied.
EX: db 0    ; Set this to 0 when opening a file and then leave it to
            ; CP/M. You can rewind a file by setting EX, RC, S2 and CR to 0.
S1: db 0    ; Reserved
S2: db 0    ; Reserved
RC: db 0    ; Set this to 0 when opening a file and then leave it to CP/M.
AL: db 0    ; Image of the second half of the directory entry,
            ; containing the file's allocation (which disc blocks it
            ; owns).
CR: db 0    ; Current record within extent. It is usually best to set
            ; this to 0 immediately after a file has been opened and
            ; then ignore it.
R1: db 0    ; 16-bit value with R2 in CP/M 2
R2: db 0    ; Overflow
R3: db 0    ; 18-bit value in CP/M 3
