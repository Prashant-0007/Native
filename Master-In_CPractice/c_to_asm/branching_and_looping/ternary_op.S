.section .rodata
	msg_p1:
	.string	"Enter n:" 

	msg_p2:
	.string	"rs = %d\n" 
	
	msg_s1:
	.string	"%d" 

.section .bss
	.comm	n, 4, 4 
	.comm	rs, 4, 4 
.section .text
.globl	main
main: 
	pushl	%ebp
	movl	%esp, %ebp 
	
	pushl	$msg_p1
	call	printf
	addl	$4, %esp 
	
	pushl	$n
	pushl	$msg_s1
	call	scanf 
	addl	$8, %esp 

	movl	n, %eax
	cmpl	$0, %eax
	jl		mn_else
	
	movl	n, %eax
	addl	$5, %eax
	jmp		mn_out 

mn_else:
	movl	n, %eax
	negl	%eax
	addl	$5, %eax
mn_out: 
	movl	%eax, rs 
	
	pushl	rs
	pushl	$msg_p2
	call	printf
	addl	$8, %esp 
	
	pushl	$0 
	call	exit 

