.global _start
.data	
	mess0: .asciz "Enter a string : "
	mess1: .asciz "Number of alphabets : %d\n"
	mess2: .asciz "Number of numerals : %d\n"
	mess3: .asciz "Number of special characters : %d\n"
	mess4: .asciz "Total number of characters in the string : %d\n"
	mess5: .asciz "Total number of words in the string : %d\n"
.text
_start:
        pushq   %rbp
        movq    %rsp, %rbp
        subq    $1056, %rsp
        movl    $0, -4(%rbp)
        movl    $0, -8(%rbp)
        movl    $0, -12(%rbp)
        movl    $0, -16(%rbp)
        movl    $0, -20(%rbp)
        movl    $mess0, %edi
        movl    $0, %eax
        call    printf
        leaq    -1056(%rbp), %rax
        movq    %rax, %rdi
        movl    $0, %eax
        call    gets
        jmp     l2
l9:
        movl    -16(%rbp), %eax
        cltq
        movzbl  -1056(%rbp,%rax), %eax
        cmpb    $96, %al
        jle     l3
        movl    -16(%rbp), %eax
        cltq
        movzbl  -1056(%rbp,%rax), %eax
        cmpb    $122, %al
        jle     l4
l3:
        movl    -16(%rbp), %eax
        cltq
        movzbl  -1056(%rbp,%rax), %eax
        cmpb    $64, %al
        jle     l5
        movl    -16(%rbp), %eax
        cltq
        movzbl  -1056(%rbp,%rax), %eax
        cmpb    $90, %al
        jg      l5
l4:
        addl    $1, -4(%rbp)
        jmp     l6
l5:
        movl    -16(%rbp), %eax
        cltq
        movzbl  -1056(%rbp,%rax), %eax
        cmpb    $47, %al
        jle     l7
        movl    -16(%rbp), %eax
        cltq
        movzbl  -1056(%rbp,%rax), %eax
        cmpb    $57, %al
        jg      l7
        addl    $1, -8(%rbp)
        jmp     l6
l7:
        movl    -16(%rbp), %eax
        cltq
        movzbl  -1056(%rbp,%rax), %eax
        cmpb    $32, %al
        jne     l8
        addl    $1, -20(%rbp)
        jmp     l6
l8:
        addl    $1, -12(%rbp)
l6:
        addl    $1, -16(%rbp)
l2:
        movl    -16(%rbp), %eax
        cltq
        movzbl  -1056(%rbp,%rax), %eax
        testb   %al, %al
        jne     l9
        addl    $1, -20(%rbp)
        movl    -4(%rbp), %eax
        movl    %eax, %esi
        movl    $mess1, %edi
        movl    $0, %eax
        call    printf
        movl    -8(%rbp), %eax
        movl    %eax, %esi
        movl    $mess2, %edi
        movl    $0, %eax
        call    printf
        movl    -12(%rbp), %eax
        movl    %eax, %esi
        movl    $mess3, %edi
        movl    $0, %eax
        call    printf
        movl    -16(%rbp), %eax
        movl    %eax, %esi
        movl    $mess4, %edi
        movl    $0, %eax
        call    printf
        movl    -20(%rbp), %eax
        movl    %eax, %esi
        movl    $mess5, %edi
        movl    $0, %eax
        call    printf
        
        movq $60, %rax
        xorq %rdi, %rdi
        syscall
