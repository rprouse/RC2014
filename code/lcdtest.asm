;********************
;Some simple test code to write commands and data to a
;character LCD display

lcd_comm_port equ $20  ;Port addresses. Change as needed.
lcd_data_port equ $21

lcd_set_8bit equ $3f   ;8-bit port, 2-line display
lcd_cursor_on equ $0f  ;Turn cursors on
lcd_cls equ $01        ;Clear the display

lcd_line1 equ 128      ; CMD to move the cursor to the first char of line 1
lcd_line2 equ 192
lcd_line3 equ 148
lcd_line4 equ 212

;
;Tested with the SjASMPlus assembler
;sjasmplus lcdtest.asm --lst --raw=lcdtest.com
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


;******************
;Send a command byte to the LCD
;Entry: A= command byte
;Exit: All preserved
;******************
lcd_send_command:
    push bc              ;Preserve
    ld c,lcd_comm_port   ;Command port

lcd_command_wait_loop:   ;Busy wait
    in b,(c)             ;Read status byte
    sll b                ;Shift busy bit into carry flag
    jr c,lcd_command_wait_loop    ;While busy

    out (c),a            ;Send command
    pop bc               ;Restore
    ret

;******************
;Send a data byte to the LCD
;Entry: A= data byte
;Exit: All preserved
;******************
lcd_send_data:
    push bc              ;Preserve
    ld c,lcd_comm_port   ;Command port

lcd_data_wait_loop:      ;Busy wait
    in b,(c)             ;Read status byte
    sll b                ;Shift busy bit into carry flag
    jr c,lcd_data_wait_loop    ;While busy

    ld c,lcd_data_port   ;Data port
    out (c),a            ;Send data
    pop bc               ;Restore
    ret

;******************
;Send an asciiz string to the LCD
;Entry: HL=address of string
;Exit: HL=address of ending zero of the string. All others preserved
;******************
lcd_send_asciiz:
    push af
    push bc              ;Preserve
lcd_asciiz_char_loop:
    ld c,lcd_comm_port   ;Command port

lcd_asciiz_wait_loop:    ;Busy wait
    in a,(c)             ;Read status byte
    rlca                 ;Shift busy bit into carry flag
    jr c,lcd_asciiz_wait_loop    ;While busy

    ld a,(hl)            ;Get character
    and a                ;Is it zero?
    jr z,lcd_asciiz_done ;If so, we're done

    ld c,lcd_data_port   ;Data port
    out (c),a            ;Send data
    inc hl               ;Next char
    jr lcd_asciiz_char_loop

lcd_asciiz_done:
    pop bc               ;Restore
    pop af
    ret