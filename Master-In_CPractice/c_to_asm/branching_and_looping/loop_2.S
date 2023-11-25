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
	
# i = 0; j = 1; 
	movl	$0, i 
	movl	$1, j 
	
	jmp		mn_while_cond 
mn_while_body: 
	pushl	j 
	pushl	i 
	pushl	$msg_p1 
	call	printf
	addl	$12, %esp 

	addl	$1, i 
	addl	$3, j 

mn_while_cond: 
	movl	i, %eax
	cmpl	$10, %eax
	jl		mn_while_body 

	movl	j, %eax
	cmpl	$21, %eax
	jl		mn_while_body 

mn_while_out: 
	pushl	$0 
	call	exit 
