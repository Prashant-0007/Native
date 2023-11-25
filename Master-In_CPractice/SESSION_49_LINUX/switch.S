	.file	"switch.c"
	.comm	i,4,4
	.section	.rodata
.LC0:
	.string	"Enter i:"
.LC1:
	.string	"%d"
.LC2:
	.string	"i is 0"
.LC3:
	.string	"i is 1"
.LC4:
	.string	"i is 2"
.LC5:
	.string	"i is 3"
.LC6:
	.string	"i is 4"
.LC7:
	.string	"i is 5"
.LC8:
	.string	"i is 6"
.LC9:
	.string	"Invalid input"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	subl	$4, %esp
	subl	$12, %esp
	pushl	$.LC0
	call	printf
	addl	$16, %esp
	subl	$8, %esp
	pushl	$i
	pushl	$.LC1
	call	__isoc99_scanf
	addl	$16, %esp
	movl	i, %eax
	cmpl	$56, %eax
	je	.L3
	cmpl	$56, %eax
	jg	.L4
	cmpl	$-3, %eax
	je	.L5
	cmpl	$2, %eax
	je	.L6
	cmpl	$-30, %eax
	je	.L7
	jmp	.L2
.L4:
	cmpl	$127, %eax
	je	.L8
	cmpl	$2004, %eax
	je	.L9
	cmpl	$100, %eax
	jne	.L2
	subl	$12, %esp
	pushl	$.LC2
	call	puts
	addl	$16, %esp
	jmp	.L11
.L6:
	subl	$12, %esp
	pushl	$.LC3
	call	puts
	addl	$16, %esp
	jmp	.L11
.L5:
	subl	$12, %esp
	pushl	$.LC4
	call	puts
	addl	$16, %esp
	jmp	.L11
.L3:
	subl	$12, %esp
	pushl	$.LC5
	call	puts
	addl	$16, %esp
	jmp	.L11
.L8:
	subl	$12, %esp
	pushl	$.LC6
	call	puts
	addl	$16, %esp
	jmp	.L11
.L9:
	subl	$12, %esp
	pushl	$.LC7
	call	puts
	addl	$16, %esp
	jmp	.L11
.L7:
	subl	$12, %esp
	pushl	$.LC8
	call	puts
	addl	$16, %esp
	jmp	.L11
.L2:
	subl	$12, %esp
	pushl	$.LC9
	call	puts
	addl	$16, %esp
.L11:
	subl	$12, %esp
	pushl	$0
	call	exit
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.12) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
