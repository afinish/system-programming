.global _start
.data
printmess1:	.string "Enter your sentence :"
printmess2:	.string "Length of your sentence :%d"
printmess3:	.string "\nREVERSED SENTENCE :%s"
printmess4:	.string "\nThe given sentence is a PALINDROME "
printmess5:	.string "\nThe given sentence is not a PALINDROME "
.text
_start:
        pushq   %rbp
        movq    %rsp, %rbp
        subq    $2080, %rsp
        movl    $printmess1, %edi
        movl    $0, %eax
        call    printf
        movq    stdin(%rip), %rdx
        leaq    -1056(%rbp), %rax
        movl    $1024, %esi
        movq    %rax, %rdi
        call    fgets
        leaq    -1056(%rbp), %rax
        movq    %rax, %rdi
        call    strlen
        movl    %eax, -12(%rbp)
        subl    $1, -12(%rbp)
        movl    -12(%rbp), %eax
        movl    %eax, %esi
        movl    $printmess2, %edi
        movl    $0, %eax
        call    printf
        movl    -12(%rbp), %eax
        cltq
        movb    $0, -1056(%rbp,%rax)
        leaq    -1056(%rbp), %rdx
        leaq    -2080(%rbp), %rax
        movq    %rdx, %rsi
        movq    %rax, %rdi
        call    strcpy
        movl    -12(%rbp), %eax
        subl    $1, %eax
        movl    %eax, -8(%rbp)
        movl    -12(%rbp), %eax
        movl    %eax, %edx
        shrl    $31, %edx
        addl    %edx, %eax
        sarl    %eax
        movl    %eax, -16(%rbp)
        movl    $0, -4(%rbp)
        jmp     rep2
rep3:
        movl    -8(%rbp), %eax
        cltq
        movzbl  -2080(%rbp,%rax), %eax
        movb    %al, -17(%rbp)
        movl    -4(%rbp), %eax
        cltq
        movzbl  -2080(%rbp,%rax), %edx
        movl    -8(%rbp), %eax
        cltq
        movb    %dl, -2080(%rbp,%rax)
        movl    -4(%rbp), %eax
        cltq
        movzbl  -17(%rbp), %edx
        movb    %dl, -2080(%rbp,%rax)
        subl    $1, -8(%rbp)
        addl    $1, -4(%rbp)
rep2:
        movl    -4(%rbp), %eax
        cmpl    -16(%rbp), %eax
        jl      rep3
        movl    -12(%rbp), %eax
        cltq
        movb    $0, -2080(%rbp,%rax)
        leaq    -2080(%rbp), %rax
        movq    %rax, %rsi
        movl    $printmess3, %edi
        movl    $0, %eax
        call    printf
        movl    -12(%rbp), %eax
        movslq  %eax, %rdx
        leaq    -1056(%rbp), %rcx
        leaq    -2080(%rbp), %rax
        movq    %rcx, %rsi
        movq    %rax, %rdi
        call    strncmp
        testl   %eax, %eax
        jne     rep4
        movl    $printmess4, %edi
        call    puts
        jmp     rep5
rep4:
        movl    $printmess5, %edi
        call    puts
rep5:
        movl $60, %eax
        xorq %rdi, %rdi
        syscall
