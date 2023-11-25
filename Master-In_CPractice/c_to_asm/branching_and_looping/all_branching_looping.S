
/*FILE NAME :  break_demo.S */
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
/*------------------------------------*/

/*FILE NAME :  continue_demo.S */
.section .rodata
	msg_p1:
	.string	"i = %d\n" 

	msg_p2:
	.string	"End of program" 

.section .bss
	.comm	i, 4, 4 

.section .text
.global	main

main: 
	pushl	%ebp 
	movl	%esp, %ebp 

	movl	$0, i
	jmp		mn_cond 
mn_for: 
	movl	i, %eax
	movl	$0, %edx 
	movl	$7, %ebx
	divl	%ebx 
	cmpl	$0, %edx 
	
	je		mn_for_increment
	
	pushl	i  
	pushl	$msg_p1
	call	printf
	addl	$8, %esp

mn_for_increment: 
	addl	$1, i 
mn_cond: 
	movl	i, %eax
	cmpl	$50, %eax
	jl		mn_for

	pushl	$msg_p2
	call	puts
	addl	$4, %esp 

	pushl	$0 
	call	exit 

/*------------------------------------*/

/*FILE NAME :  do_while.S */
.section .rodata
	msg_p1:
	.string	"[1]Insert[2]Delete[3]Search:" 

	msg_p2:
	.string	"Insert was selected"

	msg_p3:
	.string	"Delete was selected" 

	msg_p4:
	.string	"Search was selected" 

	msg_p6: 
	.string "Do you want to continue?[1]-Yes,[0]-No:"

	msg_s1:
	.string	"%d" 

	msg_e1:
	.string	"Wrong choice" 

.section .bss
	.comm	choice, 4, 4 
	.comm	should_continue, 4, 4 

.section .text
.globl	main
main: 
	pushl	%ebp 
	movl	%esp, %ebp 
	
mn_do_while_body:			# do  
	
	pushl	$msg_p1
	call	printf
	addl	$4, %esp 

	pushl	$choice 
	pushl	$msg_s1
	call	scanf 
	addl	$8, %esp 

	movl	choice, %eax	# switch(choice) 

	cmpl	$1, %eax
	je		case_1_handler 

	cmpl	$2, %eax
	je 		case_2_handler 

	cmpl	$3, %eax
	je		case_3_handler 

	jmp		default_handler 

case_1_handler: 					# case 1: 
	pushl	$msg_p2
	call	puts
	addl	$4, %esp 
	jmp		switch_case_out 		# break 

case_2_handler: 					# case 2: 
	pushl	$msg_p3
	call	puts 
	addl	$4, %esp 
	jmp		switch_case_out 		# break 

case_3_handler: 					# case 3: 
	pushl	$msg_p4
	call	puts
	addl	$4, %esp
	jmp		switch_case_out 		# break 

default_handler: 					# default: 
	pushl	$msg_e1
	call	puts
	addl	$4, %esp 

switch_case_out: 
	pushl	$msg_p6
	call	printf
	addl	$4, %esp 

	pushl	$should_continue 
	pushl	$msg_s1
	call	scanf 
	addl	$8, %esp 

	movl	should_continue, %eax
	cmpl	$1, %eax 
	je		mn_do_while_cond 
	cmpl	$0, %eax
	je		mn_do_while_cond 
	
	movl	$0, should_continue 

mn_do_while_cond:
	movl	should_continue, %eax
	cmpl	$1, %eax 
	je		mn_do_while_body 

	pushl	$0 
	call	exit 
/*------------------------------------*/

/*FILE NAME :  for1.S */
.section .rodata
	msg_p1:
	.string	"Hello, for loop" 

.section .bss
	.comm	i, 4, 4 

.section .text
.globl	main
main: 
	pushl	%ebp
	movl	%esp, %ebp 
	
	movl	$0, i 
	jmp		mn_for_cond 

mn_for_body: 
	
	pushl	$msg_p1
	call	puts
	addl	$4, %esp

	addl	$1, i 
mn_for_cond: 
	movl	i, %eax
	cmpl	$5, %eax
	jl		mn_for_body 

	pushl	$0 
	call	exit 
/*------------------------------------*/

/*FILE NAME :  goto_demo.S */
.section .rodata
	msg_p1:
	.string	"i=%d j=%d k=%d\n" 

	msg_p2:
	.string	"End of assembly program" 
.section .bss
	.comm	i, 4, 4 
	.comm	j, 4, 4
  	.comm	k, 4, 4 	

.section .text
.globl	main
main: 
	pushl	%ebp
	movl	%esp, %ebp 
	
	movl	$0, i 
	jmp		mn_cond1 
mn_for1: 
	movl	$0, j 
	jmp		mn_cond2 
mn_for2: 
	movl	$0, k 
	jmp		mn_cond3 
mn_for3: 
	
	movl	i, %eax
	addl	j, %eax
	addl	k, %eax
	cmpl	$20, %eax
	jg		mn_out 
	
	pushl	k
	pushl	j
	pushl	i 
	pushl	$msg_p1
	call	printf
	addl	$16, %esp

	addl	$1, k 
mn_cond3: 
	movl	k, %eax
	cmpl	$10, %eax
	jl		mn_for3

	addl	$1, j 
mn_cond2: 
	movl	j, %eax
	cmpl	$10, %eax
	jl		mn_for2
	
	addl	$1, i 
mn_cond1: 
	movl	i, %eax
	cmpl	$10, %eax
	jl		mn_for1 

mn_out: 
	pushl	$msg_p2
	call	puts
	addl	$4, %esp 


	pushl	$0 
	call	exit 
/*------------------------------------*/

/*FILE NAME :  goto_practice.S */
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
/*------------------------------------*/

/*FILE NAME :  if_1.S */
# Goal of this is program is to translate 
# if_1.c 

.section .rodata
	msg_p1:
	.string	"U:This is a start of the program" 

	msg_p2:
	.string "C:This will be printed if n1 > n2"

	msg_p3:
	.string	"U:This is a last statement of program"

.section .data
	n1:
	.int	5 

	n2:
	.int	10 

.section .text 
.globl	main 
main: 
	# PROLOGUE 
	pushl	%ebp
	movl	%esp, %ebp 

# puts(msg_p1); 
	pushl	$msg_p1
	call	puts
	addl	$4, %esp 

# S1: compare n1 and n2 and store the result 
# in eflags register 
	movl	n1, %eax		# eax <- n1 
	movl	n2, %edx 		# edx <- n2 
	cmpl	%edx, %eax 		# eax and edx cmp
	
	jng		out 

	pushl	$msg_p2
	call	puts
	addl	$4, %esp 

out: 
	pushl	$msg_p3 
	call	puts 
	addl	$4, %esp 

	pushl	$0 
	call	exit 

/*------------------------------------*/

/*FILE NAME :  if_2.S */
.section .rodata
	msgP1:
	.string	"U:Enter n1:" 

	msgP2:
	.string	"U:Enter n2:" 

	msgP3:
	.string	"C:n1 is less than or equal to n2" 
	
	msgP4:
	.string	"End of program" 

	msgS1:
	.string	"%d" 

.section .bss 
	.comm	n1, 4, 4 
	.comm	n2, 4, 4 

.section .text
.globl	main
main: 
	# Prologue 
	pushl	%ebp 
	movl	%esp, %ebp 

# printf 
	pushl	$msgP1
	call	printf
	addl	$4, %esp 

# scanf 
	pushl	$n1 
	pushl	$msgS1
	call	scanf 
	addl	$8, %esp 

# printf
	pushl	$msgP2
	call	printf
	addl	$4, %esp 

# scanf 
	pushl	$n2 
	pushl	$msgS1 
	call	scanf 
	addl	$8, %esp 

	movl	n1, %eax
	movl	n2, %edx
	cmpl	%edx, %eax 
	
	jnle 	out 
	
	pushl	$msgP3
	call	puts
	addl	$4, %esp 

out: 
	pushl	$msgP4
	call	puts
	addl	$4, %esp 

	pushl	$0 
	call	exit 
/*------------------------------------*/

/*FILE NAME :  if_else_1_gcc.S */
	.file	"if_else_1.c"
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align 4
.LC0:
	.string	"This is a start of the program"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Enter n1:"
.LC2:
	.string	"%d"
.LC3:
	.string	"Enter n2:"
.LC4:
	.string	"sum = %d\n"
	.section	.rodata.str1.4
	.align 4
.LC5:
	.string	"This is the end of the program"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB6:
	.section	.text.startup,"ax",@progbits
.LHOTB6:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB38:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x78,0x6
	.cfi_escape 0x10,0x3,0x2,0x75,0x7c
	subl	$12, %esp
	pushl	$.LC0
	call	puts
	popl	%eax
	popl	%edx
	pushl	$.LC1
	pushl	$1
	call	__printf_chk
	popl	%ecx
	popl	%ebx
	pushl	$n1
	pushl	$.LC2
	call	__isoc99_scanf
	popl	%eax
	popl	%edx
	pushl	$.LC3
	pushl	$1
	call	__printf_chk
	popl	%ecx
	popl	%ebx
	pushl	$n2
	pushl	$.LC2
	call	__isoc99_scanf
	movl	n1, %ecx
	movl	n2, %edx
	addl	$12, %esp
	movl	%ecx, %ebx
	leal	(%ecx,%edx), %eax
	subl	%edx, %ebx
	cmpl	%edx, %ecx
	cmovg	%ebx, %eax
	pushl	%eax
	pushl	$.LC4
	pushl	$1
	movl	%eax, sum
	call	__printf_chk
	movl	$.LC5, (%esp)
	call	puts
	movl	$0, (%esp)
	call	exit
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE6:
	.section	.text.startup
.LHOTE6:
	.comm	sum,4,4
	.comm	n2,4,4
	.comm	n1,4,4
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.12) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
/*------------------------------------*/

/*FILE NAME :  if_else_1.S */
# Anonymous strings 
.section .rodata	
	msgP1:
	.string	"This is the start of the program" 

	msgP2:
	.string	"Enter n1:" 

	msgP3:
	.string	"Enter n2:" 

	msgP4:
	.string	"sum = %d\n" 

	msgP5:
	.string	"This is the end of the program" 

	msgS1:
	.string	"%d" 

.section .bss	
	.comm	n1, 4, 4
	.comm	n2, 4, 4
	.comm	sum, 4, 4 

.section .text 
.globl	main
main: 
	# Prologue 
	pushl	%ebp
	movl	%esp, %ebp 

# puts("This is a start of the program"); 
	pushl	$msgP1
	call	puts
	addl	$4, %esp 

# printf("Enter n1:"); 
	pushl	$msgP2
	call	printf
	addl	$4, %esp 

# scanf("%d", &n1); 
	pushl	$n1 
	pushl	$msgS1
	call	scanf 
	addl	$8, %esp 

# printf("Enter n2:"); 
	pushl	$msgP3
	call	printf
	addl	$4, %esp 

# scanf("%d", &n2); 
	pushl	$n2 
	pushl	$msgS1
	call	scanf 
	addl	$8, %esp 

# if-else 
	movl	n1, %eax
	movl	n2, %edx 
	cmpl	%edx, %eax
   	jng 	else_block 

# if block - sum = n1 - n2;
	
	movl	n1, %eax
	movl	n2, %edx 
	subl	%edx, %eax
	movl	%eax, sum 

	jmp		end_of_else 
else_block: 	

# else block - sum = n1 + n2; 
	movl	n1, %eax
	movl	n2, %edx
	addl	%edx, %eax
	movl	%eax, sum 

end_of_else: 
	
#printf("sum = %d\n", sum); 
	pushl	sum 
	pushl	$msgP4
	call	printf
	addl	$8, %esp 

# puts("end of program"); 
	pushl	$msgP5
	call	puts
	addl	$4, %esp 

# exit(0) 
	pushl	$0 
	call	exit 

/*------------------------------------*/

/*FILE NAME :  if_else_2.S */
.section .rodata
	msgP1:
	.string	"True" 

	msgP2:
	.string	"False" 

.section .data 
	a:
	.int	100 

	b:
	.int	50 

	c:
	.int	20 

	d:
	.int	80 

.section .text
.global	main 
main: 
# Prologue 
	pushl	%ebp 
	movl	%esp, %ebp 
	
	movl	a, %eax
	movl	b, %edx 
	cmpl	%edx, %eax 
	jng		else_block 
	
	movl	c, %eax
	movl	d, %edx
	cmpl	%edx, %eax
	jnl		else_block 

# if block 
	pushl	$msgP1
	call	puts
	addl	$4, %esp 

	jmp		end_of_else

else_block: 
	
# else block 
	pushl	$msgP2
	call	puts
	addl	$4, %esp 

end_of_else: 
# exit(0) 
	pushl	$0 
	call	exit 	

/*------------------------------------*/

/*FILE NAME :  if_else_3.S */
.section .rodata
	msgP1:
	.string	"Enter a:" 

	msgP2:
	.string	"Enter b:" 

	msgP3:
	.string	"Enter c:" 

	msgP4:
	.string	"Enter d:" 
	
	msgP5:
	.string	"True" 

	msgP6:
	.string	"False" 

	msgS1:
	.string	"%d" 

	msgS2:
	.string	"%u" 

.section .bss
	.comm	a, 4, 4 
	.comm	b, 4, 4
	.comm	c, 4, 4 
	.comm	d, 4, 4 

.section .text
.global	main 
main: 
# PROLOGUE 
	pushl	%ebp 
	movl	%esp, %ebp 

# printf / scanf a 
	pushl	$msgP1
	call	printf
	addl	$4, %esp 

	pushl	$a 
	pushl	$msgS1
	call	scanf 
	addl	$8, %esp 

# printf/scanf b 
	pushl	$msgP2 
	call	printf
	addl	$4, %esp 

	pushl	$b 
	pushl	$msgS1
	call	scanf 
	addl	$8, %esp 

# printf/scanf c 
	pushl	$msgP3
	call	printf
	addl	$4, %esp 

	pushl	$c 
	pushl	$msgS2
	call	scanf
	addl	$8, %eso 

# printf / scanf d 
	pushl	$msgP4
	call	printf
	addl	$4, %esp 

	pushl	$d
	pushl	$msgS2 
	call	scanf 
	addl	$8, %esp 

# a > b || c < d 
	movl	a, %eax
	movl	b, %edx 
	cmpl	%edx, %eax 
	jg 		if_block 
	
	movl	c, %eax
	movl	d, %edx
	cmpl	%edx, %eax
	jnb		else_block 

if_block: 

# puts("True"); 
	pushl	$msgp5
	call	puts
	addl	$4, %esp 

	jmp		end_of_else 

else_block: 
# puts("False"); 
	pushl	$msgP6 
	call	puts	
	addl	$4, %esp 

end_of_else: 
# exit(0) 
	pushl	$0 
	call	exit 

/*------------------------------------*/

/*FILE NAME :  if_else_if_else.S */
.section .rodata
	msgP1:
	.string	"Enter a:" 

	msgP2:
	.string	"Enter b:" 

	msgP3:
	.string	"Enter c:" 

	msgP4:
	.string	"Enter d:"

	msgP5:
	.string	"Enter e:" 

	msgP6:
	.string	"Enter f:" 

	msgP7: 
	.string	"if block is executed" 

	msgP8:
	.string	"else if 1 block is executed" 

	msgP9: 
	.string	"else if 2 block is executed" 

	msgP10:
	.string	"All conditions have been false" 

	msgS1:
	.string	"%d" 

.section .bss
	.comm	a, 4, 4 
	.comm	b, 4, 4 
	.comm	c, 4, 4 
	.comm	d, 4, 4 
	.comm	e, 4, 4 
	.comm	f, 4, 4 

.section .text
.global	main 
main: 
	# PROLOGUE 
	pushl	%ebp 
	movl	%esp, %ebp 

# printf / scanf a 
	pushl	$msgP1
	call	printf
	addl	$4, %esp 

	pushl	$a
	pushl	$msgS1
	call	scanf 
	addl	$8, %esp 

# printf / scanf b 
	pushl	$msgP2
	call	printf
	addl	$4, %esp 

	pushl	$b 
	pushl	$msgS1
	call	scanf 
	addl	$8, %esp 

# printf / scanf c 
	pushl	$msgP3
	call	printf
	addl	$4, %esp 

	pushl	$c 
	pushl	$msgS1
	call	scanf 
	addl	$8, %esp 

# printf / scanf d 
	pushl	$msgP4
	call	printf
	addl	$4, %esp 

	pushl	$d 
	pushl	$msgS1
	call	scanf 
	addl	$8, %esp 

# printf / scanf e 
	pushl	$msgP5
	call	printf
	addl	$4, %esp 

	pushl	$e 
	pushl	$msgS1
	call	scanf 
	addl	$8, %esp 

# printf / scanf f 
	pushl	$msgP6 
	call	printf
	addl	$4, %esp 

	pushl	$f 
	pushl	$msgS1 
	call	scanf 
	addl	$8, %esp 

	movl	a, %eax
	movl	b, %edx 
	cmpl	%edx, %eax 
	jle		if_block 

	movl	c, %eax
	movl	d, %edx 
	cmpl	%edx, %eax 
	jge		else_if_1_block 

	movl	e,	%eax
	movl	f, %edx
	cmpl	%edx, %eax
	je		else_if_2_block 

	jmp		else_block 

if_block: 
	pushl	$msgP7
	call	puts
	addl	$4, %esp 
	jmp		if_else_if_else_out 
else_if_1_block: 
	pushl	$msgP8
	call	puts
	addl	$4, %esp 
	jmp		if_else_if_else_out
else_if_2_block: 
	pushl	$msgP9 
	call	puts 
	addl	$4, %esp 
	jmp		if_else_if_else_out
else_block: 
	pushl	$msgP10
	call	puts
	addl	$4, %esp 
if_else_if_else_out: 
# exit(0) 
	pushl	$0
	call	exit 

/*------------------------------------*/

/*FILE NAME :  if_practice.S */
# int n1 = 20; 
# int n2 = 30; 
# int main(){
# 	if(n1 <= n2)
# 		puts("Yes"); 
# 	puts("End of program"); 
#} 

.section .rodata
	msg_p1:
	.string	"Yes" 

	msg_p2:
	.string	"End of program" 

.section .data
	n1:
	.int 	20 

	n2:
	.int 	30 

.section .text
.globl	main
.type	main, @function 
main: 
# Prologue 	
	pushl	%ebp 
	movl	%esp, %ebp 

	movl	n1, %eax # eax <- n1 
	movl	n2, %edx # edx <- n2 
	cmpl	%edx, %eax 
	jnle	mn_out 

	pushl	$msg_p1
	call	puts
	addl	$4, %esp 

mn_out: 
	pushl	$msg_p2 
	call	puts
	addl	$4, %esp 

	pushl	$0 
	call	exit 

/*------------------------------------*/

/*FILE NAME :  loop_1.S */
.section .rodata
	msg_p1:
	.string	"i = %d j = %d\n" 

.section .bss
	.comm	i, 4, 4 
	.comm	j, 4, 4 

.section .text
.globl	main

main: 
	pushl	%ebp 
	movl	%esp, %ebp 
	
# i = 0; j = 1; 
	movl	$0, i 
	movl	$1, j 
	
	jmp		mn_while_cond 
mn_while_body: 
	pushl	j 
	pushl	i 
	pushl	$msg_p1 
	call	printf
	addl	$12, %esp 

	addl	$1, i 
	addl	$3, j 

mn_while_cond: 
	movl	i, %eax
	cmpl	$10, %eax
	jnl 	mn_while_out 
	movl	j, %eax
	cmpl	$21, %eax
	jl		mn_while_body 

mn_while_out: 
	pushl	$0 
	call	exit 
/*------------------------------------*/

/*FILE NAME :  loop_2.S */
.section .rodata
	msg_p1:
	.string	"i = %d j = %d\n" 

.section .bss
	.comm	i, 4, 4 
	.comm	j, 4, 4 

.section .text
.globl	main

main: 
	pushl	%ebp 
	movl	%esp, %ebp 
	
# i = 0; j = 1; 
	movl	$0, i 
	movl	$1, j 
	
	jmp		mn_while_cond 
mn_while_body: 
	pushl	j 
	pushl	i 
	pushl	$msg_p1 
	call	printf
	addl	$12, %esp 

	addl	$1, i 
	addl	$3, j 

mn_while_cond: 
	movl	i, %eax
	cmpl	$10, %eax
	jl		mn_while_body 

	movl	j, %eax
	cmpl	$21, %eax
	jl		mn_while_body 

mn_while_out: 
	pushl	$0 
	call	exit 
/*------------------------------------*/

/*FILE NAME :  loop_practice.S */
.section .rodata
	msg_p1:
	.string	"i = %d\n" 

.section .bss
	.comm	i, 4, 4 

.section .text
.globl	main

main: 

	pushl	%ebp 
	movl	%esp, %ebp 

	movl	$0, i
	jmp		mn_cond1
mn_for: 
	pushl	i	
	pushl	$msg_p1
	call	printf
	addl	$8, %esp 

	addl	$1, i 
mn_cond1: 
	movl	i, %eax
	cmpl	$10, %eax
	jl		mn_for

	pushl	$0 
	call	exit 
/*------------------------------------*/

/*FILE NAME :  loop_text_practice.S */
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



/*------------------------------------*/

/*FILE NAME :  nested_loops.S */
	.file	"nested_loops.c"
	.comm	i,4,4
	.comm	j,4,4
	.section	.rodata
.LC0:
	.string	"i = %d j = %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	subl	$4, %esp

	movl	$0, i
	jmp	.L2
.L5:
	movl	$0, j
	jmp	.L3
.L4:
	movl	j, %edx
	movl	i, %eax
	subl	$4, %esp
	pushl	%edx
	pushl	%eax
	pushl	$.LC0
	call	printf
	addl	$16, %esp
	movl	j, %eax
	addl	$1, %eax
	movl	%eax, j
.L3:
	movl	j, %eax
	cmpl	$5, %eax
	jle	.L4
	movl	i, %eax
	addl	$1, %eax
	movl	%eax, i
.L2:
	movl	i, %eax
	cmpl	$4, %eax
	jle	.L5
	subl	$12, %esp
	pushl	$0
	call	exit
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.12) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
/*------------------------------------*/

/*FILE NAME :  pracrice_if_else_if_else.S */
.section .rodata
	msg_p1:
	.string	"Enter n:" 	

	msg_p2:
	.string	"positive" 

	msg_p3:
	.string	"negative" 

	msg_p4:
	.string	"zero" 

	msg_s:
	.string	"%d" 

.section .bss
	.comm	n, 4, ,4 

.section .text 
.globl	main
main: 
	pushl	%ebp 
	movl	%esp, %ebp 
	
	pushl	$msg_p1
	call	printf
	addl	$4, %esp 

	pushl	$n 
	pushl	$msg_s
	call	scanf 
	addl	$8, %esp 

	movl	n, %eax

	cmpl	$0, %eax
	jg		mn_positive
	jl		mn_negative
	jmp		mn_zero 

mn_positive: 
	pushl	$msg_p2
	call	puts
	addl	$4, %esp 
	jmp		mn_out 

mn_negative: 
	pushl	$msg_p3
	call	puts
	addl	$4, %esp 
	jmp		mn_out 

mn_zero: 
	pushl	$msg_p4
	call	puts
	addl	$4, %esp 

mn_out: 
	pushl	$0
	call	exit 

/*------------------------------------*/

/*FILE NAME :  practice_if_else.S */
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

/*------------------------------------*/

/*FILE NAME :  ternary_op.S */
.section .rodata
	msg_p1:
	.string	"Enter n:" 

	msg_p2:
	.string	"rs = %d\n" 
	
	msg_s1:
	.string	"%d" 

.section .bss
	.comm	n, 4, 4 
	.comm	rs, 4, 4 
.section .text
.globl	main
main: 
	pushl	%ebp
	movl	%esp, %ebp 
	
	pushl	$msg_p1
	call	printf
	addl	$4, %esp 
	
	pushl	$n
	pushl	$msg_s1
	call	scanf 
	addl	$8, %esp 

	movl	n, %eax
	cmpl	$0, %eax
	jl		mn_else
	
	movl	n, %eax
	addl	$5, %eax
	jmp		mn_out 

mn_else:
	movl	n, %eax
	negl	%eax
	addl	$5, %eax
mn_out: 
	movl	%eax, rs 
	
	pushl	rs
	pushl	$msg_p2
	call	printf
	addl	$8, %esp 
	
	pushl	$0 
	call	exit 

/*------------------------------------*/

/*FILE NAME :  test.S */
.section .rodata
	msg_p1:
	.string	"i = %d j = %d\n" 

.section .bss	
	.comm	i, 4, 4 
	.comm	j, 4, 4 

.section .text
.globl	main

main: 
	pushl	%ebp 
	movl	%esp, %ebp 

	movl	$0, i 
	jmp		mn_cond1 
mn_for1: 
	movl	$0, j 
	jmp		mn_cond2
mn_for2: 
	movl	i, %eax
	movl	j, %edx 
	addl	%edx, %eax 
	cmpl	$15, %eax
	jnl		mn_incr
	
	pushl	j 
	pushl	i 
	pushl	$msg_p1 
	call	printf
	addl	$12, %esp 

mn_incr: 
	addl	$1, j 
mn_cond2: 
	movl	j, %eax
	cmpl	$10, %eax
	jl		mn_for2 

	addl	$1, i 
mn_cond1: 
	movl	i, %eax
	cmpl	$10, %eax
	jl		mn_for1

	pushl	$0 
	call	exit 
/*------------------------------------*/

/*FILE NAME :  while_1.S */
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
/*------------------------------------*/
