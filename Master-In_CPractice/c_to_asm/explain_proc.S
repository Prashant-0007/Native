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

