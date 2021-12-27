#Muhammadali Yusupov u1910149
.global _start
.data
        printmess1: .asciz "%ld"
        printmess2: .asciz "Number of 1's in the number %ld is %ld\n"
.text
_start:
        movq    %rsp, %rbp
        subq    $16, %rsp
        leaq    -16(%rbp), %rax
        movq    %rax, %rsi
        movl    $printmess1, %edi
        movl    $0, %eax
        call    scanf
        movq    -16(%rbp), %rax
        movq    %rax, %rdi
        call    rcount1s
        movq    %rax, -8(%rbp)
        movq    -16(%rbp), %rax
        movq    -8(%rbp), %rdx
        movq    %rax, %rsi
        movl    $printmess2, %edi
        movl    $0, %eax
        call    printf
        movl    $0, %eax
        
        movl    $60, %eax
        xorq    %rdi, %rdi
        syscall
        
        
rcount1s:
        pushq   %rbp
        movq    %rsp, %rbp
        pushq   %rbx
        subq    $24, %rsp
        movq    %rdi, -24(%rbp)
        cmpq    $0, -24(%rbp)
        jne     .Repeat2
        movl    $0, %eax
        jmp     .Repeat3
        ret
.Repeat2:
        movq    -24(%rbp), %rax
        andl    $1, %eax
        movq    %rax, %rbx
        sarq    -24(%rbp)
        movq    -24(%rbp), %rax
        movq    %rax, %rdi
        call    rcount1s
        addq    %rbx, %rax
.Repeat3:
        movq    -8(%rbp), %rbx
        leave
        ret

