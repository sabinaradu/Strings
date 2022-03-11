%include "io.mac"

section .text
    global caesar
    extern printf

caesar:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     edi, [ebp + 16]     ; key
    mov     ecx, [ebp + 20]     ; length
    ;; DO NOT MODIFY

    ;; TODO: Implement the caesar cipher

l1:
    mov     al, byte[esi + ecx - 1]
    cmp     al, 'A'
    jl      afara_loop
    cmp     al, 'Z'
    jle     litera
    cmp     al, 'a'
    jl      afara_loop
    cmp     al, 'z'
    jle     litera
    jmp     afara_loop

litera:
    mov     ebx, edi
    cmp     ebx, 0
    je      afara_loop
    
loop:
    cmp     al, 'Z'
    je      A_litera
    cmp     al, 'z'
    je      a_litera
    inc     al
    jmp     final_loop

a_litera:
    mov     al, 'a'
    jmp     final_loop

A_litera:
    mov     al, 'A'
    jmp     final_loop

final_loop:
    dec     ebx
    cmp     ebx, 0
    jne     loop

afara_loop:
    mov     [edx + ecx -1], al
    loop    l1
    
end:

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
