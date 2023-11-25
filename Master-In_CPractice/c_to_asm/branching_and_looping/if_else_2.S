.section .rodata
	msgP1:
	.string	"True" 

	msgP2:
	.string	"False" 

.section .data 
	a:
	.int	100 

	b:
	.int	50 

	c:
	.int	20 

	d:
	.int	80 

.section .text
.global	main 
main: 
# Prologue 
	pushl	%ebp 
	movl	%esp, %ebp 
	
	movl	a, %eax
	movl	b, %edx 
	cmpl	%edx, %eax 
	jng		else_block 
	
	movl	c, %eax
	movl	d, %edx
	cmpl	%edx, %eax
	jnl		else_block 

# if block 
	pushl	$msgP1
	call	puts
	addl	$4, %esp 

	jmp		end_of_else

else_block: 
	
# else block 
	pushl	$msgP2
	call	puts
	addl	$4, %esp 

end_of_else: 
# exit(0) 
	pushl	$0 
	call	exit 	

