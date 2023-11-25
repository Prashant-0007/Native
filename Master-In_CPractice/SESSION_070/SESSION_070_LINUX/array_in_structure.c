#include <stdio.h> 
#include <stdlib.h> 

struct X
{
	int sum; 
	int arr[10]; 
} inX = { 0, 
	  	{10, 20, 30, 40, 50, 60, 70, 80, 90, 100} }; 

int i; 

int main(void) 
{
	for(i = 0; i < 10; ++i) 
		inX.sum += inX.arr[i]; 

	exit(0); 
}

/* 
movl	$4, %ebx 	# Why 4? Because offset of arr in struct X is 4 
movl	i, %eax 
		inX(%ebx, %eax, 4) = inX.arr[i];  
*/ 
