.section .rodata
	msgP1:
	.string	"inA.a=%d, inA.b=%hd, inA.c=%d\nASSEMBLY\n"

.section .bss	
	.comm	inA, 12, 4 


.section .text 
.globl	main 
.type 	main, @function 
main: 
	pushl	%ebp 
	movl	%esp, %ebp 

	movl	$inA, %eax 
	movl	$100, 0(%eax)
	movw	$200, 4(%eax) 
	movl	$300, 8(%eax)
	
	movl	(%eax), %ebx 	# ebx <- inA.a 
	movw	4(%eax), %cx 	# cx <- inA.b 
	movsx 	%cx, %ecx 		# ecx <- inA.b 
	movl	8(%eax), %edx 

	pushl	%edx 
	pushl	%ecx 
	pushl	%ebx 
	pushl	$msgP1
	call	printf
	addl	$16, %esp

	pushl	$0 
	call	exit 


#-------------------------------------

#movb	$10, %al 

#0000 1010 

#0000 0000 0000 1010 -> ax 

# movsx 	%al, %ax 

# movb 	$-1, %al 

# 1111 1111 = al 

# 1111 1111 1111 11111 = ax 

