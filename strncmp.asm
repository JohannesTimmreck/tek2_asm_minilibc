GLOBAL strncmp

; rax -- int difference between first position/0 when equal
; rdi -- char * pointer to first string
; rsi -- char * pointer to second string
; rdx -- size_t number of characters to be compared

strncmp:
	mov rax, 0
	mov rcx, 0
	mov rbx, 0
	mov r8, 0
	cmp rdx, 0
	je _equalExit
	jmp _strcmpLoop

_increment:
	cmp bl, 0
	je _equalExit
	inc rcx
	cmp rdx, rcx
	je _equalExit

_strcmpLoop:
	mov bl, [rdi + rcx]
	mov r8b, [rsi + rcx]

_compare:
	cmp bl, r8b
	je _increment
	jg _greaterExit
	jl _lowerExit

_greaterExit:
	mov rax, 1
	ret

_lowerExit:
	mov rax, -1
	ret

_equalExit:
	mov rax, 0
	ret