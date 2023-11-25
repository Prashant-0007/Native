#include <stdio.h> 
#include <stdlib.h> 

int i; 

int main(void) 
{
	printf("Enter i:"); 
	scanf("%d", &i); 

	switch(i)
	{
		case 100: 
				puts("i is 0"); 
				break; 
		case 2: 
				puts("i is 1"); 
				break; 
		case -3: 
				puts("i is 2");
				break; 
		case 56: 
				puts("i is 3"); 
				break; 
 
		case 127: 
				puts("i is 4"); 
				break; 
		case 2004: 
				puts("i is 5"); 
				break; 
		case -30: 
				puts("i is 6");
				break; 
 
		default: 
				puts("Invalid input"); 
	}

	exit(0); 
}
