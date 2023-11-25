.section .rodata
	msg_p1:
	.string	"random number = %d\n" 

	msg_p2:
	.string	"end of program" 

.section .bss
	.comm	i, 4, 4 
	.comm	n, 4, 4 

.section .text
.globl	main
main: 
	# Prologue 
	pushl	%ebp
	movl	%esp, %ebp 
	
# i = 0; 
	movl	$0,i 
	jmp		mn_for_cond
mn_for_body: 
# n = rand() 
	call	rand 
	movl	%eax, n 
	
# n % 7 == 0 
	movl	$7, %ebx
	movl	$0, %edx 
	divl	%ebx 
	cmpl	$0, %edx 
# break 
	je		mn_for_out 
	
# printf("random number = %d\n", n); 
	pushl	n 
	pushl	$msg_p1
	call	printf
	addl	$8, %esp 

# ++i 
	addl	$1, i 
mn_for_cond: 
	# i < 100 
	movl	i, %eax 
	cmpl	$100, %eax
	jl		mn_for_body 

mn_for_out: 
	
	pushl	$msg_p2
	call	puts
	addl	$4, %esp 	

	pushl	$0 
	call	exit 
