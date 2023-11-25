# The purpose of this program is to convert operator_demo.c in 
# operator_demo.S 

# Create data section 
.section .data 
# int n1 = 10; 
	n1:
	.int	10 

# int n2 = 3; 
	n2:
	.int	3 

# Create BSS section 
.section .bss
# int rs; 
	.comm	rs, 4, 4 

# Create text section 
.section .text 

# int main() { } 
# .global variable_name -> Declares variable name as global 
.global	main 	# Declare main as global variable 
main: 
	# Instructions 			
	


