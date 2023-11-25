.section .rodata
	msg_p1:
	.string	"i = %d j = %d\n" 

.section .bss	
	.comm	i, 4, 4 
	.comm	j, 4, 4 

.section .text
.globl	main

main: 
	pushl	%ebp 
	movl	%esp, %ebp 

	movl	$0, i 
	jmp		mn_cond1 
mn_for1: 
	movl	$0, j 
	jmp		mn_cond2
mn_for2: 
	movl	i, %eax
	movl	j, %edx 
	addl	%edx, %eax 
	cmpl	$15, %eax
	jnl		mn_incr
	
	pushl	j 
	pushl	i 
	pushl	$msg_p1 
	call	printf
	addl	$12, %esp 

mn_incr: 
	addl	$1, j 
mn_cond2: 
	movl	j, %eax
	cmpl	$10, %eax
	jl		mn_for2 

	addl	$1, i 
mn_cond1: 
	movl	i, %eax
	cmpl	$10, %eax
	jl		mn_for1

	pushl	$0 
	call	exit 
