GLOBAL memmove

; rax -- void * pointer to destination
; rdi -- void * pointer to destination
; rsi -- void * pointer to source
; rdx -- size_t number of bytes to be copied

memmove:
	cmp rdx, 0
	je _regularExit
	cmp rdi, rsi
	jg _backwardCopy
	jl _forwardCopy
	je _regularExit

_backwardCopy:
	mov rcx, rdx
	dec rcx
_backwardCopyLoop:
	mov al, [rsi + rcx]
	mov [rdi + rcx], al
	cmp rcx, 0
	dec rcx
	jl _regularExit
	jmp _backwardCopyLoop

_forwardCopy:
	mov rcx, 0
_forwardCopyLoop:
	mov al, [rsi + rcx]
	mov [rdi + rcx], al
	inc rcx
	cmp rdx, rcx
	je _regularExit
	jmp _forwardCopyLoop

_regularExit:
	mov rax, rdi
	ret