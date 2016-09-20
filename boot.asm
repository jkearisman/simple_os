[org 0x7c00]
; if this is changed, need to also change makefile
KERNEL_OFFSET equ 0x1000
mov bp, 0x8000
mov sp,bp

call load_kernel

call switch_to_pm


jmp $

%include "load_32.asm"
%include "gdt.asm"
%include "disk_load.asm"

[bits 16]

load_kernel:
	mov bx, KERNEL_OFFSET
	mov dh, 1
	mov dl, [BOOT_DRIVE]
	call disk_load
	ret

[bits 32]
BEGIN_PM:
call KERNEL_OFFSET

jmp $

BOOT_DRIVE  db 0


times 510-($-$$) db 0

dw 0xaa55
