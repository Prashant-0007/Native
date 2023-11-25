.section .rodata
	msgP1:
	.string	"sum == %d\n" 

.section .data 
	.globl	arr 
	.type	arr, @object 
	.size	arr, 40 
	.align 	4 
	arr:
	.int 	10, 20, 30, 40, 50, 60, 70, 80, 90, 100 

.section .bss
	.comm	sum, 4, 4 
	.comm	i, 4, 4 

.equ	NR_ELEMENTS, 10 

.section .text
.globl	main 
.type	main, @function 
main: 
	pushl	%ebp 
	movl 	%esp, %ebp 

	movl	$0, i 
	jmp		mn_cond1 
mn_for1: 
	# arr[i] == arr(, index-reg, size_of_element_constant) 
	# v(%r1, %r2, c) == address of (v) + r1 + r2 * c 
	movl	i, %eax 
	movl	arr(, %eax, 4), %edx 
	addl	%edx, sum 
	addl	$1, i 
mn_cond1: 
	movl 	i, %eax 
	cmpl	$NR_ELEMENTS, %eax 
	jl 		mn_for1

	movl	sum, %eax 
	pushl	%eax 
	pushl	$msgP1
	call	printf
	addl	$8, %esp 

	pushl	$0 
	call	exit 
