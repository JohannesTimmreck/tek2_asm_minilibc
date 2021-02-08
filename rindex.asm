GLOBAL rindex

; rax char * pointer to substr
; rdi -- char * pointer to begin of string
; rsi -- int character to be searched

rindex:
	push rdi
	dec rdi
	mov rax, 0
	cmp sil, 0
	je _searchEnd

_rindexLoop:
	inc rdi
	mov cl, [rdi]
	cmp cl, 0
	je  _regularExit
	cmp cl, sil
	jne _rindexLoop
	mov rax, rdi
	jmp _rindexLoop

_searchEnd:
	inc rdi
	mov cl, [rdi]
	cmp cl, 0
	jne _searchEnd
	mov rax, rdi

_regularExit:
	pop rdi
	ret