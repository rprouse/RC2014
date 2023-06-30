; Get a file listing
  org 100H      ; CPM Program start address

  jp main

  include "cpm.inc"

main:
  ld hl,drivestr
  call PRINT_STR

  ld c,DRV_GET
  call BDOS
  add 'A'
  call PRINT_CHAR
  call PRINT_NEWLINE

  ld hl,userstr
  call PRINT_STR
  ld c,F_USERNUM
  ld e,$FF        ; Get the user number
  call BDOS
  add '0'
  call PRINT_CHAR
  call PRINT_NEWLINE

  ld c,F_SFIRST
  ld de,fcb_drive
  call F_SFIRST
  ld a,'$'
  ld (fcb_extension),a
  ld hl,filename
  call PRINT_STR
  call PRINT_NEWLINE

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
