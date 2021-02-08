GLOBAL strlen

; rax -- int length of string
; rdi -- char * pointer to string

strlen:
    mov rax, 0
    dec rax
_strlenloop:
    inc rax
    cmp BYTE[rdi + rax],0
    jne _strlenloop
    ret 
