#include <stdio.h> 

int n1 = 0; 
int n2 = 1; 
int n3 = 100; 
int n4 = -100; 
int m1 = 0x0; 
int m2 = 0x1; 
int m3 = 0x01010101; 
int rs; 

int main()
{
	rs = !n1; 
	printf("rs = %d\n", rs);
	
	rs = !n2; 
	printf("rs = %d\n", rs); 

	rs = !n3; 
	printf("rs = %d\n", rs); 

	rs = !n4; 
	printf("rs = %d\n", rs); 
	
	rs = ~m1; 
	printf("rs = %x\n", rs); 

	rs = ~m2; 
	printf("rs = %x\n", rs); 

	rs = ~m3; 
	printf("rs = %x\n", rs); 

	return (0); 
}
