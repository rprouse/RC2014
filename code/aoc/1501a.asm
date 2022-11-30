; Advent of Code 2015 day 1 part 1
; sjasmplus 1501a.asm --lst --color=on --inc=./include --raw=1501a.com
  org $100

  jp main

BDOS	EQU 5
COUT	EQU 2
PRINT	EQU 9

main:
  ld de,0               ; We'll count in the 16 bit de register
  ld hl,data

loop:
  ld a,(hl)             ;Get character
  and a                 ;Is it zero?
  jr z,answer           ;If so, we're done
  inc hl

  cp ')'
  jp nz,dec

inc:
  inc de
  jp loop

dec:
  dec de
  jp loop

answer:
  ; High byte
  ld a,d
  call bin2hex

  ; High nibble
  ld e,h          ;E = char to send.
  ld c,2          ;we want BDOS func 2.
  call BDOS       ;call BDOS function.

  ; Low nibble
  ld e,l          ;E = char to send.
  ld c,2          ;we want BDOS func 2.
  call BDOS       ;call BDOS function.

  ; Low byte
  ld a,e
  call bin2hex

  ; High nibble
  ld e,h          ;E = char to send.
  ld c,2          ;we want BDOS func 2.
  call BDOS       ;call BDOS function.

  ; Low nibble
  ld e,l          ;E = char to send.
  ld c,2          ;we want BDOS func 2.
  call BDOS       ;call BDOS function.

  ret

; Binary to ASCII Hex
;
; Entry:  Register A = Binary Data
; Exits:  Register H = ASCII most significant digit
;         Register L = ASCII least significant digit
; Registers used: AF, B, HL
bin2hex:
  ; Convert high nibble
  ld b,a
  and $F0
  rrca
  rrca
  rrca
  rrca
  call nascii
  ld h,a

  ; Convert low nibble
  ld a,b
  and $0F
  call nascii
  ld l,a
  ret

nascii:   ; convert a hex digit to ASCII
  cp 10
  jr c,nas1
  add a,7

nas1:
  add a,'0'
  ret

data:
  db "()(((()))(()()()((((()(((())(()(()((((((()(()(((())))((()"
  db "(((()))((())(()((()()()()(((())(((((((())))()()(()(()(())"
  db "(((((()()()((())(((((()()))))()(())(((())(())((((((())())"
  db "))(()())))()))))()())()())((()()((()()()()(()((((((((()()"
  db "())((()()(((((()(((())((())(()))()((((()((((((((())()((()"
  db "())(())((()))())((((()())(((((((((((()()(((((()(()))())(("
  db "(()(()))())((()(()())())())(()(((())(())())()()(()(()((()"
  db "))((()))))((((()(((()))))((((()(()(()())())()(((()((((())"
  db "((((()(((()()(())()()()())((()((((((()((()()))()((()))()("
  db "()()((())))(((()(((()))((()((()(()))(((()()(()(()()()))))"
  db "()()(((()(((())())))))((()(((())()(()(())((()())))((((())"
  db "))(()(()(()())()((()())))(((()((()(())()()((()((())(()()("
  db "(())(())()))()))((()(())()))())(((((((()(()()(()(())())))"
  db "))))(()((((((())((((())((())())(()()))))()(())(()())()())"
  db "((())(()))))(()))(()((()))()(()((((((()()()()((((((((()(("
  db ")(())((()()(()()))(())()())()((())))()))()())(((()))(())("
  db ")(())()))()((()((()(()()())(())()()()((())())))((()()(()("
  db ")((()(())()()())(((()(()()))))(())))(()(()())()))()()))))"
  db "))()))))((((((())))())))(()(())())(()())))))(()))()))))))"
  db "()((()))))()))))(()(()((()())())(()()))))(((())()))())())"
  db "())(((()(()()))(())()(())(())((((((()()))))((()(()))))))("
  db "()))())(((()()(()))()())()()()())))))))))))))(())(()))(()"
  db "))((()(())(()())(())())(()())(())()()(()())))()()()))(())"
  db "())()))())())(())((())))))))(())))(())))))()))))((())(()("
  db "((()))))(()))()((()(())))(()())(((((()))()())()()))))()))"
  db "))()))())(()(()()()))()))))))((()))))))))))()((()))((()(("
  db "))((())()()(()()))()(()))))()()(()))()))(((())))(())()((("
  db "))(())(()())()())())))))))())))()((())))()))(()))()()))(("
  db "(((((()))())(()()))(()()(()))()(()((()())()))))))(((()()("
  db ")())))(())()))()())(()()))()()))))))))(())))()))()())))))"
  db ")()))()())))()(())(())))))()(())()()(()()))))())((()))))("
  db ")))))(()(((((()))))))))())))())()(())()()))))(())))())()("
  db ")())()()())()(()))))()))()))))))))())))((()))()))()))()))"
  db ")()())()()())))())))(()((())()((()))())))))())()(())((())"
  db "))))))))))())()())(())())())(()))(()))()))())(()(())())()"
  db "())()()(()))))(()(())))))))(())))())(())))))))())()()(())"
  db "())())))(())))))()))()(()())()(()))())())))))()()(()))())"
  db ")))())))))))))()))))()))))))())()())()()))))()())))()))))"
  db ")))))))()()))))()()(((()))()()(())()))))((()))))(()))(())"
  db "())))(())()))))))(()))()))))(())())))))()))(()())))))))))"
  db "))))())))))))))()((()())(()())))))))((()))))(())(())))()("
  db "()())())))())())(()()()())))()))))))())))))())()()())))))"
  db "))))))()()(()))))()())()))((()())(()))))()(()))))))))))()"
  db "())())(((())(()))))())()))()))()))))))()))))))(()))))()))"
  db "))()(())))(())))(()))())()()(()()))()))(()()))))))))()))("
  db "()))())(()()(()(()())()()))()))))))))(())))))((()()(()))("
  db "))())))))()))())(()())()()))())))()(()()()()))((())())))("
  db "))()(()()))()))))))))(()))(())))()))))(()(()())(()))))()("
  db "))())()))()()))())))))))))))())()))))))()))))))))())))))("
  db ")))))())(()())))(())()))())())))))()()(()()())(()())))()("
  db ")))(((()))(()()()))))()))))()))))((())))()((((((()())))))"
  db ")())))))))))))(((()))))))))))))(())())))))())(()))))))(()"
  db "))((()))())))()(()((()))()))()))))))))))())()))()(()())))"
  db ")())))())(())()(()))()))())(()))()))))(()()))()()(())))))"
  db "()))(())(()(()()))(()()())))))(((()))))))()))))))))))))(("
  db "))(()))))()())())()()((()()))())))))(()))))())))))))()()("
  db ")))))))))())))()(((()()))(())))))(((())())))))((()))()(()"
  db "))(()))))(()())))(()))())))))()))))(())(())))()((()))(())"
  db "())))()()))()))))))))()))(()()()(()()()(()))())(())()())("
  db "((()))(())))))))))(((()())))()()))))))))()(())(()))()(((("
  db "())(())(()())))()))(((())()()()))((()))(()))())())))())))"
  db "(()))())()())())(()(())())()()()(())))())(())))(())))(())"
  db "()))()))(()((()))))))))())(()))))))())(()()))()()))()(()("
  db "()())))()()(()((()((((((()))(())))()()()))())()))((()()(("
  db ")))())((()(()(()))(()()))))()())))()))()())))))))()()((()"
  db "())(())))()))(()))(())(()))())(()(())))()()))))))(((()((("
  db "()()))()(()(())())((()()))()))()))()))()(()()()(()))((()("
  db "))()(())))()()))(((())()()())(())()((()()()()(()(())(()()"
  db "))()(((((()())))((())))))(()()()))))(((()(())))()))((()(("
  db "()(())()(()((())))((()())()(()))(((()())()()(()))(())(((("
  db ")((()())()((())()())(((()()))((()((())(()))(()())(()()())"
  db ")((()))(())(()((()()())((()))(())))(())(())(())))(()())))"
  db "(((((()(()(((((()())((((()(()())(())(()()(((())((()(((()("
  db ")(((()()((((((())))())(()((((((()(()))()))()()((()((())))"
  db ")()(()()(()((()()))))))(((((()(((((())()()()(())())))))))"
  db "()))((()()(())))(())(()()()())))))(()((((())))))))()()((("
  db "()(()(()(()(()())()()()(((((((((()()())()(()))((()()()()("
  db ")(((((((()())()((())()))((((((()(()(()(()())(((()(((((((("
  db ")(((())(((((((((())(())())()))((()(()))(((()()())(())(()("
  db "()()(((()(())()))())))(())((((((())(()()())()()(((()(((()"
  db ")(()(((())(((((((()(((((((((()))(())(()(()(()))))((()))()"
  db "(())())())((()(()((()()))((()()((()(())(())(()((())(((())"
  db "(((()()()((((((()()(())((((())()))))(())((()(()((())))((("
  db "((()(()()())())((())())))((())((()((()()((((((())(((()()("
  db "()())())(()(()))(()(()))())())()(((((((()(((()(())()()((("
  db "))((()(()()((()(()()(((((((((((())((())((((((())((()((((("
  db ")(()((((()(((((((())()((()))))())()((()((((()(()(((()((()"
  db "())))(())())(((()(((())((((((()(((((((((()()(())))(()(((("
  db "(()((((()())))((()((()((()(()()(((())((((((((((((()(((())"
  db "(()(((((()))(()()(()()()()()()((())(((((((())(((((())))))"
  db "())()(()()(()(()(((()()(((((())(()((()((()(((()()((()(((("
  db "())()))()((((())(())))()())(((())(())(()()((()(((()()(((("
  db "((((((()()(()())())(((((((((())((((()))()()((((())(()(((("
  db "()(((())())(((((((((((()((((())))(())(()(((()(((()((())(("
  db "(((()((()()(()(()()((((((()((((()((()(()((()(()((((((()))"
  db "))()()(((((()((()(()(())()))(())(((((((()((((()())(()((()"
  db "((()(()))())))(())((()))))(((((((()()()())(()))(()()((()("
  db "))()((()((()()()(()(()()))(()())(())(((((()(((((((((((()("
  db "(()(((()(((((((()()((((((()(((((()(()((()(((((())((((((()"
  db "))((((())((()()((())(((())()(((((()()(((((()((()(()(((((("
  db "(()(((((()((()((()((())(())((())(()))()()))(()()(()(()()("
  db "((((((()(((()(((())()(((((()((((((()())((((())()((()((()("
  db "()()())(()))((((()()((((((()((()(()(()((((()((()((())(((("
  db "((()(()(())((((((()((((((((((()((())()))()(()(()(((((()()"
  db "()))((())))()(()((((((((((((((()(((()((((()((())((()((()("
  db "((()()(()(((()((())(()()())))()(()(()(((((()()(()(()((((("
  db ")(((((())()(()(()))(((((()()(((()()(())((((((((((((((())("
  db "(())(((((((((((())()()()(())()(()(()(((((((((())(((()))(("
  db ")()())(()((((()(())(((((()())(())((((((((())()((((()((((("
  db "(())(()((()(())(((()((((()))(((((((((()()))((((()(())()()"
  db "()(())(()((())((()()))()(((())(((((())((((((()()))((((((("
  db "((()((((((())))(((((((()((()(()(())))())(()(()))()(((((()"
  db "())(()))()(()(())(((()))))())()())))(((((()))())()((()(()"
  db "))))((()()()((((((()))()()((((((((())((()(()(((()(()((())"
  db "((()())(()((((())(()(((()()()(()(()()))())())((((((((((()"
  db ")())((()))()((())(())(())))())()(()()(())))())(()))(((()("
  db "()()(((()(((())))()(((()(())()((((((())()))()))()((((((()"
  db "(()(((((()())))()))))())()()(((()(((((())((()()(()((()((("
  db ")(()(()(())))(()()()()((()(())(((()((()))((((()))())(()))"
  db ")())(()))()()()())()))(((()()())()((())))(())(()()()()(()"
  db "())((()(()()((((())))((()((()(())((()(()((())()(()()(((()"
  db "())()()())((()))((())(((()()(())))()()))(((()((())()((((("
  db "()())(())((())()())())((((((()(()(((((()))(()(",0
