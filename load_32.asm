[bits 16]


switch_to_pm:
	cli
	lgdt [gdt_descriptor]
	mov eax, cr0
	or eax, 0x1
	mov cr0, eax
	jmp CODE_SEG:init_pm

[bits 32]

init_pm:

;; in protected mode, our segment registers are meaningless,
;; point them to the bit we defined in the gdt
	mov ax, DATA_SEG
	mov ds, ax
	mov ss, ax
	mov es, ax
	mov fs, ax
	mov gs, ax

; Set the stack and base pointers to the new stack
	mov ebp, 0x90000
	mov esp, ebp
	
	call BEGIN_PM
