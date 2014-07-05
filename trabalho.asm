section .data
vetor dd 0,1,2,1,2,1

section .bss

section .text

global main

main:


percorre:
	cmp [vetor+ecx], eax
	jne sair
	mov eax, [vetor+ecx]
	add ecx, 12
	call print_int
jmp percorre
sair:
