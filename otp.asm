%include "io.mac"

section .text
    global otp
    extern printf

otp:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     edi, [ebp + 16]     ; key
    mov     ecx, [ebp + 20]     ; length
    ;; DO NOT MODIFY

    ;; TODO: Implement the One Time Pad cipher

l1:
	mov 	al,[esi]
	mov 	bl,[edi]
	xor 	al,bl
	mov 	[edx],al
	inc 	esi
	inc 	edi
	inc 	edx
	loop 	l1

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
