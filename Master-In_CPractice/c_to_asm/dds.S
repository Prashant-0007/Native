# This assembly program is conversion of 
# dds.c 

# Rule 1 : Global initialized variables in C = data section in assembly 
# Rule 2 : Global uninitialized variables in C = bss section in assembly. 

# global variables c, s, n, m in dds.c will go to data section as per Rule 1 
# global variables c1, s1, n1, m1 in dds.c will go to bss section as per Rule 2 

# Create data section 
.section .data
	c: 
	.ascii	"A"			# char -> .ascii -> allocate 1 byte 

	s:
	.value	10 			# short -> .value -> allocate 2 bytes 

	n: 
	.int	10000		# int -> .int -> allocate 4 bytes 

	m:
	.long	0x10203040 	# long -> .long -> allocate 4 bytes 

# Create bss section 
.section .bss
	.comm	c1, 1, 4 
	.comm	s1, 2, 4 
	.comm	n1, 4, 4 
	.comm	m1, 4, 4 	


