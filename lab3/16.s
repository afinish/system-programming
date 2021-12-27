.global _start
.data	
	mess0: .asciz "Enter a string : "
	mess1: .asciz "A) %s\n"
	mess2: .asciz "B) %s\n"
	mess3: .asciz "C) %s\n"

.text
_start:
        movq    %rsp, %rbp
        subq    $4112, %rsp
        movl    $0, -4(%rbp)
        movq    $mess0, %rdi
        movq    $0, %rax
        call    printf
        leaq    -1040(%rbp), %rax
        movq    %rax, %rdi
        movl    $0, %eax
        call    gets
        jmp     l2
l5:
        movl    -4(%rbp), %eax
        cltq
        movzbl  -1040(%rbp,%rax), %eax
        cmpb    $64, %al
        jle     l3
        movl    -4(%rbp), %eax
        cltq
        movzbl  -1040(%rbp,%rax), %eax
        cmpb    $90, %al
        jg      l3
        movl    -4(%rbp), %eax
        cltq
        movzbl  -1040(%rbp,%rax), %eax
        addl    $32, %eax
        movl    %eax, %edx
        movl    -4(%rbp), %eax
        cltq
        movb    %dl, -2064(%rbp,%rax)
        jmp     l4
l3:
        movl    -4(%rbp), %eax
        cltq
        movzbl  -1040(%rbp,%rax), %edx
        movl    -4(%rbp), %eax
        cltq
        movb    %dl, -2064(%rbp,%rax)
l4:
        addl    $1, -4(%rbp)
l2:
        movl    -4(%rbp), %eax
        cltq
        movzbl  -1040(%rbp,%rax), %eax
        testb   %al, %al
        jne     l5
        movl    -4(%rbp), %eax
        cltq
        movb    $0, -2064(%rbp,%rax)
        movl    $0, -4(%rbp)
        jmp     l6
l9:
        movl    -4(%rbp), %eax
        cltq
        movzbl  -1040(%rbp,%rax), %eax
        cmpb    $96, %al
        jle     l7
        movl    -4(%rbp), %eax
        cltq
        movzbl  -1040(%rbp,%rax), %eax
        cmpb    $122, %al
        jg      l7
        movl    -4(%rbp), %eax
        cltq
        movzbl  -1040(%rbp,%rax), %eax
        subl    $32, %eax
        movl    %eax, %edx
        movl    -4(%rbp), %eax
        cltq
        movb    %dl, -3088(%rbp,%rax)
        jmp     l8
l7:
        movl    -4(%rbp), %eax
        cltq
        movzbl  -1040(%rbp,%rax), %edx
        movl    -4(%rbp), %eax
        cltq
        movb    %dl, -3088(%rbp,%rax)
l8:
        addl    $1, -4(%rbp)
l6:
        movl    -4(%rbp), %eax
        cltq
        movzbl  -1040(%rbp,%rax), %eax
        testb   %al, %al
        jne     l9
        movl    -4(%rbp), %eax
        cltq
        movb    $0, -3088(%rbp,%rax)
        movzbl  -1040(%rbp), %eax
        cmpb    $96, %al
        jle     l10
        movzbl  -1040(%rbp), %eax
        cmpb    $122, %al
        jg      l10
        movzbl  -1040(%rbp), %eax
        subl    $32, %eax
        movb    %al, -4112(%rbp)
        jmp     l11
l10:
        movzbl  -1040(%rbp), %eax
        movb    %al, -4112(%rbp)
l11:
        movl    $1, -4(%rbp)
        jmp     l12
l18:
        movl    -4(%rbp), %eax
        cltq
        movzbl  -1040(%rbp,%rax), %eax
        cmpb    $32, %al
        jne     l13
        movl    -4(%rbp), %eax
        cltq
        movzbl  -1040(%rbp,%rax), %edx
        movl    -4(%rbp), %eax
        cltq
        movb    %dl, -4112(%rbp,%rax)
        movl    -4(%rbp), %eax
        addl    $1, %eax
        cltq
        movzbl  -1040(%rbp,%rax), %eax
        cmpb    $96, %al
        jle     l14
        movl    -4(%rbp), %eax
        addl    $1, %eax
        cltq
        movzbl  -1040(%rbp,%rax), %eax
        cmpb    $122, %al
        jg      l14
        movl    -4(%rbp), %eax
        addl    $1, %eax
        cltq
        movzbl  -1040(%rbp,%rax), %eax
        leal    -32(%rax), %edx
        movl    -4(%rbp), %eax
        addl    $1, %eax
        cltq
        movb    %dl, -4112(%rbp,%rax)
        addl    $1, -4(%rbp)
        jmp     l16
l14:
        movl    -4(%rbp), %eax
        leal    1(%rax), %edx
        movl    -4(%rbp), %eax
        leal    1(%rax), %ecx
        movslq  %edx, %rax
        movzbl  -1040(%rbp,%rax), %edx
        movslq  %ecx, %rax
        movb    %dl, -4112(%rbp,%rax)
        addl    $1, -4(%rbp)
        jmp     l16
l13:
        movl    -4(%rbp), %eax
        cltq
        movzbl  -1040(%rbp,%rax), %eax
        cmpb    $64, %al
        jle     l17
        movl    -4(%rbp), %eax
        cltq
        movzbl  -1040(%rbp,%rax), %eax
        cmpb    $90, %al
        jg      l17
        movl    -4(%rbp), %eax
        cltq
        movzbl  -1040(%rbp,%rax), %eax
        addl    $32, %eax
        movl    %eax, %edx
        movl    -4(%rbp), %eax
        cltq
        movb    %dl, -4112(%rbp,%rax)
        jmp     l16
l17:
        movl    -4(%rbp), %eax
        cltq
        movzbl  -1040(%rbp,%rax), %edx
        movl    -4(%rbp), %eax
        cltq
        movb    %dl, -4112(%rbp,%rax)
l16:
        addl    $1, -4(%rbp)
l12:
        movl    -4(%rbp), %eax
        cltq
        movzbl  -1040(%rbp,%rax), %eax
        testb   %al, %al
        jne     l18
        movl    -4(%rbp), %eax
        cltq
        movb    $0, -4112(%rbp,%rax)
        leaq    -2064(%rbp), %rax
        movq    %rax, %rsi
        movl    $mess1, %edi
        movl    $0, %eax
        call    printf
        leaq    -3088(%rbp), %rax
        movq    %rax, %rsi
        movl    $mess2, %edi
        movl    $0, %eax
        call    printf
        leaq    -4112(%rbp), %rax
        movq    %rax, %rsi
        movl    $mess3, %edi
        movl    $0, %eax
        call    printf
        
        movq $60, %rax
        xorq %rdi, %rdi
        syscall