.section .rodata
	msg:
	.string	"rs = %u\n" 

.section .data 
	n1:
	.int	50

	n2:
	.int	8 

.section .bss
	.comm	rs, 4, 4 

.section .text
.global	main
main: 
	# Prologue 
	pushl	%ebp 
	movl	%esp, %ebp
	
	# rs = n1 * n2 
	movl	n1, %eax
	movl	n2, %ebx
# movl	$0, %edx 
	mull	%ebx
	movl	%eax, rs 

	# printf("rs = %u\n", rs); 
	pushl	rs 
	pushl	$msg
	call	printf
	addl	$8, %esp 

	# exit(0) 
	pushl	$0 
	call	exit 

