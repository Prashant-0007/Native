.section .rodata
	msg_p1:
	.string	"i=%d j=%d k=%d\n" 

	msg_p2:
	.string	"End of assembly program" 
.section .bss
	.comm	i, 4, 4 
	.comm	j, 4, 4
  	.comm	k, 4, 4 	

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
	movl	$0, k 
	jmp		mn_cond3 
mn_for3: 
	
	movl	i, %eax
	addl	j, %eax
	addl	k, %eax
	cmpl	$20, %eax
	jg		mn_out 
	
	pushl	k
	pushl	j
	pushl	i 
	pushl	$msg_p1
	call	printf
	addl	$16, %esp

	addl	$1, k 
mn_cond3: 
	movl	k, %eax
	cmpl	$10, %eax
	jl		mn_for3

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

mn_out: 
	pushl	$msg_p2
	call	puts
	addl	$4, %esp 


	pushl	$0 
	call	exit 
