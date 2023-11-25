#include <stdio.h> 
#include <stdlib.h> 

/* 00001111 00001111 00001111 00001111 
 * B4 		B3 		 B2 	  B1 
 * */ 
unsigned int n1 = 0x0f0f0f0f; 
/* 11110000 11110000 11110000 11110000 
 * B4 	    B3 		 B2 	 B1 
 * */ 
unsigned int n2 = 0xf0f0f0f0; 

unsigned int rs; 

int main()
{
	/* bitwise NOT (~) 
	 * [1] Unary(needs one operand) [2] Prefix(operator first operand later  
	 * */ 
	rs = ~n1; 
	printf("rs = %x\n", rs); 

	/* bitwise AND (&) 
	 * [1] binary [2] infix 
	 * */ 
	rs = n1 & n2; 
	printf("rs = %x\n", rs); 

	/* bitwise OR (|)
	 * [1] binary [2] infix 
	 * */ 
	rs = n1 | n2; 
	printf("rs = %x\n", rs); 

	/* bitwise XOR(^) 
	 * [1] binary [2] infix 
	 * */ 
	rs = n1 ^ n2; 
	printf("rs = %x\n", rs); 

	exit(0); 
} 

