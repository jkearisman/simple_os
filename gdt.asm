gdt_start:
;; What follows are multiple gdt entries.
;; Format is as follows, each entry is 1 byte
;;	limit 0-7
;;	limit 8-15
;;	base 0-7
;;	base 8-15
;;	base 15-23
;;	acces byte flags
;;	other flags and limit 16-19
;;	base 24-31

;; Access byte, left to right
;; 7: Present bit, 1 for valid selectors
;; 6-5: Privilige bits, 00 is kernel
;; 4: just a 1?
;; 3: Executable? 1 for yes
;; 2: direction/conforming bit. If 0, code can only be executed by same priv_level
;; 1: read/write bit, 0 for code selectors
;; 0: Access bit, just set to 0, (apperently?)

;; more flags in top 4 bits
;; 7: granularity, 0 means 4KiB (page) granularity
;; 6: size, 1 is 32 bits
;; 5-4: just set to 0

gdt_null: ;;Mandatory Null discriptor, 8 bytes of 0s
db 0x0
db 0x0
db 0x0
db 0x0
db 0x0
db 0x0
db 0x0
db 0x0

gdt_code: ;; the code that we boot into
db 0xff
db 0xff
db 0x0
db 0x0
db 0x0
db 10011010b
db 11001111b
db 0x0

gdt_data:
db 0xff
db 0xff
db 0x0
db 0x0
db 0x0
db 10010010b
db 11001111b
db 0x0

gdt_end:

;; Just like an idt descriptor, a gdt descriptor is 8 bytes of size
;; followed by 32 bits of location
gdt_descriptor: 
dw gdt_end - gdt_start - 1
dd gdt_start

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start


