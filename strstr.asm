GLOBAL strstr

; rax char * located substr
; rdi char * haystack
; rsi char * needle

; rcx counter for haystack
; al byte of rdi
; r8  counter for needle
; r9b byte of rsi

strstr:
	mov rax, rdi
	mov r8, 0
	mov r9, 0
	jmp _haystackLoop

_increment:
	inc rax

_haystackLoop:
	mov r9b, [rsi + r8]
	cmp byte[rax], 0
	je _compareLast
	cmp byte[rax], r9b
	jne _restartNeedle

_normalNeedle:
	inc r8
	jmp _increment

_restartNeedle:
	cmp r9b, 0
	je _regularExit
	mov r8, 0
	jmp _increment

_compareLast:
	cmp r9b, 0
	jne _errorExit

_regularExit:
	sub rax, r8
	ret

_errorExit:
	mov rax, 0
	ret