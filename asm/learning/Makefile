ASM=sjasmplus
ASMFLAGS=--lst --color=on --inc=./include --raw=

BINDIR=bin

SRCS=$(wildcard ./*.asm)
BINS=$(patsubst ./%.asm, $(BINDIR)/%.com, $(SRCS))

.DEFAULT_GOAL := default

default: all

all:setupdirs clean $(BINS)

$(BINDIR)/%.com: %.asm
	$(ASM) $< $(ASMFLAGS)$@

# Initial project setup helper
setupdirs:
	@echo Creating project directories
	@if test -d $(BINDIR); then echo Re-using existing directory \'$(BINDIR)\' ; else mkdir $(BINDIR); fi

clean:
	$(RM) -r $(BINDIR)/*