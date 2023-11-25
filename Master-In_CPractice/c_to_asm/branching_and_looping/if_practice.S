# int n1 = 20; 
# int n2 = 30; 
# int main(){
# 	if(n1 <= n2)
# 		puts("Yes"); 
# 	puts("End of program"); 
#} 

.section .rodata
	msg_p1:
	.string	"Yes" 

	msg_p2:
	.string	"End of program" 

.section .data
	n1:
	.int 	20 

	n2:
	.int 	30 

.section .text
.globl	main
.type	main, @function 
main: 
# Prologue 	
	pushl	%ebp 
	movl	%esp, %ebp 

	movl	n1, %eax # eax <- n1 
	movl	n2, %edx # edx <- n2 
	cmpl	%edx, %eax 
	jnle	mn_out 

	pushl	$msg_p1
	call	puts
	addl	$4, %esp 

mn_out: 
	pushl	$msg_p2 
	call	puts
	addl	$4, %esp 

	pushl	$0 
	call	exit 

