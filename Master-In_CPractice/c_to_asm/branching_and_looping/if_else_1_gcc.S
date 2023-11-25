	.file	"if_else_1.c"
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align 4
.LC0:
	.string	"This is a start of the program"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Enter n1:"
.LC2:
	.string	"%d"
.LC3:
	.string	"Enter n2:"
.LC4:
	.string	"sum = %d\n"
	.section	.rodata.str1.4
	.align 4
.LC5:
	.string	"This is the end of the program"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB6:
	.section	.text.startup,"ax",@progbits
.LHOTB6:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB38:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x78,0x6
	.cfi_escape 0x10,0x3,0x2,0x75,0x7c
	subl	$12, %esp
	pushl	$.LC0
	call	puts
	popl	%eax
	popl	%edx
	pushl	$.LC1
	pushl	$1
	call	__printf_chk
	popl	%ecx
	popl	%ebx
	pushl	$n1
	pushl	$.LC2
	call	__isoc99_scanf
	popl	%eax
	popl	%edx
	pushl	$.LC3
	pushl	$1
	call	__printf_chk
	popl	%ecx
	popl	%ebx
	pushl	$n2
	pushl	$.LC2
	call	__isoc99_scanf
	movl	n1, %ecx
	movl	n2, %edx
	addl	$12, %esp
	movl	%ecx, %ebx
	leal	(%ecx,%edx), %eax
	subl	%edx, %ebx
	cmpl	%edx, %ecx
	cmovg	%ebx, %eax
	pushl	%eax
	pushl	$.LC4
	pushl	$1
	movl	%eax, sum
	call	__printf_chk
	movl	$.LC5, (%esp)
	call	puts
	movl	$0, (%esp)
	call	exit
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE6:
	.section	.text.startup
.LHOTE6:
	.comm	sum,4,4
	.comm	n2,4,4
	.comm	n1,4,4
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.12) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
