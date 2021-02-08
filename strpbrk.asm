GLOBAL strpbrk

; rax -- char * return of first appearance
; rdi -- char * "source"
; rsi -- char * string of accept characters

; rax counter for source
; r8b byte of rdi
; rcx  counter for accept
; r9b byte of rsi

strpbrk:
	mov rax, rdi
	jmp _strpbrkSLoop

_increment:
	inc rax

_strpbrkSLoop:
	mov r8b, byte[rax]
	cmp r8b, 0
	je _errorExit
	mov rcx, rsi

_strbrkAcceptLoop:
	mov r9b, byte[rcx]
	cmp r9b, 0
	je _increment
	cmp r9b, r8b
	je _regularExit
	inc rcx
	jmp _strbrkAcceptLoop

_regularExit:
	ret

_errorExit:
	mov rax, 0
	ret