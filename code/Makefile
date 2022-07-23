RM_BINARY=rm
RM_FLAGS=-rf
MKDIR_BINARY=mkdir
MKDIR_FLAGS=-p
BUILD_FOLDER=$(abspath ./bin)
DIR = $(abspath .)
INPUTS = $(wildcard $(DIR)/*.asm)
SJASMPLUS_BINARY = sjasmplus
SJASMPLUS_FLAGS = --color=on --inc=./include

.DEFAULT_GOAL := default

# Create the build folder
$(BUILD_FOLDER):
	$(MKDIR_BINARY) $(MKDIR_FLAGS) $(@)

# Compiles all ASM files in a given
$(INPUTS) : $(BUILD_FOLDER)
	$(SJASMPLUS_BINARY) $@ $(SJASMPLUS_FLAGS)  --lst=$(patsubst $(DIR)/%.asm,$(BUILD_FOLDER)/%.lst,$(@)) --raw=$(patsubst $(DIR)/%.asm,$(BUILD_FOLDER)/%.com,$(@))

default: clean all

all: $(INPUTS)

clean:
	$(RM_BINARY) $(RM_FLAGS) $(BUILD_FOLDER)