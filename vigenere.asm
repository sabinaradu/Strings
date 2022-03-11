%include "io.mac"


section .data
    plaintext dd 0x0
    plaintext_len dw 0x0
    key dd 0x0
    key_len dw 0x0

section .text
    global vigenere
    extern printf

vigenere:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     ecx, [ebp + 16]     ; plaintext_len
    mov     edi, [ebp + 20]     ; key
    mov     ebx, [ebp + 24]     ; key_len

    ;; DO NOT MODIFY

    ;; TODO: Implement the Vigenere cipher
    mov     [plaintext_len], cx
    mov     [key_len], bx
    mov     DWORD [plaintext], esi
    mov     DWORD [key], edi
  
    xor     esi, esi
    xor     ecx, ecx
    xor     edi, edi
    xor     ebx, ebx

l2:
    mov     esi, [plaintext]
    mov     al, byte[esi+ecx]
    mov     esi, [key]
    mov     bl, byte[esi + edi]
    sub     bl, 'A'

l1:
   
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
    cmp     ebx, 0
    je      folosit_cheie
    
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

folosit_cheie:
    inc     edi

afara_loop:
    mov     [edx + ecx], al
    inc     ecx
    cmp     edi, [key_len]
    jne     peste
    xor     edi, edi

peste:
    cmp     cx, [plaintext_len]
    jl      l2

end:
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY