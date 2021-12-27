#Muhammadali Yusupov u1910149
.global _start
.data
	printmess0: .asciz "Enter the size of the list\n"
	printmess1: .asciz "%d"
	printmess2: .asciz "Elements of the list\n"
	printmess3: .asciz "%d\n"
	printmess4: .asciz "Sum of the elements in the list is %d \n"
	printmess5: .asciz "Average of elements in the list is %f \n"
	printmess6: .asciz "Enter the key which to be found in the list\n"
	printmess7: .asciz "Key %d is found at location %d in the list\n"
	printmess8: .asciz "Key %d is not found in the list\n"
	printmess9: .asciz "Key occurs %d times in the list\n"
.text
_start:
        movq    %rsp, %rbp
        subq    $112, %rsp
        movl    $12, -112(%rbp)
        movl    $23, -108(%rbp)
        movl    $32, -104(%rbp)
        movl    $84, -100(%rbp)
        movl    $121, -96(%rbp)
        movl    $34, -92(%rbp)
        movl    $23, -88(%rbp)
        movl    $32, -84(%rbp)
        movl    $93, -80(%rbp)
        movl    $22, -76(%rbp)
        movl    $56, -72(%rbp)
        movl    $32, -68(%rbp)
        movl    $948, -64(%rbp)
        movl    $123, -60(%rbp)
        movl    $99, -56(%rbp)
        movl    $23, -52(%rbp)
        movl    $32, -48(%rbp)
        movl    $289, -44(%rbp)
        movl    $99, -40(%rbp)
        movl    $34, -36(%rbp)
        movl    $printmess0, %edi
        movl    $0, %eax
        call    printf
        leaq    -20(%rbp), %rax
        movq    %rax, %rsi
        movl    $printmess1, %edi
        movl    $0, %eax
        call    scanf
        movl    $printmess2, %edi
        call    puts
        movl    $0, -4(%rbp)
        jmp     Repeat2
Repeat3:
        movl    -4(%rbp), %eax
        cltq
        movl    -112(%rbp,%rax,4), %eax
        movl    %eax, %esi
        movl    $printmess3, %edi
        movl    $0, %eax
        call    printf
        addl    $1, -4(%rbp)
Repeat2:
        movl    -20(%rbp), %eax
        cmpl    %eax, -4(%rbp)
        jl      Repeat3
        movl    $0, -8(%rbp)
        movl    $0, -4(%rbp)
        jmp     Repeat4
Repeat5:
        movl    -4(%rbp), %eax
        cltq
        movl    -112(%rbp,%rax,4), %eax
        addl    %eax, -8(%rbp)
        addl    $1, -4(%rbp)
Repeat4:
        movl    -20(%rbp), %eax
        cmpl    %eax, -4(%rbp)
        jl      Repeat5
        movl    -8(%rbp), %eax
        movl    %eax, %esi
        movl    $printmess4, %edi
        movl    $0, %eax
        call    printf
        cvtsi2ssl       -8(%rbp), %xmm0
        movl    -20(%rbp), %eax
        cvtsi2ssl       %eax, %xmm1
        divss   %xmm1, %xmm0
        movss   %xmm0, -16(%rbp)
        cvtss2sd        -16(%rbp), %xmm2
        movq    %xmm2, %rax
        movq    %rax, %xmm0
        movl    $printmess5, %edi
        movl    $1, %eax
        call    printf
        movl    $0, -12(%rbp)
        movl    $printmess6, %edi
        movl    $0, %eax
        call    printf
        leaq    -24(%rbp), %rax
        movq    %rax, %rsi
        movl    $printmess1, %edi
        movl    $0, %eax
        call    scanf
        movl    $0, -4(%rbp)
        jmp     Repeat6
Repeat8:
        movl    -4(%rbp), %eax
        cltq
        movl    -112(%rbp,%rax,4), %edx
        movl    -24(%rbp), %eax
        cmpl    %eax, %edx
        jne     Repeat7
        movl    -24(%rbp), %eax
        movl    -4(%rbp), %edx
        movl    %eax, %esi
        movl    $printmess7, %edi
        movl    $0, %eax
        call    printf
        addl    $1, -12(%rbp)
Repeat7:
        addl    $1, -4(%rbp)
Repeat6:
        movl    -20(%rbp), %eax
        cmpl    %eax, -4(%rbp)
        jl      Repeat8
        cmpl    $0, -12(%rbp)
        jne     Repeat9
        movl    -24(%rbp), %eax
        movl    %eax, %esi
        movl    $printmess8, %edi
        movl    $0, %eax
        call    printf
        jmp     Repeat10
Repeat9:
        movl    -12(%rbp), %eax
        movl    %eax, %esi
        movl    $printmess9, %edi
        movl    $0, %eax
        call    printf
Repeat10:
        movl $60, %eax
        xorq %rdi, %rdi
        syscall
