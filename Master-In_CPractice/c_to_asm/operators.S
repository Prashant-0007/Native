# Directive to an assembler to create read only data section 
.section .rodata			 
	
	msgP1:						# Name of variable 
	.string	"result = %d\n" 	# .string -> sequence of characters 
								# are to be allocated 

	q_msg:						# name of variable 
	.string	"Quotient = %d\n" 	# .string -> sequence of characters 
								# are to be allocated 

	r_msg:						# as above 
	.string	"Remainder = %d\n" 

# Create BSS section -> BSS -> Block of memory started by symbol 
# whose initial value is 0. (i.e. no explicity value is provided) 
# Future hint -> global UNinitialized data definition statement 
# they are allocated AS BSS variables in assembly. 
.section .bss
	.comm	n1, 4, 4
	.comm	n2, 4, 4 
	.comm	rs, 4, 4 
	.comm	qnt, 4, 4 
	.comm	rmd, 4, 4 

.section .text
.globl	main
.type	main, @function 
main: 
	pushl	%ebp
	movl	%esp, %ebp 
	
	movl	$10, n1
	movl	$20, n2 

# addition 
	movl	n1, %eax	# eax <- n1 
	movl	n2, %edx 	# ebx <- n2 
	addl	%edx, %eax	# eax <- eax + edx 

	pushl	%eax
	pushl	$msgP1
	call	printf
	addl	$8, %esp 
	
# subtraction 
	movl	n1, %eax	# eax <- n1 
	movl	n2, %ebx	# ebx <- n2 
	subl	%ebx, %eax	# eax <- eax + ebx 
	
	pushl	%eax
	pushl	$msgP1
	call	printf 
	addl	$8, %esp 

# Unsigned multiplication 
	movl	$50, n1		
	movl	$8, n2 
	
	movl	n1, %eax
	movl	n2, %ebx 
	
	movl	$0, %edx 

	mull	%ebx 

	pushl	%eax 
	pushl	$msgP1
	call	printf
	addl	$8, %esp 

# Signed multiplication 
	movl	$50, n1 
	movl	$-8, n2 

	movl	n1, %eax
	movl	n2, %ebx 
	movl	$0, %edx 
	imull	%ebx 

	pushl	%eax
	pushl	$msgP1
	call	printf
	addl	$8, %esp 

# Unsigned division 
	movl	$50, n1 
	movl	$8, n2 
	
	movl	n1, %eax
	movl	n2, %ebx 
	movl	$0, %edx 
	divl	%ebx 
	movl	%eax, qnt
	movl	%edx, rmd 
	
	movl	qnt, %eax 
	pushl	%eax
	pushl	$q_msg 
	call	printf
	addl	$8, %esp 

	movl	rmd, %eax
	pushl	%eax
	pushl	$r_msg
	call	printf
	addl	$8, %esp 

# Signed division 
	movl	$-50, n1 
	movl	$8, n2 

	movl	n1, %eax
	movl	n2, %ebx
	cdq
	idivl	%ebx 
	movl	%eax, qnt
	movl	%edx, rmd 

	movl	qnt, %eax
	pushl	%eax
	pushl	$msgP1
	call	printf
	addl	$8, %esp 

	movl	rmd, %eax
	pushl	%eax
	pushl	$msgP1
	call	printf
	addl	$8, %esp 

# call exit function 
	pushl	$0
	call	exit 


#movl	n1, %eax
#movl	n2, %ebx 
#addl	%ebx, %eax # eax <- eax + ebx  


#movl	n1, %eax
#movl	n2, %ebx
#subl	%ebx, %eax # eax <- eax - edx 

#movl	n1, %eax
#movl	n2, %edx 
#mull 	%edx, %eax # eax <- eax * edx ITS NOT HOW MUL instruction is designed 


#short s1 = 10; 
#short s2 = 20; 
#short rs; 

#.section .data
#	s1:
#	.value	10 

#	s2:
#	.value	20 

#.section .bss
#	.comm	rs, 2, 4 

#.section .text 
#main: 
#	movw	s1, %ax 
#	movw	s2, %cx 
#	addw	%cx, %ax
#	movw	%ax, rs 

