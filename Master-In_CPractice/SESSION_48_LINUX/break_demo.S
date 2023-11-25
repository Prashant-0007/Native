.section .rodata
	msgP1:
	.string	"a[%d]:%d\n" 

	msgP2:
	.string	"i = %d\n" 

.section .data
	.globl	arr 
	.type	arr, @object
	.size	arr, 40 
	.align	4 
	arr:
	.int	10, 20, 30, 40, 50, 60, 70, 80, 90, 100 

.section .bss
	.comm	i, 4, 4 

.section .text
.globl	main 
.type	main, @function 
main: 
	pushl	%ebp 
	movl	%esp, %ebp 
	
	movl	$0, i 
	jmp		mn_cond
mn_for: 
	movl	arr(, %eax, 4), %edx 
	movl	%edx, %eax
	movl	$0, %edx 
	movl	$7, %ebx 
	divl	%ebx 
	cmpl	$0, %edx 
	je		mn_out 	# break 

	movl	i, %eax
	movl	arr(, %eax, 4), %edx 
	pushl	%edx
	pushl	%eax
	pushl	$msgP1
	call	printf
	addl	$12, %esp 

	addl	$1, i 

mn_cond: 
	movl	i, %eax
	cmpl	$9, %eax
	jle		mn_for

mn_out: 

	movl	i, %eax
	pushl	%eax
	pushl	$msgP2
	call	printf
	addl	$8, %esp 

	pushl	$0 
	call	exit 
	
