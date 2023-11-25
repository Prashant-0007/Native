	.file	"nested_loops.c"
	.comm	i,4,4
	.comm	j,4,4
	.section	.rodata
.LC0:
	.string	"i = %d j = %d\n"
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

	movl	$0, i
	jmp	.L2
.L5:
	movl	$0, j
	jmp	.L3
.L4:
	movl	j, %edx
	movl	i, %eax
	subl	$4, %esp
	pushl	%edx
	pushl	%eax
	pushl	$.LC0
	call	printf
	addl	$16, %esp
	movl	j, %eax
	addl	$1, %eax
	movl	%eax, j
.L3:
	movl	j, %eax
	cmpl	$5, %eax
	jle	.L4
	movl	i, %eax
	addl	$1, %eax
	movl	%eax, i
.L2:
	movl	i, %eax
	cmpl	$4, %eax
	jle	.L5
	subl	$12, %esp
	pushl	$0
	call	exit
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.12) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
