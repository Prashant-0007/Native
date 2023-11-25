##int n1 = 10; 
##int n2 = 20; 
##int main(){
## if(n1 == n2){
## 	puts("equal"); 
## }else{
## 	puts("unequal"); 
## } 
## puts("End of program"); 
## exit(0); 
## }


.section .rodata
	msg_p1:
	.string	"equal" 

	msg_p2:
	.string	"unequal" 

	msg_p3:
	.string	"End of program" 

.section .data
	n1:
	.int	10 

	n2:
	.int	20 

.section .text
.global	main
.type	main, @function 

main: 
# Prologue 
	pushl	%ebp
	movl	%esp, %ebp 
	
	movl	n1, %eax
	movl	n2, %edx 

	cmpl	%edx, %eax 
	jne		mn_else 

	pushl	$msg_p1
	call	puts
	addl	$4, %esp 

	jmp		mn_out 


mn_else:
	pushl	$msg_p2
	call	puts
	addl	$4, %esp 

mn_out: 
	pushl	$0 
	call	exit 

