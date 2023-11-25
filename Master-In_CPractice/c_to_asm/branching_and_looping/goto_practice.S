for(i = 0; i < 10; ++i) 
{
	for(j = 0; j < 10; ++j)
	{
		for(k = 0; k < 10; k++) 
		{
			X 
		}

		Y 
	}

	Z 
}





	movl	$0, i 
	jmp		mn_cond1 
mn_for1: 
		movl	$0, j 
		jmp		mn_cond2 
	mn_for2: 
			movl	$0, k 
			jmp		mn_cond3 
		mn_for3: 
			X	# inner most loop body 
			X	# inner most loop body 
			addl	$1, k
		mn_cond3: 
			movl	k, %eax
			cmpl	$10, %eax
			jl		mn_for3	
		Y	# middle loop body 
		Y	# middle loop body 
		addl	$1, j 
	mn_cond2: 
		movl	j, %eax
		cmpl	$10, %eax
		jl		mn_for2
	Z # outer most loop body 
	Z # outer most loop body 
	addl	$1, i 
mn_cond1: 
	movl	i, %eax
	cmpl	$10, %eax
	jl		mn_for1
