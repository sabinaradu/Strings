%include "io.mac"

section .data
    index dw 0x0
    haystack_len dw 0x0
    needle_len dw 0x0
    haystack dd 0x0
    needle dd 0x0

section .text
    global my_strstr
    extern printf

my_strstr:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edi, [ebp + 8]      ; substr_index
    mov     esi, [ebp + 12]     ; haystack
    mov     ebx, [ebp + 16]     ; needle
    mov     ecx, [ebp + 20]     ; haystack_len
    mov     edx, [ebp + 24]     ; needle_len
    ;; DO NOT MODIFY

    ;; TO DO: Implement my_strstr

    mov     [haystack_len], cx
    mov     [needle_len], dx
    mov     DWORD [haystack], esi
    mov     DWORD [needle], ebx
    xor     ecx, ecx
    xor     edx, edx
    xor     esi, esi
    xor     ebx, ebx

ana:
    mov     esi, [haystack]
    mov     al, byte[esi + edx]
    mov     esi, [needle]
    mov     bl, byte[esi + ecx]
    cmp     al, bl
    je      l1

l2:
    inc     edx
    cmp     dx, [haystack_len]
    jl      ana
    jmp     negasit

l1:
    mov     [index], dx

comp:
    inc     edx
    inc     ecx
    cmp     cx, [needle_len]
    je      gasit
    mov     esi, [haystack]
    mov     al, byte[esi + edx]
    mov     esi, [needle]
    mov     bl, byte[esi + ecx]
    cmp     al, bl
    je      comp

exit:
    mov     dx, [index]
    xor     ecx, ecx
    inc     edx
    cmp     dx, [haystack_len]
    jl      ana
    
negasit:
    inc     dx
    mov     [edi], edx
    jmp     exit_func

gasit:
    mov     dx, [index]
    mov     [edi], edx

exit_func:

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
