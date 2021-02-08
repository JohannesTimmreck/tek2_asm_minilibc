GLOBAL strcmp

; rax -- int difference between first position/0 when equal
; rdi -- char * pointer to first string
; rsi -- char * pointer to second string

strcmp:
	mov rcx, 0
	mov rax, 0
	mov rbx, 0
	mov rdx, 0
	jmp _strcmpLoop

_increment:
	cmp bl, 0
	je _equalExit
	inc rcx

_strcmpLoop:
	mov bl, [rdi + rcx]
	mov dl, [rsi + rcx]

_compare:
	cmp bl, dl
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