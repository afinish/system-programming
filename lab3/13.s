.global _start
.data
printmess1:
        .asciz "Encrypted message :"
printmess2:
        .asciz "\nDecrypted message :%s\n"
.text
_start:
        pushq   %rbp
        movq    %rsp, %rbp
        subq    $112, %rsp
        movl    $printmess1, %edi
        movl    $0, %eax
        call    printf
        leaq    -112(%rbp), %rax
        movq    %rax, %rdi
        movl    $0, %eax
        call    gets
        movl    $0, -4(%rbp)
        jmp     repeat2
repeat4:
        movl    -4(%rbp), %eax
        cltq
        movzbl  -112(%rbp,%rax), %eax
        subl    $9, %eax
        movl    %eax, %edx
        movl    -4(%rbp), %eax
        cltq
        movb    %dl, -112(%rbp,%rax)
        addl    $1, -4(%rbp)
repeat2:
        cmpl    $99, -4(%rbp)
        jg      repeat3
        movl    -4(%rbp), %eax
        cltq
        movzbl  -112(%rbp,%rax), %eax
        testb   %al, %al
        jne     repeat4
repeat3:
        leaq    -112(%rbp), %rax
        movq    %rax, %rsi
        movl    $printmess2, %edi
        movl    $0, %eax
        call    printf
        movl	$60, %eax
        xorq	%rdi, %rdi
        syscall
