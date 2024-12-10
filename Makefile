MAKEFLAGS += --no-print-directory

ASM := frost64-asm
EMU := frost64-emu

FIRMWARE_DIR := firmware
BOOT_DIR := boot
BIN_DIR := bin
DIST_DIR := dist

FIRMWARE_BIN := $(FIRMWARE_DIR)/bin/firmware.bin
BOOTLOADER_BIN := $(BOOT_DIR)/boot.bin
DISK_IMAGE := $(DIST_DIR)/disk.iso

export ASM

.PHONY: all firmware bootloader image run clean

all: image

firmware:
	@printf "\tMAKE $(FIRMWARE_DIR)\n"
	@$(MAKE) -sC $(FIRMWARE_DIR)

bootloader:
	@printf "\tMAKE $(BOOT_DIR)\n"
	@$(MAKE) -sC $(BOOT_DIR)

image: firmware bootloader
	@mkdir -p $(DIST_DIR)
	@cp $(FIRMWARE_BIN) $(DIST_DIR)/
	@cp $(BOOTLOADER_BIN) $(DIST_DIR)/

	@dd if=/dev/zero of=$(DISK_IMAGE) bs=1k count=8 status=none
	@dd if=$(DIST_DIR)/boot.bin of=$(DISK_IMAGE) conv=notrunc status=none

clean:
	$(MAKE) -C $(FIRMWARE_DIR) clean
	$(MAKE) -C $(BOOT_DIR) clean
	rm -rf $(BIN_DIR) $(DIST_DIR)

debug: all
	@printf "\tRUN $(DISK_IMAGE)\n"
	@$(EMU) -p$(FIRMWARE_BIN) -D$(DISK_IMAGE)
