; Test the behaviour of the PV flag
  org 100H

  ccf
  ld a, 80H
  adc 80H
  halt
