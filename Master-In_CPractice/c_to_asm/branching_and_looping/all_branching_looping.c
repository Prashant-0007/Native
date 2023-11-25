
/*FILE NAME :  break_continue_nested.c */
int i; 
int n; 
int main(){
	for(i = 0; i < 100; ++i){
		n = rand(); 
		if(n % 7 == 0)
			break; 
		printf("random number = %d\n", n); 
	}
	puts("end of program"); 
	exit(0); 
}
/*************************************/ 
int i; 
int main(){
	for(i = 0; i < 50; ++i){
		if(i % 7 == 0)
			continue; 
		printf("i = %d\n", i); 
	}
	puts("End of program"); 
}
/************************************/
/*
n = rand() 

	# n = rand() 
	call	rand 
	movl	%eax, n 
*/ 


/*------------------------------------*/

/*FILE NAME :  do_while.c */
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
/*------------------------------------*/

/*FILE NAME :  for_1.c */
#include <stdio.h> 
#include <stdlib.h> 

int i; 

int main(){
	for(i = 0; i < 5; ++i)
		puts("Hello, for loop"); 

	exit(0); 
}
/*------------------------------------*/

/*FILE NAME :  goto_demo.c */
#include <stdio.h> 
#include <stdlib.h> 

int i, j, k; 

int main(){
	for(i = 0; i < 10; i++)
	{
		for(j = 0; j < 10; j++)
		{
			for(k = 0; k < 10; k++)
			{
				if(i + j + k > 20) 
					goto out; 
				printf("i:%d j:%d k:%d\n", i, j, k); 
			}
		}
	}
out:
	puts("end of program"); 
	exit(0); 
}
/*------------------------------------*/

/*FILE NAME :  goto_requirement.c */
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
/*------------------------------------*/

/*FILE NAME :  if_1.c */
#include <stdio.h> 
#include <stdlib.h> 

int n1 = 10; 
int n2 = 5; 

int main(){
	puts("U:This is a start of the program"); 
	
	if(n1 > n2){
		puts("C:This will be printed if n1 is greater than n2"); 
	}

	puts("U:This is a last statement of program"); 
	exit(0); 
}
/*------------------------------------*/

/*FILE NAME :  if_2.c */
#include <stdio.h> 
#include <stdlib.h> 

int n1; 
int n2; 

int main(){
	printf("U:Enter n1:"); 
	scanf("%d", &n1); 

	printf("U:Enter n2:"); 
	scanf("%d", &n2); 

	if(n1 <= n2)
		puts("C:n1 is less than or equal to n2"); 

	puts("U:End of program"); 
	exit(0); 
}
/*------------------------------------*/

/*FILE NAME :  if_else_1.c */
#include <stdio.h> 
#include <stdlib.h> 

int n1, n2; 
int sum; 

int main(){
	puts("This is a start of the program"); 
	
	printf("Enter n1:"); 
	scanf("%d", &n1); 

	printf("Enter n2:"); 
	scanf("%d", &n2); 

	if(n1 > n2){
		sum = n1 - n2; 
	}else{
		sum = n1 + n2; 
	}

	printf("sum = %d\n", sum); 
	puts("This is the end of the program"); 
	exit(0); 
}
/*------------------------------------*/

/*FILE NAME :  if_else_2.c */
#include <stdio.h> 
#include <stdlib.h> 

int a = 100; 
int b = 50; 
int c = 20; 
int d = 80; 

int main(){
	
	if(a > b && c < d){
		puts("True"); 
	}else{
		puts("False"); 
	}
	
	exit(0); 

}
/*------------------------------------*/

/*FILE NAME :  if_else_3.c */
#include <stdio.h> 
#include <stdlib.h> 

int a, b; 
unsigned int c, d; 

int main(){

	printf("Enter a:");
	scanf("%d", &a); 

	printf("Enter b:"); 
	scanf("%d", &b); 

	printf("Enter c:"); 
	scanf("%u", &c); 

	printf("Enter d:"); 
	scanf("%u", &d); 

	if(a > b || c < d){
		puts("True"); 
	}else{
		puts("False"); 
	}

	exit(0); 
}
/*------------------------------------*/

/*FILE NAME :  if_else_if_else.c */
#include <stdio.h> 
#include <stdlib.h> 

int a, c, d, e, f; 

int main(){
	printf("Enter a:"); 
	scanf("%d", &a); 

	printf("Enter b:"); 
	scanf("%d", &b); 

	printf("Enter c:"); 
	scanf("%d", &c); 

	printf("Enter d:"); 
	scanf("%d", &d); 

	printf("Enter e:"); 
	scanf("%d", &e); 
	
	printf("Enter b:"); 
	scanf("%d", &f);

	if(a <= b){
		puts("if block is executed"); 
	}else if(c >= d){
		puts("else if 1 block is executed"); 
	}else if(e == f){
		puts("else if 2 block is executed") 
	}else{
		puts("all conditions are false"); 
	}

	exit(0); 
}
/*------------------------------------*/

/*FILE NAME :  loop_1.c */
#include <stdio.h> 
#include <stdlib.h> 

int i, j; 

int main(){

	i = 0; 
	j = 1;

	while(i < 10 && j < 21){
		printf("i = %d j = %d\n", i, j); 
		i = i + 1; 
		j = j + 3; 
	}

	exit(0); 

}
/*------------------------------------*/

/*FILE NAME :  loop_2.c */
#include <stdio.h> 
#include <stdlib.h> 

int i, j; 

int main(){

	i = 0; 
	j = 1;

	while(i < 10 || j < 21){
		printf("i = %d j = %d\n", i, j); 
		i = i + 1; 
		j = j + 3; 
	}

	exit(0); 

}
/*------------------------------------*/

/*FILE NAME :  my_loop_exercise.c */
int i, j; 
int main(){	

	for(i = 0; i < 10; i++)
	{
		for(j = 0; j < 10; j++)
		{
			if(i + j < 15)
				printf("i = %d j = %d\n", 
						i, j); 
		}
	}
	
	exit(0); 
}	
/*------------------------------------*/

/*FILE NAME :  nested_loops.c */
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
/*------------------------------------*/

/*FILE NAME :  ternary_operator.c */
#include <stdio.h> 
#include <stdlib.h> 

int n; 
int rs; 

int main(){
	printf("Enter n:"); 
	scanf("%d", &n); 
	
	/* 
	if(n >= 0) 
		rs = n + 5; 
	else
		rs = -n + 5; 
	*/ 
	rs = (n >= 0 ? (n+5) : (-n+5));

	printf("rs = %d\n", rs); 
	exit(0); 	
}

/*
if(cond) 
	RHS 
else 
	RHS 


	if(n >= 0)
		n = n; 
	else 
		n = -n; 

	int tmp; 
	if(n >= 0) 
		tmp = n; 
	else; 
		tmp = -n; 

	rs = tmp + MATI 
lhs = (cond ? (rhs1) : (rhs2)) 

lhs = COMMON_MATI((cond ? (rhs1) : (rhs2)))

*/ 
/*------------------------------------*/

/*FILE NAME :  while_1.c */
#include <stdio.h> 
#include <stdlib.h> 

int i; 

int main(){
	i = 0; 
	while(i < 5){
		puts("Hello"); 
		i = i + 1; 
	}
	exit(0); 
}

/*------------------------------------*/
