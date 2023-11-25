.section .rodata
	msg_p1:
	.string	"Hello, for loop" 

.section .bss
	.comm	i, 4, 4 

.section .text
.globl	main
main: 
	pushl	%ebp
	movl	%esp, %ebp 
	
	movl	$0, i 
	jmp		mn_for_cond 

mn_for_body: 
	
	pushl	$msg_p1
	call	puts
	addl	$4, %esp

	addl	$1, i 
mn_for_cond: 
	movl	i, %eax
	cmpl	$5, %eax
	jl		mn_for_body 

	pushl	$0 
	call	exit 
