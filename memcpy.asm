GLOBAL memcpy

; rax -- void * pointer to destination
; rdi -- void * pointer to destination
; rsi -- void * pointer to source
; rdx -- size_t number of bytes to be copied

memcpy:
	mov rcx, 0 ; set counter to 0
	cmp rdx, 0 ; check if no bytes should be copied
	je _regularExit

_memcpyLoop:
	mov al, [rsi + rcx]
	mov [rdi + rcx], al ; copy character from source to destination
	inc rcx ; increase counter
	cmp rdx, rcx ; compare if all necessary bytes were cpied
	je _regularExit
	jmp _memcpyLoop

_regularExit:
	mov rax, rdi ; set return value
	ret