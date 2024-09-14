diskload:

mov [BOOT_DISK], dl  

xor ax, ax
mov es, ax
mov ds, ax
mov bp, 0x8000
mov sp, bp

mov bx, KERNEL_LOCATION
mov dh, 20

mov ah, 0x02
mov al, dh
mov ch, 0
mov cl, 2
mov dh, 0
mov dl, [BOOT_DISK]
int 0x13

mov ah, 0x00
mov al, 0x03
int 0x10
