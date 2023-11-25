.section .rodata
	msgP1:
	.string	"Hello" 

	msgP2:
	.string	"i = %d\n" 

.section .bss 
	.comm	i, 4, 4 


.section .text
.globl	main 
.type	main, @function

main: 
	
	pushl	%ebp 
	movl	%esp, %ebp 

	movl	$1, i 	# i = 1 
	jmp		mn_cond 

mn_for:
	
	pushl	$msgP1
	call	puts 
	addl	$4, %esp 

	movl	i, %eax
	pushl	%eax
	pushl	$msgP2
	call	printf
	addl	$8, %esp 
	
	addl	$1, i 

mn_cond: 
	movl	i, %eax 
	cmpl	$5, %eax 
	jle		mn_for

	pushl	$0
	call	exit 


