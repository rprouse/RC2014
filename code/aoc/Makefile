CC=zcc
CFLAGS=+cpm -O3 -o

BINDIR=bin

SRCS=$(wildcard ./*.c)
BINS=$(patsubst ./%.c, $(BINDIR)/%.com, $(SRCS))

.DEFAULT_GOAL := default

default: all

all:setupdirs clean $(BINS)

$(BINDIR)/%.com: %.c
	$(CC) $(CFLAGS)$@ $<

# Initial project setup helper
setupdirs:
	@echo Creating project directories
	@if test -d $(BINDIR); then echo Re-using existing directory \'$(BINDIR)\' ; else mkdir $(BINDIR); fi

clean:
	$(RM) -r $(BINDIR)/*