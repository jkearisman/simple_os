gdt_start:

gtt_null:
;;Mandatory Null discriptor, 8 bytes of 0s
	dd 0x0
	dd 0x0

gdt_code:
;; I don't even pretend to understand what this stuff does
;; and hopefully i will never need to
	dw 0xffff
	dw 0x0
	db 0x0
	db 10011010b
	db 11001111b
	db 0x0

gdt_data:
;; For reference 
;; dd is define double word (4 bytes)
;; dw is define word (2 bytes in 16 bit mode)
;; db is define byte
	dw 0xffff
	dw 0x0
	db 0x0
	db 10010010b
	db 11001111b
	db 0x0

gdt_end:

gdt_descriptor:
	dw gdt_end - gdt_start - 1
	dd gdt_start

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start
