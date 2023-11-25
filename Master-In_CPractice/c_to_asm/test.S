.section .data
	a:
	.int	10 

.section .text
.global	main 
main: 
	movl	a,%eax	# eax <- a 
	negl	%eax 	# eax <- -eax 
	movl	$10, %ebx 
	movl	$0, %edx 
	mull	%ebx 
	

