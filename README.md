trabalho_psb
============
compilar:
nasm -f elf32 exemplo.asm <br/>
gcc -m32 -o exemplo exemplo.o driver.c asm_io.o
