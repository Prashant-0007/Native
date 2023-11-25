#include <stdio.h> 
#include <stdlib.h> 

int i, j; 

int main(){
	i = 0; 
	while(i < 5){
		j = 0; 
		while(j < 6){
			printf("i = %d j = %d\n", 
					i, j); 
			j = j + 1; 
		}
		i = i + 1; 
	}
	exit(0); 
}
/*******************************/ 
/* 
int i, j; 

int main(){
	for(i = 0; i < 5; ++i)
		for(j = 0; j < 6; ++j)
				printf("i = %d j = %d\n", i, j); 

	exit(0); 
}
*/ 
