# Z80 Assembly Language Programming

Source code from working through the book [Z80 Assembly Language Programming
by Lance A. Leventhal](https://archive.org/details/Z-80_Assembly_Language_Programming_1979_Leventhal)

## Chapters

- Chapter 4 - Simple Programs
- Chapter 5 - Simple Program Loops
- Chapter 6 - Character-coded Data
- Chapter 7 - Code Conversion
- Chapter 8 - Arithmetic Problems
- Chapter 9 - Tables and Lists
- Chapter 10 - Subroutines
- Chapter 11 - Input/Output
- Chapter 12 - Interupts
- Chapter 13 - Problem Definition and Program Design
- Chapter 14 - Debugging and Testing
- Chapter 15 - Documentation and Redesign
- Chapter 16 - Sample Projects

## Compiling

```sh
z80asm -b -l -s -m -O=bin -o=8BitAdd.com 8BitAdd.asm
```

```sh
sjasmplus 8BitAdd.asm --nologo --outprefix=bin/ --lst --color=on --inc=./include --raw=bin/8BitAdd.com
```

## Debugging

```sh
z88dk-ticks -trace -d -mz80 -x bin/8BitAdd.map bin/8BitAdd.com
```

```sh
z80emu bin/8BitAdd.com
```
