ASM := frost64-asm
ASM_SRC := boot.asm
ASM_BIN := boot.bin

.PHONY: all clean

all: $(ASM_BIN)

$(ASM_BIN): $(ASM_SRC)
	@printf "\tAS $@\n"
	@$(ASM) -p $< -o $@

clean:
	rm -f $(ASM_BIN)
