.section .rodata
	msg_p1:
	.string	"i = %d\n" 

	msg_p2:
	.string	"End of program" 

.section .bss
	.comm	i, 4, 4 

.section .text
.global	main

main: 
	pushl	%ebp 
	movl	%esp, %ebp 

	movl	$0, i
	jmp		mn_cond 
mn_for: 
	movl	i, %eax
	movl	$0, %edx 
	movl	$7, %ebx
	divl	%ebx 
	cmpl	$0, %edx 
	
	je		mn_for_increment
	
	pushl	i  
	pushl	$msg_p1
	call	printf
	addl	$8, %esp

mn_for_increment: 
	addl	$1, i 
mn_cond: 
	movl	i, %eax
	cmpl	$50, %eax
	jl		mn_for

	pushl	$msg_p2
	call	puts
	addl	$4, %esp 

	pushl	$0 
	call	exit 

