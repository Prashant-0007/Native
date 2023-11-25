.section .rodata
	msg_p1:
	.string	"Enter n:" 	

	msg_p2:
	.string	"positive" 

	msg_p3:
	.string	"negative" 

	msg_p4:
	.string	"zero" 

	msg_s:
	.string	"%d" 

.section .bss
	.comm	n, 4, ,4 

.section .text 
.globl	main
main: 
	pushl	%ebp 
	movl	%esp, %ebp 
	
	pushl	$msg_p1
	call	printf
	addl	$4, %esp 

	pushl	$n 
	pushl	$msg_s
	call	scanf 
	addl	$8, %esp 

	movl	n, %eax

	cmpl	$0, %eax
	jg		mn_positive
	jl		mn_negative
	jmp		mn_zero 

mn_positive: 
	pushl	$msg_p2
	call	puts
	addl	$4, %esp 
	jmp		mn_out 

mn_negative: 
	pushl	$msg_p3
	call	puts
	addl	$4, %esp 
	jmp		mn_out 

mn_zero: 
	pushl	$msg_p4
	call	puts
	addl	$4, %esp 

mn_out: 
	pushl	$0
	call	exit 

