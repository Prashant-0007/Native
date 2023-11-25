.section .rodata 
	msg:
	.string	"rs = %x\n" 

.section .data 
	n1:
	.int	0x0f0f0f0f

	n2:
	.int	0xf0f0f0f0 

.section .bss 
	.comm	rs, 4, 4 

.section .text
.global	main 
main:	
	# PROLOGUE 
	pushl	%ebp
	movl	%esp, %ebp 

# rs = ~n1; 
	movl	n1, %eax	# eax <- n1 
	negl	%eax 		# eax <- 2's compliment of eax
	subl	$1, %eax	# eax <- 1's compliment (~)
	movl	%eax, rs  	# rs  <- eax 

# print rs 
	pushl	rs 
	pushl	$msg
	call	printf
	addl	$8, %esp 

# rs = n1 & n2 
	movl	n1, %eax 	# eax <- n1 
	movl	n2, %edx 	# edx <- n2 
# andl src, dest ---> dest <- src & dest
	andl	%edx, %eax 	# eax <- eax & edx
  	movl	%eax, rs 	# rs <- eax 	

# print rs 
	pushl	rs 
	pushl	$msg
	call	printf
	addl	$8, %esp 

# rs = n1 | n2; 
	movl	n1, %eax	# eax <- n1 
	movl	n2, %edx	# edx <- n2 
	orl		%edx, %eax 	# eax <- eax | edx 
	movl	%eax, rs 	# rs <- eax 

# print rs 
	pushl	rs 
	pushl	$msg
	call	printf
	addl	$8, %esp 

# rs = n1 ^ n2 	
	movl	n1, %eax	# eax <- n1 
	movl	n2, %edx	# edx <- n2 
	xorl	%edx, %eax	# eax <- eax ^ edx 
	movl	%eax, rs 	# rs <- edx 

# print rs 
	pushl	rs 
	push	$msg
	call	printf
	addl	$8, %esp 

# exit(0); 
	pushl	$0 
	call	exit 

