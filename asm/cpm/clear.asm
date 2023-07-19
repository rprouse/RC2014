; Clear the screen and reset colors
  org 100H                  ; CPM Program start address

; =============================================================================
; Definitions and methods for CP/M development
bdos        equ $5          ; CP/M BDOS vector address
c_writestr  equ $09         ; output string, '$' terminated, to console output
esc         equ $1B

main:
  ld de, cls
  ld c, c_writestr
  call bdos
  ret

; =============================================================================
; Datamake
cls:        db esc, "[0m"   ; reset all modes (styles and colors)
            db esc, "[2J"   ; erase entire screen
            db esc, "[H"    ; moves cursor to home position (0, 0)
            db "$"          ; character that terminates c_writestr
