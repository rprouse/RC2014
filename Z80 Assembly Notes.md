# Z80 Assembly Notes
## Jumps and Conditionals
| Command | Description                            | Example     |
| ------- | -------------------------------------- | ----------- |
| JP ##   | Jump to address or label               | JP &4000    |
| JP c,## | Jump on condition to address or label. | JP NZ,&4000 |
| JR #    | Jump relative to current position      | JR label    |
| JR c,#  | Jump relative on condition             | JR Z,label  |
| JP (HL) | Jump to address in HL register         | JP (HL)     |
| DJNZ #  | Decreases B and Jumps if B is NotZero  | DJNZ label  |

The following conditionals usually follow a `CP ##` which compares the literal value to the A register.
| Conditional | Example     | Description              |
| ----------- | ----------- | ------------------------ |
| Carry       | JP C,label  | A<CP or Carry flag set   |
| NoCarry     | JP NC,label | A>=CP of Carry not set   |
| Zero        | JP Z,label  | A=CP                     |
| NotZero     | JP NZ,label | A!=CP                    |
| ParityOdd   | JP PO,label | Odd number of bits in A  |
| ParityEven  | JP PE,label | Even number of bits in A |
| Positive    | JP P,label  | First bit of A is 0      |
| Minus       | JP M,label  | First bit of A is 1      |

## Other
**LDIR** means "Load, Increment Repeat". It copies BC bytes from memory position HL to memory position DE.
