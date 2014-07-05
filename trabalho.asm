%include "asm_io.inc"

section .data
matrix dd 0,1,2,1,2,1,2,4,3,3,4,2

section .bss
MAX_TAM resd 1

section .text

global asm_main
asm_main:

; Deve ser removido no futuro para dar espaço a pegar informações do teclado para preencher a matriz
mov edx, 36 ;ultima posicao a ser verificada (dado por tamanho total do vetor - 4)
mov MAX_TAM, [edx]

mov ebx,[matrix] ;valor da posição da matriz
mov ecx,0 ;valor do indice da matriz


; A lógica a partir daqui permanece
push ebx
push ecx
call search
leave
ret

;Transformar isso em função recursiva:
search:
	push ebp
	mov ebp, esp
	mov ebx, [ebp+4]
	mov ecx, [ebp+8]
	
	cmp [ecx],MAX_TAM
	je exit
	cmp [matrix+ecx], eax
	jne exit
	add ecx, 4
	mov eax, [matrix+ecx]
	add ecx, 8
	jmp search
exit:

pop ebp
ret
;======================================
