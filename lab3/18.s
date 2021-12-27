.global _start
.data
.m0:	.string "Enter n: "
.m1:	.string "%d"
.m2:	.string "Prime numbers till %d:\n"
.m3:	.string "%d\n "
_start:
        pushq    %rbp
        movq     %rsp, %rbp
        subq     $16, %rsp
        movl     $.m0, %edi
        movl     $0, %eax
        call     printf
        leaq     -16(%rbp), %rax
        movq     %rax, %rsi
        movl	$.m1, %edi
        movl     $0, %eax
        call    __isoc99_scanf
        movl	-16(%rbp), %eax
        movl     %eax, %esi
        movl     $.m2, %edi
        movl     $0, %eax
        call     printf
        movl	$2, -4(%rbp)
        #mov     DWORD PTR [rbp-4], 2
        jmp     .L2
.L8:
	movl	$1, -12(%rbp)
        #mov     DWORD PTR [rbp-12], 1
        movl	$2, -8(%rbp)
        #mov     DWORD PTR [rbp-8], 2
        jmp     .L3
.L6:
	movl	-4(%rbp), %eax
        #mov     eax, DWORD PTR [rbp-4]
        cdq
        idivq	-8(%rbp)
        #idivl    DWORD PTR [rbp-8]
        mov     %edx, %eax
        test    %eax, %eax
        jne     .L4
        movl     $0, -12(%rbp)
        jmp     .L5
.L4:
	addl	$1, -8(%rbp)
        #add     DWORD PTR [rbp-8], 1
.L3:
        movl     -4(%rbp), %eax
        movl     %eax, %edx
        shrl     $31, %edx
        addl     %edx, %eax
        sar     %eax
        cmpl	%eax, -8(%rbp)
        #cmp     DWORD PTR [rbp-8], eax
        jle     .L6
.L5:
        cmpl	$1, -12(%rbp)	
        #cmp     DWORD PTR [rbp-12], 1
        jne     .L7
        movl	-4(%rbp), %eax
        movl    %eax, %esi
        movl    $.m3, %edi
        mov     $0, %eax
        call    printf
.L7:
        addl    $1, -4(%rbp)
.L2:
        movl    -16(%rbp), %eax
        cmpl	%eax, -4(%rbp)
        #cmp     DWORD PTR [rbp-4], eax
        jle     .L8
        movl    $0, %eax
        leave
        ret
