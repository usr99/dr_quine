section .text
global _main
extern _printf

_main:
push rbp
call print ; print source code of the program
pop rbp
mov rax, 0
ret

print:
push rbp
mov rdi, code
mov rsi, 0xa
mov rdx, 0x22
mov rcx, code
call _printf
pop rbp
ret

; textual representation of the program
section .data
code: db "section .text%1$cglobal _main%1$cextern _printf%1$c%1$c_main:%1$cpush rbp%1$ccall print ; print source code of the program%1$cpop rbp%1$cmov rax, 0%1$cret%1$c%1$cprint:%1$cpush rbp%1$cmov rdi, code%1$cmov rsi, 0xa%1$cmov rdx, 0x22%1$cmov rcx, code%1$ccall _printf%1$cpop rbp%1$cret%1$c%1$c; textual representation of the program%1$csection .data%1$ccode: db %2$c%3$s%2$c,0x0%1$c",0x0
