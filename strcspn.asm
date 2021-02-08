GLOBAL strcspn

; rax -- size_t number of rejected characters
; rdi -- char * source
; rsi -- char * string of rejected characters

; rcx counter for source
; r8b byte of rdi
; rbx  counter for accept
; r9b byte of rsi

strcspn:
	mov rax, 0
	mov rcx, rdi
	mov rbx, rsi
	jmp _strcspnLoop

_increment:
	inc rcx
	inc rax

_strcspnLoop:
	mov r8b, [rcx]
	cmp r8b, 0
	je _regularExit
	mov rbx, rsi

_strcspnRejectLoop:
	mov r9b, byte[rbx]
	cmp r9b, r8b
	je _regularExit
	cmp r9b, 0
	je _increment
	inc rbx
	jmp _strcspnRejectLoop

_regularExit:
	ret