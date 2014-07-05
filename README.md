trabalho_psb
============
compilar:
nasm -f elf32 exemplo.asm
gcc -m32 -o exemplo exemplo.o driver.c asm_io.o
