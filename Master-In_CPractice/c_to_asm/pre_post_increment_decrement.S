.section .rodata
	msg: 
	.string	"m = %d\tn= %d\n" 

.section .data 
	n:
	.int	10 

.section .bss
	.comm	m, 4, 4 

.section .text
.global	main
main: 
	# Prologue 
	pushl	%ebp
   	movl	%esp, %ebp 

	# preincrement 
	
	# add first, assign later 
	movl	n, %eax
	addl	$1, %eax
	movl	%eax, n 
	
	movl	n, %eax
	movl	%eax, m 

	# print-> preincrement 
	pushl	n 
	pushl	m 
	pushl	$msg
	call	printf
	addl	$12, %esp 

	# Post increment 
	# assign first, increment later 

	# restore n to n 
	movl	$10, n 

	movl	n, %eax
	movl	%eax, m 

	movl	n, %eax
	addl	$1, %eax
	movl	%eax, n 

	# print -> post increment 
	pushl	n 
	pushl	m
	pushl	$msg
	call	printf
	addl	$12, %esp 

	# pre-decrement 
	# decrement first, assign later 

	# restore n 
   	movl	$10, n 

	movl	n, %eax	
	subl	$1, %eax 
	movl	%eax, n 

	movl	n, %eax	
	movl	%eax, m 

	# print-> predecrement 
	pushl	n 
	pushl	m 
	pushl	$msg
	call	printf
	addl	$12, %esp 
	
	# post decrement 
# assign first, decrement later 
# restore n to 10 
	movl	$10, n 

	movl	n, %eax
	movl	%eax, m 

	movl	n, %eax
	subl	$1, %eax
	movl	%eax, n 

# print -> post decrement 
	pushl	n
	pushl	m
	pushl	$msg
	call	printf
	addl	$12, %esp

	# exit(0) 
	pushl	$0 
	call	exit 
