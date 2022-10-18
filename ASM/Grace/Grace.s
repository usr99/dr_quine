section .text
extern _dprintf

%define FILENAME filename: db "Grace_kid.s",0x0
%define ERRMSG errmsg: db "Failed to open %s",0xa,0x0

%macro START 0
global _main
_main:
push rbp
mov rbp, rsp
sub rsp, 16

mov rax, 0x2000005
mov rdi, filename
mov rsi, 0x201
syscall
jc syscall_error
mov [rbp - 4], rax

mov rdi, [rbp - 4]
mov rsi, code
mov rdx, 0xa
mov rcx, 0x22
mov r8, code
call _dprintf

mov rax, 0x2000006
mov rdi, [rbp - 4]
syscall

xor rax, rax
exit:
mov rsp, rbp
pop rbp
ret

syscall_error:
mov rdi, 0x2
mov rsi, errmsg
mov rdx, filename
mov rax, 0
call _dprintf
mov rax, 1
jmp exit
%endmacro

START

section .data
FILENAME
ERRMSG
code: db "section .text%1$cextern _dprintf%1$c%1$c%%define FILENAME filename: db %2$cGrace_kid.s%2$c,0x0%1$c%%define ERRMSG errmsg: db %2$cFailed to open %%s%2$c,0xa,0x0%1$c%1$c%%macro START 0%1$cglobal _main%1$c_main:%1$cpush rbp%1$cmov rbp, rsp%1$csub rsp, 16%1$c%1$cmov rax, 0x2000005%1$cmov rdi, filename%1$cmov rsi, 0x201%1$csyscall%1$cjc syscall_error%1$cmov [rbp - 4], rax%1$c%1$cmov rdi, [rbp - 4]%1$cmov rsi, code%1$cmov rdx, 0xa%1$cmov rcx, 0x22%1$cmov r8, code%1$ccall _dprintf%1$c%1$cmov rax, 0x2000006%1$cmov rdi, [rbp - 4]%1$csyscall%1$c%1$cxor rax, rax%1$cexit:%1$cmov rsp, rbp%1$cpop rbp%1$cret%1$c%1$csyscall_error:%1$cmov rdi, 0x2%1$cmov rsi, errmsg%1$cmov rdx, filename%1$cmov rax, 0%1$ccall _dprintf%1$cmov rax, 1%1$cjmp exit%1$c%%endmacro%1$c%1$cSTART%1$c%1$csection .data%1$cFILENAME%1$cERRMSG%1$ccode: db %2$c%3$s%2$c,0x0%1$c",0x0
