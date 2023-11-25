#include <stdio.h> 
#include <stdlib.h> 

int i, j, k; 
int flag1 = 0; 

int main(){
	for(i = 0; i < 10; i++)
	{
		for(j = 0; j < 10; j++)
		{
			for(k = 0; k < 10; k++)
			{
				if(i + j + k > 20)
				{
					flag1 = 1; 
					break; 
				} 
				printf("i = %d j = %d k = %d\n", 
						i, j, k); 
			}
			
			if(flag1 == 1)
			{
				break; 
			}

		}

		if(flag1 == 1)
		{
			break; 
		}
	}
	
	puts("end of program"); 
	exit(0); 
}
