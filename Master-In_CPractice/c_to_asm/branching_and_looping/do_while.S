.section .rodata
	msg_p1:
	.string	"[1]Insert[2]Delete[3]Search:" 

	msg_p2:
	.string	"Insert was selected"

	msg_p3:
	.string	"Delete was selected" 

	msg_p4:
	.string	"Search was selected" 

	msg_p6: 
	.string "Do you want to continue?[1]-Yes,[0]-No:"

	msg_s1:
	.string	"%d" 

	msg_e1:
	.string	"Wrong choice" 

.section .bss
	.comm	choice, 4, 4 
	.comm	should_continue, 4, 4 

.section .text
.globl	main
main: 
	pushl	%ebp 
	movl	%esp, %ebp 
	
mn_do_while_body:			# do  
	
	pushl	$msg_p1
	call	printf
	addl	$4, %esp 

	pushl	$choice 
	pushl	$msg_s1
	call	scanf 
	addl	$8, %esp 

	movl	choice, %eax	# switch(choice) 

	cmpl	$1, %eax
	je		case_1_handler 

	cmpl	$2, %eax
	je 		case_2_handler 

	cmpl	$3, %eax
	je		case_3_handler 

	jmp		default_handler 

case_1_handler: 					# case 1: 
	pushl	$msg_p2
	call	puts
	addl	$4, %esp 
	jmp		switch_case_out 		# break 

case_2_handler: 					# case 2: 
	pushl	$msg_p3
	call	puts 
	addl	$4, %esp 
	jmp		switch_case_out 		# break 

case_3_handler: 					# case 3: 
	pushl	$msg_p4
	call	puts
	addl	$4, %esp
	jmp		switch_case_out 		# break 

default_handler: 					# default: 
	pushl	$msg_e1
	call	puts
	addl	$4, %esp 

switch_case_out: 
	pushl	$msg_p6
	call	printf
	addl	$4, %esp 

	pushl	$should_continue 
	pushl	$msg_s1
	call	scanf 
	addl	$8, %esp 

	movl	should_continue, %eax
	cmpl	$1, %eax 
	je		mn_do_while_cond 
	cmpl	$0, %eax
	je		mn_do_while_cond 
	
	movl	$0, should_continue 

mn_do_while_cond:
	movl	should_continue, %eax
	cmpl	$1, %eax 
	je		mn_do_while_body 

	pushl	$0 
	call	exit 
