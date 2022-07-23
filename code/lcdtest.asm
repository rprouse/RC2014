;********************
;Some simple test code to write commands and data to a
;character LCD display
    include "lcd.inc"
;
;Tested with the SjASMPlus assembler
; sjasmplus lcdtest.asm --lst --color=on --inc=./include --raw=lcdtest.com
;********************
    org $100               ; CPM Program start address

    ;Initialization
    ld a,lcd_set_8bit
    call lcd_send_command

    ld a,lcd_cursor_on
    call lcd_send_command

    ld a,lcd_cls
    call lcd_send_command

    ; Go to line
    ld a,lcd_line1
    call lcd_send_command

    ;Send a string
    ld hl,rc2014
    call lcd_send_asciiz

    ; Go to line
    ld a,lcd_line2
    call lcd_send_command

    ;Send a string
    ld hl,bytes_free
    call lcd_send_asciiz

    ; Go to line
    ld a,lcd_line3
    call lcd_send_command

    ;Send a string
    ld hl,ready
    call lcd_send_asciiz

    ; Go to line
    ld a,lcd_line4
    call lcd_send_command

    ;Send a single character
    ld a,'>'
    call lcd_send_data

    ret                 ;return control back to CPM.

rc2014:
    db "RC2014 Z80 Computer",0

bytes_free:
    db "29752 Bytes free",0

ready:
    db "READY",0