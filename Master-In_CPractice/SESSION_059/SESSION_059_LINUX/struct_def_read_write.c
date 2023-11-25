#include <stdio.h> 
#include <stdlib.h> 


struct A
{
	int a; 
	short b; 
	int c; 
}; 

struct A inA; 

int main(void)
{
	inA.a = 100; 
	inA.b = 200; 
	inA.c = 300; 

	printf("inA.a=%d inA.b=%hd inA.c = %d\n", inA.a, inA.b, inA.c); 

	exit(0); 
}
