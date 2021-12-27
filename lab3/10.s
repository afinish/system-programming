.global _start
.data
        printmess1: .asciz "Enter binary number :"
        printmess2: .asciz "Integer :%ld \n"
.text
_start:
        pushq   %rbp
        movq    %rsp, %rbp
        subq    $32, %rsp
        movq    $printmess1, %rdi
        call    puts
        movq    stdin(%rip), %rdx
        leaq    -32(%rbp), %rax
        movq    $20, %rsi
        movq    %rax, %rdi
        call    fgets
        leaq    -32(%rbp), %rax
        movq    %rax, %rdi
        call    atoi
        movq    %rax, %rsi
        movq    $printmess2, %rdi
        movq    $0, %rax
        call    printf
        movq    $0, %rax
        
        movq $60, %rax
        xorq %rdi, %rdi
        syscall
