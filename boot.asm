[org 0x7c00]
; if this is changed, need to also change makefile
KERNEL_OFFSET equ 0x1000
mov bp, 0x8000
mov sp,bp

mov bx, MSG_16
call print_string

call load_kernel

call switch_to_pm

; we shouldn't make it here
mov bx, MSG_16
call print_string

jmp $

%include "print_string.asm"
;%include "boot.asm"
%include "load_32.asm"
%include "gdt.asm"
%include "print_string_pm.asm"
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
mov ebx, MSG_32
call print_string_pm
call KERNEL_OFFSET

jmp $

MSG_16      db 'Currently in 16-bit real mode!', 0
MSG_32      db 'Made it to 32 bit Mode!', 0
BOOT_DRIVE  db 0


times 510-($-$$) db 0

dw 0xaa55
