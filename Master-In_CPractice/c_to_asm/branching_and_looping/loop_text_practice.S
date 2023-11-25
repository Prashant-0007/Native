movl	$0, i 
jmp		mn_cond1
mn_for1: 


	addl	$1, i 
mn_cond1:
	movl	i, %eax
	cmpl	$10, %eax
	jl	mn_for1


movl	$0, i 
jmp		mn_cond1
mn_for1: 


	addl	$1, i 
mn_cond1: 
	movl	i, %eax
	cmpl	$5, %eax
	jl		mn_for1



