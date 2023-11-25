.section .rodata
	msg_p1:
	.string	"i = %d\n" 

.section .bss
	.comm	i, 4, 4 

.section .text
.globl	main

main: 

	pushl	%ebp 
	movl	%esp, %ebp 

	movl	$0, i
	jmp		mn_cond1
mn_for: 
	pushl	i	
	pushl	$msg_p1
	call	printf
	addl	$8, %esp 

	addl	$1, i 
mn_cond1: 
	movl	i, %eax
	cmpl	$10, %eax
	jl		mn_for

	pushl	$0 
	call	exit 
