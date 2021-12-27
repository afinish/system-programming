#Muhammadali Yusupov u1910149
.global _start
.data	
	.printmess0: .asciz "Enter the length of the data M = "
	.printmess1: .asciz "%d"
	.printmess2: .asciz "Enter %d bit data M = "
	.printmess3: .asciz "Given data bits M:\n"
	.printmess4: .asciz "%d"
	.printmess5: .asciz "\n\nCheck bits required K = "
	.printmess6: .asciz "Check bits (hamming code) K : "
	.printmess7: .asciz "\n\nData stored in the memory along with check bits(M+K): "
	.printmess8: .asciz "\n\nEnter bit number : "
	.printmess9: .asciz "Bit %d new value (0/1) : "
	.printmess10: .asciz "M+K bits with single bit error "
	.printmess11: .asciz "\n\nSyndrome word : "
	.printmess12: .asciz "Error in bit position : %d\n"
.text
_start:
        movq    %rsp, %rbp
        subq    $656, %rsp
        movl    $0, -4(%rbp)
        movl    $.printmess0, %edi
        movl    $0, %eax
        call    printf
        leaq    -60(%rbp), %rax
        movq    %rax, %rsi
        movl    $.printmess1, %edi
        movl    $0, %eax
        call    __isoc99_scanf
        movl    -60(%rbp), %eax
        movl    %eax, %esi
        movl    $.printmess2, %edi
        movl    $0, %eax
        call    printf
        movl    $0, -8(%rbp)
        jmp     .Repeat2
.Repeat3:
        leaq    -192(%rbp), %rdx
        movl    -8(%rbp), %eax
        cltq
        salq    $2, %rax
        addq    %rdx, %rax
        movq    %rax, %rsi
        movl    $.printmess1, %edi
        movl    $0, %eax
        call    __isoc99_scanf
        addl    $1, -8(%rbp)
.Repeat2:
        movl    -60(%rbp), %eax
        cmpl    %eax, -8(%rbp)
        jl      .Repeat3
        movl    $.printmess3, %edi
        movl    $0, %eax
        call    printf
        movl    $0, -8(%rbp)
        jmp     .Repeat4
.Repeat5:
        movl    -8(%rbp), %eax
        cltq
        movl    -192(%rbp,%rax,4), %eax
        movl    %eax, %esi
        movl    $.printmess4, %edi
        movl    $0, %eax
        call    printf
        addl    $1, -8(%rbp)
.Repeat4:
        movl    -60(%rbp), %eax
        cmpl    %eax, -8(%rbp)
        jl      .Repeat5
        movl    $.printmess5, %edi
        movl    $0, %eax
        call    printf
        leaq    -64(%rbp), %rax
        movq    %rax, %rsi
        movl    $.printmess1, %edi
        movl    $0, %eax
        call    __isoc99_scanf
        movl    -60(%rbp), %eax
        subl    $1, %eax
        movl    %eax, -8(%rbp)
        movl    $0, -12(%rbp)
        jmp     .Repeat6
.Repeat7:
        movl    -8(%rbp), %eax
        cltq
        movl    -192(%rbp,%rax,4), %edx
        movl    -12(%rbp), %eax
        cltq
        movl    %edx, -448(%rbp,%rax,4)
        subl    $1, -8(%rbp)
        addl    $1, -12(%rbp)
.Repeat6:
        cmpl    $0, -8(%rbp)
        jns     .Repeat7
        movl    $0, -8(%rbp)
        jmp     .Repeat8
.Repeat9:
        movl    -8(%rbp), %eax
        cltq
        movl    -448(%rbp,%rax,4), %edx
        movl    -8(%rbp), %eax
        cltq
        movl    %edx, -192(%rbp,%rax,4)
        addl    $1, -8(%rbp)
.Repeat8:
        movl    -60(%rbp), %eax
        cmpl    %eax, -8(%rbp)
        jl      .Repeat9
        movl    $0, -20(%rbp)
        movl    $0, -24(%rbp)
        movl    $1, -16(%rbp)
        movl    $1, -8(%rbp)
        movl    $0, -12(%rbp)
        jmp     .Repeat10
.Repeat13:
        movl    -8(%rbp), %eax
        cmpl    -16(%rbp), %eax
        jne     .Repeat11
        movl    -8(%rbp), %eax
        cltq
        movl    $-1, -608(%rbp,%rax,4)
        sall    -16(%rbp)
        addl    $1, -20(%rbp)
        jmp     .Repeat12
.Repeat11:
        movl    -12(%rbp), %eax
        cltq
        movl    -192(%rbp,%rax,4), %edx
        movl    -8(%rbp), %eax
        cltq
        movl    %edx, -608(%rbp,%rax,4)
        addl    $1, -12(%rbp)
.Repeat12:
        addl    $1, -24(%rbp)
        addl    $1, -8(%rbp)
.Repeat10:
        movl    -60(%rbp), %eax
        cmpl    %eax, -12(%rbp)
        jl      .Repeat13
        movl    $0, -44(%rbp)
        movl    $1, -28(%rbp)
        jmp     .Repeat14
.Repeat33:
        movl    -28(%rbp), %eax
        cltq
        movl    -608(%rbp,%rax,4), %eax
        cmpl    $-1, %eax
        jne     .Repeat15
        movl    $-1, -40(%rbp)
        movl    -28(%rbp), %eax
        movl    %eax, -52(%rbp)
        jmp     .Repeat16
.Repeat19:
        addl    $1, -40(%rbp)
        cmpl    $1, -52(%rbp)
        je      .Repeat66
        movl    -52(%rbp), %eax
        movl    %eax, %edx
        shrl    $31, %edx
        addl    %edx, %eax
        sarl    %eax
        movl    %eax, -52(%rbp)
.Repeat16:
        cmpl    $0, -52(%rbp)
        jg      .Repeat19
        jmp     .Repeat18
.Repeat66:
        nop
.Repeat18:
        movl    $0, -36(%rbp)
        movl    $1, -32(%rbp)
        jmp     .Repeat20
.Repeat30:
        movl    $0, -48(%rbp)
        jmp     .Repeat21
.Repeat22:
        movl    -48(%rbp), %eax
        cltq
        movl    $-1, -624(%rbp,%rax,4)
        addl    $1, -48(%rbp)
.Repeat21:
        cmpl    $3, -48(%rbp)
        jle     .Repeat22
        movl    -32(%rbp), %eax
        movl    %eax, -52(%rbp)
        movl    $0, -48(%rbp)
        jmp     .Repeat23
.Repeat28:
        cmpl    $1, -52(%rbp)
        jne     .Repeat24
        movl    -48(%rbp), %eax
        cltq
        movl    $1, -624(%rbp,%rax,4)
        jmp     .Repeat25
.Repeat24:
        cmpl    $0, -52(%rbp)
        jne     .Repeat26
        movl    -48(%rbp), %eax
        cltq
        movl    $0, -624(%rbp,%rax,4)
        jmp     .Repeat27
.Repeat26:
        movl    -52(%rbp), %eax
        cltd
        shrl    $31, %edx
        addl    %edx, %eax
        andl    $1, %eax
        subl    %edx, %eax
        movl    %eax, %edx
        movl    -48(%rbp), %eax
        cltq
        movl    %edx, -624(%rbp,%rax,4)
        movl    -52(%rbp), %eax
        movl    %eax, %edx
        shrl    $31, %edx
        addl    %edx, %eax
        sarl    %eax
        movl    %eax, -52(%rbp)
.Repeat27:
        addl    $1, -48(%rbp)
.Repeat23:
        cmpl    $0, -52(%rbp)
        jg      .Repeat28
.Repeat25:
        movl    -40(%rbp), %eax
        cltq
        movl    -624(%rbp,%rax,4), %eax
        cmpl    $1, %eax
        jne     .Repeat29
        movl    -32(%rbp), %eax
        cltq
        movl    -608(%rbp,%rax,4), %eax
        cmpl    $1, %eax
        jne     .Repeat29
        addl    $1, -36(%rbp)
.Repeat29:
        addl    $1, -32(%rbp)
.Repeat20:
        movl    -32(%rbp), %eax
        cmpl    -24(%rbp), %eax
        jle     .Repeat30
        movl    -36(%rbp), %eax
        andl    $1, %eax
        testl   %eax, %eax
        jne     .Repeat31
        movl    -28(%rbp), %eax
        cltq
        movl    $0, -608(%rbp,%rax,4)
        movl    -44(%rbp), %eax
        cltq
        movl    $0, -480(%rbp,%rax,4)
        jmp     .Repeat32
.Repeat31:
        movl    -28(%rbp), %eax
        cltq
        movl    $1, -608(%rbp,%rax,4)
        movl    -44(%rbp), %eax
        cltq
        movl    $1, -480(%rbp,%rax,4)
.Repeat32:
        addl    $1, -44(%rbp)
        movl    -44(%rbp), %eax
        subl    $1, %eax
        cltq
        movl    -480(%rbp,%rax,4), %edx
        movl    -4(%rbp), %eax
        cltq
        movl    %edx, -320(%rbp,%rax,4)
        addl    $1, -4(%rbp)
.Repeat15:
        addl    $1, -28(%rbp)
.Repeat14:
        movl    -28(%rbp), %eax
        cmpl    -24(%rbp), %eax
        jle     .Repeat33
        movl    $.printmess6, %edi
        call    puts
        movl    -4(%rbp), %eax
        subl    $1, %eax
        movl    %eax, -8(%rbp)
        jmp     .Repeat34
.Repeat35:
        movl    -8(%rbp), %eax
        cltq
        movl    -320(%rbp,%rax,4), %eax
        movl    %eax, %esi
        movl    $.printmess4, %edi
        movl    $0, %eax
        call    printf
        subl    $1, -8(%rbp)
.Repeat34:
        cmpl    $0, -8(%rbp)
        jns     .Repeat35
        movl    $.printmess7, %edi
        call    puts
        movl    -24(%rbp), %eax
        movl    %eax, -32(%rbp)
        jmp     .Repeat36
.Repeat37:
        movl    -32(%rbp), %eax
        cltq
        movl    -608(%rbp,%rax,4), %eax
        movl    %eax, %esi
        movl    $.printmess4, %edi
        movl    $0, %eax
        call    printf
        subl    $1, -32(%rbp)
.Repeat36:
        cmpl    $0, -32(%rbp)
        jg      .Repeat37
        movl    $.printmess8, %edi
        movl    $0, %eax
        call    printf
        leaq    -644(%rbp), %rax
        movq    %rax, %rsi
        movl    $.printmess1, %edi
        movl    $0, %eax
        call    __isoc99_scanf
        movl    -644(%rbp), %eax
        movl    %eax, %esi
        movl    $.printmess9, %edi
        movl    $0, %eax
        call    printf
        leaq    -648(%rbp), %rax
        movq    %rax, %rsi
        movl    $.printmess1, %edi
        movl    $0, %eax
        call    __isoc99_scanf
        movl    -644(%rbp), %eax
        movl    -648(%rbp), %edx
        cltq
        movl    %edx, -608(%rbp,%rax,4)
        movl    $.printmess10, %edi
        call    puts
        movl    -24(%rbp), %eax
        movl    %eax, -8(%rbp)
        jmp     .Repeat38
.Repeat39:
        movl    -8(%rbp), %eax
        cltq
        movl    -608(%rbp,%rax,4), %eax
        movl    %eax, %esi
        movl    $.printmess4, %edi
        movl    $0, %eax
        call    printf
        subl    $1, -8(%rbp)
.Repeat38:
        cmpl    $0, -8(%rbp)
        jg      .Repeat39
        movl    $0, -44(%rbp)
        movl    $1, -16(%rbp)
        movl    $1, -28(%rbp)
        jmp     .Repeat40
.Repeat59:
        movl    -28(%rbp), %eax
        cmpl    -16(%rbp), %eax
        jne     .Repeat41
        movl    $-1, -40(%rbp)
        movl    -28(%rbp), %eax
        movl    %eax, -52(%rbp)
        jmp     .Repeat42
.Repeat45:
        addl    $1, -40(%rbp)
        cmpl    $1, -52(%rbp)
        je      .Repeat67
        movl    -52(%rbp), %eax
        movl    %eax, %edx
        shrl    $31, %edx
        addl    %edx, %eax
        sarl    %eax
        movl    %eax, -52(%rbp)
.Repeat42:
        cmpl    $0, -52(%rbp)
        jg      .Repeat45
        jmp     .Repeat44
.Repeat67:
        nop
.Repeat44:
        movl    $0, -36(%rbp)
        movl    $1, -32(%rbp)
        jmp     .Repeat46
.Repeat56:
        movl    $0, -48(%rbp)
        jmp     .Repeat47
.Repeat48:
        movl    -48(%rbp), %eax
        cltq
        movl    $-1, -624(%rbp,%rax,4)
        addl    $1, -48(%rbp)
.Repeat47:
        cmpl    $3, -48(%rbp)
        jle     .Repeat48
        movl    -32(%rbp), %eax
        movl    %eax, -52(%rbp)
        movl    $0, -48(%rbp)
        jmp     .Repeat49
.Repeat54:
        cmpl    $1, -52(%rbp)
        jne     .Repeat50
        movl    -48(%rbp), %eax
        cltq
        movl    $1, -624(%rbp,%rax,4)
        jmp     .Repeat51
.Repeat50:
        cmpl    $0, -52(%rbp)
        jne     .Repeat52
        movl    -48(%rbp), %eax
        cltq
        movl    $0, -624(%rbp,%rax,4)
        jmp     .Repeat53
.Repeat52:
        movl    -52(%rbp), %eax
        cltd
        shrl    $31, %edx
        addl    %edx, %eax
        andl    $1, %eax
        subl    %edx, %eax
        movl    %eax, %edx
        movl    -48(%rbp), %eax
        cltq
        movl    %edx, -624(%rbp,%rax,4)
        movl    -52(%rbp), %eax
        movl    %eax, %edx
        shrl    $31, %edx
        addl    %edx, %eax
        sarl    %eax
        movl    %eax, -52(%rbp)
.Repeat53:
        addl    $1, -48(%rbp)
.Repeat49:
        cmpl    $0, -52(%rbp)
        jg      .Repeat54
.Repeat51:
        movl    -40(%rbp), %eax
        cltq
        movl    -624(%rbp,%rax,4), %eax
        cmpl    $1, %eax
        jne     .Repeat55
        movl    -32(%rbp), %eax
        cltq
        movl    -608(%rbp,%rax,4), %eax
        cmpl    $1, %eax
        jne     .Repeat55
        addl    $1, -36(%rbp)
.Repeat55:
        addl    $1, -32(%rbp)
.Repeat46:
        movl    -32(%rbp), %eax
        cmpl    -24(%rbp), %eax
        jle     .Repeat56
        movl    -36(%rbp), %eax
        andl    $1, %eax
        testl   %eax, %eax
        jne     .Repeat57
        movl    -28(%rbp), %eax
        cltq
        movl    $0, -608(%rbp,%rax,4)
        movl    -44(%rbp), %eax
        cltq
        movl    $0, -480(%rbp,%rax,4)
        jmp     .Repeat58
.Repeat57:
        movl    -28(%rbp), %eax
        cltq
        movl    $1, -608(%rbp,%rax,4)
        movl    -44(%rbp), %eax
        cltq
        movl    $1, -480(%rbp,%rax,4)
.Repeat58:
        addl    $1, -44(%rbp)
        sall    -16(%rbp)
.Repeat41:
        addl    $1, -28(%rbp)
.Repeat40:
        movl    -28(%rbp), %eax
        cmpl    -24(%rbp), %eax
        jle     .Repeat59
        movl    $.printmess11, %edi
        call    puts
        movl    $0, -8(%rbp)
        jmp     .Repeat60
.Repeat61:
        movl    -8(%rbp), %eax
        cltq
        movl    -480(%rbp,%rax,4), %eax
        movl    %eax, %esi
        movl    $.printmess4, %edi
        movl    $0, %eax
        call    printf
        addl    $1, -8(%rbp)
.Repeat60:
        movl    -8(%rbp), %eax
        cmpl    -20(%rbp), %eax
        jl      .Repeat61
        movl    $10, %edi
        call    putchar
        movl    $0, -56(%rbp)
        movl    $0, -8(%rbp)
        movl    $1, -12(%rbp)
        jmp     .Repeat62
.Repeat64:
        movl    -8(%rbp), %eax
        cltq
        movl    -480(%rbp,%rax,4), %eax
        cmpl    $1, %eax
        jne     .Repeat63
        movl    -12(%rbp), %eax
        addl    %eax, -56(%rbp)
.Repeat63:
        sall    -12(%rbp)
        addl    $1, -8(%rbp)
.Repeat62:
        movl    -8(%rbp), %eax
        cmpl    -20(%rbp), %eax
        jl      .Repeat64
        movl    -56(%rbp), %eax
        movl    %eax, %esi
        movl    $.printmess12, %edi
        movl    $0, %eax
        call    printf
        movl    $0, %eax
        
        movq $60, %rax
        xorq %rdi, %rdi
        syscall
