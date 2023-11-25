.section .rodata
	msgP1:
	.string	"A[%d]=%d\n" 

.section .bss 
	.comm	A, 32, 4 
	.comm	i, 4, 4 

.section .text
.globl	main 
.type	main, @function  

main: 
	pushl	%ebp 
	movl	%esp, %ebp 

	movl	$0, i 
	jmp		mn_cond_1 
mn_for_1: 
	addl	$1, %eax
	movl	$5, %ebx 
	movl	$0, %edx 
	mull	%ebx 
	
	movl	i, %ebx 
	movl	%eax, A(, %ebx, 4)

	addl	$1, i 
mn_cond_1: 
	movl	i, %eax
	cmpl	$8, %eax
	jl		mn_for_1

	movl	$0, i 
	jmp		mn_cond_2 
mn_for_2: 
	movl	A(, %eax, 4), %edx 
	pushl	%edx 
	pushl	%eax 
	pushl	$msgP1
	call	printf
	addl	$12, %esp 

	addl	$1, i 

mn_cond_2: 
	movl	i, %eax
	cmpl	$8, %eax
	jl		mn_for_2 

	pushl	$0 
	call	exit 



# V(%r1, %r2, constant) 
# r1  = offset of base addr of array from 
# r2 = index 
# constant = sizeof element 

# A(, %r, 4) = A[i] 


