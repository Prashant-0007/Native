
/*FILE NAME :  addition_of_two_numbers.S */
.section .rodata
	msg:
	.string	"rs = %d\n" 

	proof:
	.string	"Proof of assembly source" 

.section .data
	n1:
	.int	10 

	n2:
	.int	20 

.section .bss
	.comm	rs, 4, 4 

.section .text
.globl	main
main: 
	# PROLOGUE 
	pushl	%ebp 
	movl	%esp, %ebp 

# BODY START 
# start rs = n1 + n2; 
	movl	n1, %eax
	movl	n2, %edx 
	addl	%edx, %eax 
	movl	%eax, rs
# end rs = n1 + n2 

# start printf("rs = %d\n", rs); 
	pushl	rs 			# S1
	pushl	$msg		# S1 
	call	printf		# S2 
	addl	$8, %esp	# S3  

# start puts("proof of assembly source") 
	pushl	$proof 
	call	puts 
	addl	$4, %esp 
# end puts("proof of assembly source") 
# end of printf("rs = %d\n", rs); 
# EXIT 
   	pushl	$0 
	call	exit 	
/*------------------------------------*/

/*FILE NAME :  addition_of_two_numbers_without_comment.S */
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
/*------------------------------------*/

/*FILE NAME :  bitwise_operator_class.S */
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

/*------------------------------------*/

/*FILE NAME :  bitwise_operator.S */
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
	
# bitwise NOT 
# rs = ~n1 
	movl	n1, %eax 	# eax <- n1 
	negl	%eax		# eax <- 2's compliment of eax 
	subl	$1, %eax	# eax <- 1's compliment of eax 
	movl	%eax, rs 	# rs <- eax 

# print rs 
	pushl	rs 
	pushl	$msg
	call	printf
	addl	$12, %esp 

# bitwise AND 
# rs = n1 & n2;  
	movl	n1, %eax
	movl	n2, %edx 
	andl	%edx, %eax
	movl	%eax, rs 

# print rs 
	pushl	rs 
	pushl	$msg
	call	printf
	addl	$8, %esp 

# bitwise OR 
# rs = n1 | n2; 
	movl	n1, %eax
	movl	n2, %edx 
	orl		%edx, %eax
	movl	%eax, rs 

# print rs 
	pushl	rs 
	pushl	$msg
	call	printf
	addl	$8, %esp 

# bitwise XOR 
	movl	n1, %eax
	movl	n2, %edx
	xorl	%edx, %eax
	movl	%eax, rs 

# print rs 
	pushl	rs 
	pushl	$msg
	call	printf
	addl	$8, %esp 

# exit(0) 
	pushl	$0 
	call	exit 

/*------------------------------------*/

/*FILE NAME :  data_full.S */
int n = 10; 

.globl	n 
.type	n, @object 
.size	n, 4
.align	4 
n: 
.int	10 
/*------------------------------------*/

/*FILE NAME :  dds.S */
# This assembly program is conversion of 
# dds.c 

# Rule 1 : Global initialized variables in C = data section in assembly 
# Rule 2 : Global uninitialized variables in C = bss section in assembly. 

# global variables c, s, n, m in dds.c will go to data section as per Rule 1 
# global variables c1, s1, n1, m1 in dds.c will go to bss section as per Rule 2 

# Create data section 
.section .data
	c: 
	.ascii	"A"			# char -> .ascii -> allocate 1 byte 

	s:
	.value	10 			# short -> .value -> allocate 2 bytes 

	n: 
	.int	10000		# int -> .int -> allocate 4 bytes 

	m:
	.long	0x10203040 	# long -> .long -> allocate 4 bytes 

# Create bss section 
.section .bss
	.comm	c1, 1, 4 
	.comm	s1, 2, 4 
	.comm	n1, 4, 4 
	.comm	m1, 4, 4 	


/*------------------------------------*/

/*FILE NAME :  explain_mul_instruction.S */
The result of two 32 bit integers can easily go beyond 2 ^ 32 
Therefore, we cannot store the multiplication result in 32 bit 
destination operand as we do in add and sub instructions. 

So how do we define mul instruction?? 

mul instruction takes only one operand. 

mul 	reg-operand

Let's say we are multiplying 4 byte numbers. 

mull	%reg-32 	# eax, ebx, ecx, edx, esi, edi 

mull	%ebx 		# ebx * ? 

# mull instruction has INVISIBLE operand eax. 
# In technical language INVISIBLE OPERAND is called as IMPLICIT OPERAND. 

eax * reg-32 result is given in two registers. Why? 
Because result is potentially 64 bit long. 

LOWER 32 bits of the result are placed in eax 
UPPER 32 bits of the result are placed in edx 



/*------------------------------------*/

/*FILE NAME :  explain_operator_conversion.S */
int a = 10; 
int b; 

int main()
{
	b = a;	/* a is source and b is destination  
}

.section .data
	a:
	.int	10 

.section .bss
	.comm	b, 4, 4 

.section .text
.globl	main
main: 
	
# b = a; Meaning b = a; -> transfer state of a to state of b 
# What do we use for data transfer ? -> mov  

	movl	a, %eax 
	movl	%eax, b 




/*------------------------------------*/

/*FILE NAME :  explain_proc.S */
int test_function(int a, int b)
{
	/* BODY */ 
}

.section .text 

.global	test_function 
test_function: 
	# PROLOGUE 
	pushl	%ebp 
	movl	%esp, %ebp 
# From this line onwards start translation of BODY 
	


# At this line end of translation of BODY 
	# EPILOGUE 
	movl	%ebp, %esp 
	popl	%ebp 
	ret 

.section .text
.global	main
main: 
	pushl	%ebp 
	movl	%esp, %ebp 
##################### BODY START 

	
##################### BODY END 
# Instead of epilogue -> call exit 
	pushl	$0 
	call	exit 


#------------------------------------------------------------------

Function call 

ret = F(actual parameter list) 
	= F(a1, a2, ..., an) 
		an
		an-1
		an-2


		a1
S1 : push actual parameter list on STACK (STACK THE ARGUMENTS) 
S2 : Call function 
S3 : Clear the stack 

ret = F(a1, a2, ...., an) 

		pushl	an 			# S1 
		pushl	an-1		# S1
		pushl	an-2 		# S1



		pushl	a1 			# S1
		call	F 			# S2 
		addl	$4n, %esp 	# S3 

		printf("my number is %d\n", n); 

		pushl	n 			#S1
		pushl	$msg		#S1
		call	printf		#S2
		addl	$8, %esp 	#S3

/*------------------------------------*/

/*FILE NAME :  operator_demo.S */
# The purpose of this program is to convert operator_demo.c in 
# operator_demo.S 

# Create data section 
.section .data 
# int n1 = 10; 
	n1:
	.int	10 

# int n2 = 3; 
	n2:
	.int	3 

# Create BSS section 
.section .bss
# int rs; 
	.comm	rs, 4, 4 

# Create text section 
.section .text 

# int main() { } 
# .global variable_name -> Declares variable name as global 
.global	main 	# Declare main as global variable 
main: 
	# Instructions 			
	


/*------------------------------------*/

/*FILE NAME :  operators.S */
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

/*------------------------------------*/

/*FILE NAME :  pre_post_increment_decrement.S */
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
/*------------------------------------*/

/*FILE NAME :  shift_operators_class.S */
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
/*------------------------------------*/

/*FILE NAME :  shift_operators.S */
# The goal of this program is to demonstrate 
# arithmetic shift operators in C in assembly 

.section .rodata
	msg:
	.string "b1 = %u\n" 

.section .data
	b1:
	.int 	0x0a 

.section .text
.global	main 
main: 
	# Prologue 
	pushl	%ebp 
	movl	%esp, %ebp 

	# Shift arithmetic left operator 
# print b1 
	pushl	b1 
	pushl	$msg
	call	printf
	addl	$8, %esp 

# b1 = b1 << 1; 
	movl	b1, %eax
	sall	$1, %eax
	movl	%eax, b1 

# print b1 
	pushl	b1
	pushl	$msg
	call	printf
	addl	$8, %esp 

# b1 = b1 << 2; 
	movl	b1, %eax
	sall	$2, %eax
	movl	%eax, b1 

# print b1 
	pushl	b1 
	pushl	$msg
	call	printf
	addl	$8, %esp 

# shift arithmetic right operator 
	movl	$0x18, b1 

# print b1
	pushl	b1 
	pushl	$msg
	call	printf
	addl	$8, %esp 

# b1 = b1 >> 1; 
	movl	b1, %eax
	sarl 	$1, %eax
	movl	%eax, b1 

# print b1 
	pushl	b1
	pushl	$msg
	call	printf
	addl	$8, %esp 

# b1 = b1 >> 2; 
	movl	b1, %eax
	sarl	$2, %eax
	movl	%eax, b1 

# print b1 
	pushl	b1 
	pushl	$msg
	call	printf
	addl	$8, %esp 

# exit(0) 
	pushl	$0 
	call	exit 
/*------------------------------------*/

/*FILE NAME :  summation_of_two_numbers.S */
	.file	"summation_of_two_numbers.c"
	.comm	num1,4,4
	.comm	num2,4,4
	.comm	num3,4,4
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	subl	$4, %esp
	movl	$100, num1
	movl	$200, num2
	movl	num1, %edx
	movl	num2, %eax
	addl	%edx, %eax
	movl	%eax, num3
	subl	$12, %esp
	pushl	$0
	call	exit
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.12) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
/*------------------------------------*/

/*FILE NAME :  test.S */
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
	

/*------------------------------------*/

/*FILE NAME :  unsigned_mulitplication_of_big_numbers.S */
.section .rodata
	msg:
	.string	"rs = %llu\n" 

.section .data
	n1:
	.int	0x10203040 

	n2:
	.int	0xa0b0c0d0 

.section .bss	
	.comm	rs, 8, 4 

.section .text
.global	main
main: 
	pushl	%ebp
	movl	%esp, %ebp 

	movl	n1, %eax 
	movl	n2, %ebx
	movl	$0, %edx 
	mull	%ebx 

	movl	%eax, rs 
	movl	%edx, rs+4

	pushl	rs+4 
	pushl	rs 
	pushl	$msg
	call	printf
	addl	$12, %esp 

	pushl	$0 
	call	exit 
/*------------------------------------*/

/*FILE NAME :  unsigned_multiplication_demo.S */
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

/*------------------------------------*/
