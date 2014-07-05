%include "asm_io.inc"

section .data
matrix dd 0,1,1,0,2,2,1,3,1,2,4,5,3,4,3

section .bss
MAX_TAM resd 1
increment resd 1

section .text

global asm_main
asm_main:

; Deve ser removido no futuro para dar espaço a pegar informações do teclado para preencher a matriz
mov edx, 56 ;ultima posicao a ser verificada (dado por tamanho total do vetor - 4)
mov [MAX_TAM], edx
mov ebx,[matrix] ;valor da posição da matriz
mov ecx,0 ;valor do indice da matriz
mov eax, 0

; A lógica a partir daqui permanece
push ecx
call search
pop ecx
leave
ret

;Transformar isso em função recursiva:
search:
	push ebp
	mov ebp, esp
	mov ecx, [ebp+8]
	mov ebx, [matrix+ecx+4]
	push ecx

	look_for:

		add ecx, 12
		cmp ecx, [MAX_TAM]
		jg exit
		cmp [matrix+ecx], ebx
		jne dont_change
		mov ebx, [matrix+ecx+4]
		add eax, [matrix+ecx+8]
		mov edx, 4
		cmp [matrix+ecx+4], edx ;alterar para o valor da leitura do usuario
		jne dont_change
		cmp eax, [increment]
		jl dont_change
		mov [increment], eax
		dont_change:
	jmp look_for
	
	exit:
	pop ecx	
	mov ebx, [matrix+ecx]
	have_more:
		add ecx, 12	
		cmp ecx, [MAX_TAM]
		jg dont_have
		cmp ebx, [matrix+ecx]
		jne dont_have
		push ecx
		call search
		pop ecx
	jmp have_more
	dont_have:
	
		mov eax,[increment]
pop ebp
ret
;======================================
