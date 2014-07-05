%include "asm_io.inc"

section .data
vetor dd 0,1,2,1,2,1,2,4,3,3,4,2

section .bss

section .text

global asm_main
asm_main:

mov ecx,0 ;iterador
mov edx, 20 ;ultima posicao a ser verificada
mov eax,[vetor] ;serve para buscar informacoes no vetor
percorre:
	cmp ecx,edx
	je sair
	cmp [vetor+ecx], eax
	jne sair
	add ecx, 4
	mov eax, [vetor+ecx]
	add ecx, 8
jmp percorre
sair:

leave
ret