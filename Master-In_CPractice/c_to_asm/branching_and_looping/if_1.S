# Goal of this is program is to translate 
# if_1.c 

.section .rodata
	msg_p1:
	.string	"U:This is a start of the program" 

	msg_p2:
	.string "C:This will be printed if n1 > n2"

	msg_p3:
	.string	"U:This is a last statement of program"

.section .data
	n1:
	.int	5 

	n2:
	.int	10 

.section .text 
.globl	main 
main: 
	# PROLOGUE 
	pushl	%ebp
	movl	%esp, %ebp 

# puts(msg_p1); 
	pushl	$msg_p1
	call	puts
	addl	$4, %esp 

# S1: compare n1 and n2 and store the result 
# in eflags register 
	movl	n1, %eax		# eax <- n1 
	movl	n2, %edx 		# edx <- n2 
	cmpl	%edx, %eax 		# eax and edx cmp
	
	jng		out 

	pushl	$msg_p2
	call	puts
	addl	$4, %esp 

out: 
	pushl	$msg_p3 
	call	puts 
	addl	$4, %esp 

	pushl	$0 
	call	exit 

