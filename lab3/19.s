.global _start
.m0:	.string "Enter n:"
.m1:	.string "%d"
.m2:	.string "Enter elements:"
.m3:	.string "You entered:"
.m4:	.string "%d, "
_start:
        pushq    %rbp
        movq     %rsp, %rbp 
        subq     $96, %rsp
        movl     $.m0, %edi
        movl     $0, %eax
        call     printf
        leaq	-8(%rbp), %rax
        movq	%rax, %rsi
        movl	$.m1, %edi
        mov     $0, %eax
        call    scanf
        movl    $.m2, %edi
        call    puts
        movl	$0, -4(%rbp)
        jmp     .L2
.L3:
	leaq	-96(%rbp), %rdx
        movl	-4(%rbp), %eax
        cdqe
        salq    $2, %rax
        addq    %rdx, %rax
        movq    %rax, %rsi
        movl    $.m1, %edi
        mov     $0, %eax
        call    scanf
        addl    $1, -4(%rbp)
.L2:
        movl	-8(%rbp), %eax
        cmpl    %eax, -4(%rbp)
        jl      .L3
        movl	$.m3, %edi
        call    puts
        movl	$0, -4(%rbp)
        jmp     .L4
.L5:
        movl	-4(%rbp), %eax
        movl	-4(%rbp), %eax
        cdqe
        movl	-96(%rbp, %rax, 4), %eax
        #mov     eax, DWORD PTR [rbp-96+rax*4]
        movl    %eax, %esi
        movl    $.m4, %edi
        movl    $0, %eax
        call    printf
        addl    $1, -4(%rbp)
.L4:
        movl    -8(%rbp), %eax
        cmpl    %eax, -4(%rbp)
        jl      .L5
        movl    $0, %eax
        #leave
        ret
