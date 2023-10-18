; Adds an entry to a queue

  org $0100

  jp main

main:
  ld hl, queue    ; Load the address of the head of the queue

loop:             ; Find the end of the list
  ld a, (hl)
  inc hl
  ld b, (hl)
  inc hl
  cmp 0
  jp nz, loop     ; Low byte isn't zero, not the end of the list
  ld a, b
  cmp 0
  jp nz, loop     ; High byte isn't zero, not the end of the list

found:            ; We found the end of the list and are pointing at the next element
  dec hl
  dec hl
  ld a, (value)   ; Write value to end of queue
  ld (hl), a
  inc hl
  ld a, (value+1)
  ld (hl), a
  inc hl
  ld (hl), $00    ; Write new end of queue
  inc hl
  ld (hl), $00

  ret

value:    db $4D, $00
queue:    db $46, $00     ; Pointer to head of queue
          db $00, $00     ; Last element in the queue
          db $FF, $FF     ; Check to make sure the new tail is written
