section .text
global _main
extern _dprintf
extern _sprintf
extern _system

_main:
push rbp
mov rbp, rsp
sub rsp, 128

mov dword [rbp - 4], 5
cmp dword [rbp - 4], 0
jl exit

%ifdef REPLICATE
dec dword [rbp - 4]
%endif

mov rdi, rbp
sub rdi, 18
mov rsi, source_name
mov rdx, [rbp - 4]
call _sprintf

mov rax, 0x2000005
mov rdi, rbp
sub rdi, 18
mov rsi, 0x201
mov rdx, 0x180
syscall
jc error
mov [rbp - 8], eax

mov rdi, [rbp - 8]
mov rsi, code
mov rdx, 0xA
mov rcx, 0x22
mov r8, code
mov r9, [rbp - 4]
call _dprintf

mov rax, 0x2000006
mov rdi, [rbp - 8]
syscall

mov rdi, rbp
sub rdi, 118
mov rsi, compilation
mov rdx, rbp
sub rdx, 18
mov rcx, [rbp - 4]
call _sprintf

mov rdi, rbp
sub rdi, 118
call _system

cmp dword [rbp - 4], 0
jng exit

mov rdi, rbp
sub rdi, 60
call _system

exit:
xor rax, rax
mov rsp, rbp
pop rbp
ret

error:
mov rax, 1
mov rsp, rbp
pop rbp
ret

section .data
source_name: db "Sully_%d.s",0x0
compilation: db "nasm -DREPLICATE -f macho64 %1$s && gcc Sully_%2$d.o -o ./Sully_%2$d -Wl,-no_pie && rm -rf Sully_%2$d.o",0x0
execution: db "./Sully_%d",0x0
code: db "section .text%1$cglobal _main%1$cextern _dprintf%1$cextern _sprintf%1$cextern _system%1$c%1$c_main:%1$cpush rbp%1$cmov rbp, rsp%1$csub rsp, 128%1$c%1$cmov dword [rbp - 4], %4$d%1$ccmp dword [rbp - 4], 0%1$cjl exit%1$c%1$c%%ifdef REPLICATE%1$cdec dword [rbp - 4]%1$c%%endif%1$c%1$cmov rdi, rbp%1$csub rdi, 18%1$cmov rsi, source_name%1$cmov rdx, [rbp - 4]%1$ccall _sprintf%1$c%1$cmov rax, 0x2000005%1$cmov rdi, rbp%1$csub rdi, 18%1$cmov rsi, 0x201%1$cmov rdx, 0x180%1$csyscall%1$cjc error%1$cmov [rbp - 8], eax%1$c%1$cmov rdi, [rbp - 8]%1$cmov rsi, code%1$cmov rdx, 0xA%1$cmov rcx, 0x22%1$cmov r8, code%1$cmov r9, [rbp - 4]%1$ccall _dprintf%1$c%1$cmov rax, 0x2000006%1$cmov rdi, [rbp - 8]%1$csyscall%1$c%1$cmov rdi, rbp%1$csub rdi, 118%1$cmov rsi, compilation%1$cmov rdx, rbp%1$csub rdx, 18%1$cmov rcx, [rbp - 4]%1$ccall _sprintf%1$c%1$cmov rdi, rbp%1$csub rdi, 118%1$ccall _system%1$c%1$ccmp dword [rbp - 4], 0%1$cjng exit%1$c%1$cmov rdi, rbp%1$csub rdi, 60%1$ccall _system%1$c%1$cexit:%1$cxor rax, rax%1$cmov rsp, rbp%1$cpop rbp%1$cret%1$c%1$cerror:%1$cmov rax, 1%1$cmov rsp, rbp%1$cpop rbp%1$cret%1$c%1$csection .data%1$csource_name: db %2$cSully_%%d.s%2$c,0x0%1$ccompilation: db %2$cnasm -DREPLICATE -f macho64 %%1$s && gcc Sully_%%2$d.o -o ./Sully_%%2$d -Wl,-no_pie && rm -rf Sully_%%2$d.o%2$c,0x0%1$cexecution: db %2$c./Sully_%%d%2$c,0x0%1$ccode: db %2$c%3$s%2$c,0x0%1$c",0x0
