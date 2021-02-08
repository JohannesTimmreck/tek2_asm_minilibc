GLOBAL strcasecmp

; rax -- int difference between first position/0 when equal
; rdi -- char * pointer to first string
; rsi -- char * pointer to second string

strcasecmp:
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
	cmp bl, 'A'
	jl _endConvert_bl
	cmp bl, 'Z'
	jg _endConvert_bl
	add bl, 32
_endConvert_bl:
	mov dl, [rsi + rcx]
	cmp dl, 'A'
	jl _endConvert_dl
	cmp dl, 'Z'
	jg _endConvert_dl
	add dl, 32
_endConvert_dl:

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