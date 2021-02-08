GLOBAL strchr

; rax -- char * pointer to substr
; rdi -- char * pointer to begin of string
; rsi -- int character to be searched

strchr:
	push rdi
	dec rdi
	cmp sil, 0
	je _searchEnd
_loop:
	inc rdi
	mov cl, [rdi]
	cmp cl, 0
	je  _errorExit
	cmp cl, sil
	jne _loop
	je _regularExit
_searchEnd:
	inc rdi
	mov cl, [rdi]
	cmp cl, 0
	jne _searchEnd
	je _regularExit
_errorExit:
	mov rax, 0
	pop rdi
	ret
_regularExit:
	mov rax, rdi
	pop rdi
	ret