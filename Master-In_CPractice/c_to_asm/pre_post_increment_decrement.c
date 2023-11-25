#include <stdio.h> 
#include <stdlib.h> 

int n = 10; 
int m; 

int main()
{
	/* pre increment */ 
	m = ++n; 
	printf("m = %d n = %d\n", m, n); /* m = 11, n = 11 */ 

	/* post increment */ 
	n = 10; 
	m = n++; 
	printf("m = %d n = %d\n", m, n); /* m = 10, n = 11 */ 

	/* pre decrement */ 
	n = 10; 
	m = --n; 
	printf("m = %d n = %d\n", m, n); /* m = 9, n = 9 */ 

	/* post decrement */ 
	n = 10; 
	m = n--; 
	printf("m = %d n = %d\n", m, n); /* m = 10, n = 9 */ 

	exit(0);
 } 	
