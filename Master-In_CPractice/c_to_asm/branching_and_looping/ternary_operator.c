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
