#!/bin/bash

# Assemble bootloader and kernel
nasm -f bin boot.asm -o boot.bin
nasm -f bin kernel.asm -o kernel.bin

# Pad bootloader to 512 bytes
truncate -s 512 boot.bin

# Create OS image (bootloader + kernel)
cat boot.bin kernel.bin > os-image.img

# Run using QEMU
qemu-system-x86_64 -drive file=os-image.img,format=raw,if=floppy



