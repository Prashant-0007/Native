#include <stdio.h> 
#include <stdlib.h> 

int choice; 
int should_continue; 

int main(){
	do{
		printf("[1]Insert[2]Delete[3]Search:"); 
		scanf("%d", &choice); 
		switch(choice){
			case 1: 
					puts("Insert was selected"); 
					break; 
			case 2: 
					puts("Delete was selected"); 
					break; 

			case 3: 
					puts("Search was selected"); 
					break; 

			default: 
					puts("Wrong choice"); 
		}

		printf("Do you want to continue?Yes-[1], No[0]:"); 
		scanf("%d", &should_continue); 
		if(should_continue != 1 && should_continue != 0) 
			should_continue = 0; 
	}while(should_continue == 1); 
	exit(0); 
}
