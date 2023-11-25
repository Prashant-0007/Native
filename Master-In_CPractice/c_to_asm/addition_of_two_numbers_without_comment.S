.section .rodata 
	msg:
	.string	"rs = %d\n" 
.section .data 
	n1: 
	.int 	10 
	n2:
	.int	20 
.section .bss
	.comm	rs, 4, 4 
.section .text 
.global	main
main: 
	pushl	%ebp 
	movl	%esp, %ebp 
	movl	n1, %eax
	movl	n2, %edx
	addl	%edx, %eax
	movl	%eax, rs 
	pushl	rs 
	pushl	$msg
	call	printf
	addl	$8, %esp 
	pushl	$0 
	call	exit 
