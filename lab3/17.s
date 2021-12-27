.global _start
.data
n: .space 8,0
f: .asciz "%ld"
format: .asciz "%ld\n"
message: .ascii "Enter value for n: " #19
message2: .ascii "n!= "  #4
.text
_start:
movq $1, %rax
movq $1, %rdi
movq $message, %rsi
movq $19, %rdx
syscall

#input
movq $0, %rax
movq $f, %rdi
movq $n, %rsi
call scanf
movq $1, %rax
movq $1, %rdi
movq $message2, %rsi
movq $4, %rdx
syscall

movq n, %rbx
movq %rbx, %rax
fact:
cmpq $1, %rbx
je done
decq %rbx
pushq %rbx
popq %rbx
mulq %rbx
call fact
done:
movq $format, %rdi
movq %rax, %rsi
xorq %rax, %rax
call printf
popq %rcx
popq %rax

movq $60, %rax
xorq %rdi, %rdi
syscall
