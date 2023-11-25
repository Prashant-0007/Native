#include <stdio.h> 
#include <stdlib.h> 

unsigned char b1 = 0x0a; 

int main()
{
	/* left shift operator */ 
	printf("b1 = %hhd\n", b1); 
	b1 = b1 << 1; 
	printf("b1 = %hhd\n", b1); 
	b1 = b1 << 2; 
	printf("b1 = %hhd\n", b1); 
	/* right shift operator */ 
	b1 = 0x18; 
	printf("b1 = %hhd\n", b1); 
	b1 = b1 >> 1; 
	printf("b1 = %hhd\n", b1); 
	b1 = b1 >> 2; 
	printf("b1 = %hhd\n", b1); 
	exit(0); 

	exit(0); 
}
