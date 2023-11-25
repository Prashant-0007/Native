.section .rodata
	msg_p1:
	.string	"Hello" 

.section .bss
	.comm	i, 4, 4 

.section .text 
.globl	main 
main: 
# Prologue 
	pushl	%ebp 
	movl	%esp, %ebp 

# Loop variable initialization 
	movl	$0, i 		# i <- 0 
	jmp		mn_eval_loop_cond 
mn_loop_body: 
# Body 
	pushl	$msg_p1
	call	puts
	addl	$4, %esp 
	
# Loop variable manipulation 
	addl	$1, i 
mn_eval_loop_cond: 
# Loop variable condition 
	movl	i, %eax
	cmpl	$5, %eax
	jl		mn_loop_body 

	pushl	$0 
	call	exit 
