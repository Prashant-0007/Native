#include <stdio.h> 
#include <stdlib.h> 

int n = 0xa; 

int main()
{
	printf("n = %d\n", n); 
	n = (n << 1);
	printf("n = %d\n", n); 
	n = (n << 2);
	printf("n = %d\n", n); 

	n = 0x18; 	// 0x18 = 24 
	printf("n = %d\n", n); 
	n = (n >> 1); 
	printf("n = %d\n", n); 
	n = (n >> 2); 
	printf("n = %d\n", n); 

	exit(0); 
}
