; kernel.asm
[org 0x7E00]
bits 16

start:
    mov si, kernel_msg

.print_loop:
    lodsb
    or al, al
    jz halt
    mov ah, 0x0E
    int 0x10
    jmp .print_loop

halt:
    cli
    hlt

kernel_msg db "Kernel: Hello from the Kernel!", 0

