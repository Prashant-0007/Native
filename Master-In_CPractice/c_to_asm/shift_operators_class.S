.section .rodata
	msg:
	.string	"n = %d\n" 

.section .data
	n:
	.int 	10 

.section .text
.global	main
main: 
	# Proglogue 
	pushl	%ebp 
	movl	%esp, %ebp 

# print n 
	pushl	n 
	pushl	$msg
	call	printf
	addl	$8, %esp 

# For left shift, sal instruction must be used 
# sal -> shift arithmetic left 
# sal 	src, dest # dest <- dest << src 

# n = (n << 1) 
	movl	n, %eax 	# eax <- n 
	sall	$1, %eax	# eax <- eax << 1 
	movl	%eax, n 	# n <- eax

# print n 
	pushl	n
	pushl	$msg
	call	printf
	addl	$8, %esp 

# n = (n << 2); 
	movl	n, %eax
	sall	$2, %eax 
	movl	%eax, n 

# print n 
	pushl	n
	pushl	$msg
	call	printf
	addl	$8, %esp 

# n = 24 
	movl	$24, n 

#print n 
	pushl	n 
	pushl	$msg
	call	printf
	addl	$8, %esp 

# n = n >> 1 
	movl	n, %eax		# eax <- n 
	sarl	$1, %eax	# eax <- eax >> 1 
	movl	%eax, n 	# n <- eax 

# printf n 
	pushl	n 
	pushl	$msg
	call	printf
	addl	$8, %esp 

# n = n >> 2 
	movl	n, %eax
	sarl	$2, %eax
	movl	%eax, n 

# print n 
	pushl	n 
	pushl	$msg
	call	printf
	addl	$8, %esp 

# exit(0) 
	pushl	$0
	call	exit 
