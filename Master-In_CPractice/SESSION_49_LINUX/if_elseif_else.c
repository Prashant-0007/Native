#include <stdio.h> 
#include <stdlib.h> 

int i; 

int main(void) 
{
	printf("Enter i:"); 
	scanf("%d", &i); 

	if(i == 0)
	{
		puts("i is 0"); 
	}
	else if(i == 1)
	{
		puts("i is 1"); 
	}
	else if(i == 2)
	{
		puts("i is 2"); 
	}
	else
	{
		puts("Invalid input"); 
	}

	exit(0); 
}
