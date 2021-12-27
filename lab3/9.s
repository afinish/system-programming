.global _start
.data
.m1:	.asciz "Enter number:"
.m2:	.asciz "You entered:%ld \n"
.text
_start:
        pushq    %rbp
        movq     %rsp, %rbp 
        subq     $16, %rsp
        movq     $.m1, %rdi
        call puts
        movq	stdin(%rip), %rdx
        leaq     -16(%rbp), %rax
        movq     $10, %rsi
        movq     %rax, %rdi
        call    fgets
        leaq	-16(%rbp), %rax
        movq     %rax, %rdi
        call    atoi
        movq     %rax, %rsi
        movq     $.m2, %rdi
        movq     $0, %rax
        call     printf
        movl     $0, %eax
        
        movq $60, %rax
        xorq %rdi, %rdi
        syscall