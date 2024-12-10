# WinterOS

An amazing operating system for the Frost64 architecture.

# Building

To build WinterOS simply run:
```sh
make
```
This will produce an `dist/disk.iso`, to use this you can run it like this:
```sh
frost64-emu -p firmware.bin -D dist/disk.iso
```
*Note: The firmware.bin is provided by WinterOS in dist/firwmare.bin, but we dont grantee that its up-to date. So you can get your own firmware build from: https://github.com/kevinalavik/WinterOS-Firmware, this is a fork of the official firmware.*

# License

The WinterOS is entirely licensed under the MIT license, see LICENSE for more information.
The Frost64 firmware itself is licensed under the GPL-3.0 license, Copyright (©) 2024 Frosty515.
The Frost64 emulator and assembler is both also licensed under the GPL-3.0 license, Copyright (©) 2024 Frosty515.