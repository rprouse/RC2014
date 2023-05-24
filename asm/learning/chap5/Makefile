BINDIR=bin

SRCS=$(wildcard ./*.asm)
BINS=$(patsubst ./%.asm, $(BINDIR)/%.com, $(SRCS))

# Compile using sjasmplus
# ASM=sjasmplus
# ASMFLAGS=--nologo --outprefix=$(BINDIR)/ --lst --color=on --inc=./include --raw=

# Compile using z80asm from z88dk
ASM=z80asm
ASMFLAGS=-b -l -s -m -o=
.DEFAULT_GOAL := default

default: all

all:setupdirs clean $(BINS)

$(BINDIR)/%.com: %.asm
# $(ASM) $< $(ASMFLAGS)$@
	$(ASM) $(ASMFLAGS)$@ $<

# Initial project setup helper
setupdirs:
	@echo Creating project directories
	@if test -d $(BINDIR); then echo Re-using existing directory \'$(BINDIR)\' ; else mkdir $(BINDIR); fi

clean:
	$(RM) -r $(BINDIR)/*
	$(RM) *.lis
	$(RM) *.o
	$(RM) *.lst
	$(RM) *.sym
	$(RM) .ticks_history.txt
