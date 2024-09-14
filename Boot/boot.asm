[org 0x7c00]
KERNEL_LOCATION equ 0x1000
BOOT_DISK: db 0

%include "./diskload.asm"
%include "./switch_to_pm.asm"
%include "./print_string.asm"

mov bp, 0x8000
mov sp, bp

call diskload

%include "gdt.asm"

call switch_to_pm

times 510-($-$$) db 0
dw 0xaa55