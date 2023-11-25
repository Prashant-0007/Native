int a = 10; 
int b; 

int main()
{
	b = a;	/* a is source and b is destination  
}

.section .data
	a:
	.int	10 

.section .bss
	.comm	b, 4, 4 

.section .text
.globl	main
main: 
	
# b = a; Meaning b = a; -> transfer state of a to state of b 
# What do we use for data transfer ? -> mov  

	movl	a, %eax 
	movl	%eax, b 




