GLOBAL memset

; rax -- void * pointer to memory
; rdi -- void * pointer to memory
; rsi -- int symbol to which should get set
; rdx -- size_t amount of bytes to get set

memset:
	mov rax, 0
	cmp dl, 0
	je _exit

_memsetLoop:
	mov BYTE[rdi + rax], sil
	inc rax
	cmp rax, rdx
	jne _memsetLoop

_exit:
	mov rax, rdi
	ret