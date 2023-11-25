
/*FILE NAME :  addition_of_two_numbers.c */
#include <stdio.h> 
#include <stdlib.h> 

int n1 = 10; 
int n2 = 20; 
int rs; 

int main()
{
	rs = n1 + n2; 
	printf("rs = %d\n", rs); 
	exit(0); 
}
/*------------------------------------*/

/*FILE NAME :  all_c.c */
/*------------------------------------*/

/*FILE NAME :  bitwise_operators.c */
#include <stdio.h> 
#include <stdlib.h> 

/* 00001111 00001111 00001111 00001111 
 * B4 		B3 		 B2 	  B1 
 * */ 
unsigned int n1 = 0x0f0f0f0f; 
/* 11110000 11110000 11110000 11110000 
 * B4 	    B3 		 B2 	 B1 
 * */ 
unsigned int n2 = 0xf0f0f0f0; 

unsigned int rs; 

int main()
{
	/* bitwise NOT (~) 
	 * [1] Unary(needs one operand) [2] Prefix(operator first operand later  
	 * */ 
	rs = ~n1; 
	printf("rs = %x\n", rs); 

	/* bitwise AND (&) 
	 * [1] binary [2] infix 
	 * */ 
	rs = n1 & n2; 
	printf("rs = %x\n", rs); 

	/* bitwise OR (|)
	 * [1] binary [2] infix 
	 * */ 
	rs = n1 | n2; 
	printf("rs = %x\n", rs); 

	/* bitwise XOR(^) 
	 * [1] binary [2] infix 
	 * */ 
	rs = n1 ^ n2; 
	printf("rs = %x\n", rs); 

	exit(0); 
} 

/*------------------------------------*/

/*FILE NAME :  dds.c */
/* different data definition statements: 
 * exercise program for conversion in assembly
 */ 


/* global initialized data definition statements */ 
char c = 'A'; 
short s = 100; 
int n = 10000; 
long m = 0x10203040; 

/* global uninitialized data definition statements */ 
char c1; 
short s1; 
int n1; 
long m1; 

int main()
{

}
/*------------------------------------*/

/*FILE NAME :  operator_demo.c */
#include <stdio.h> 
#include <stdlib.h>

int n1 = 10; 	/* global data definition statement - initialized */ 
int n2 = 3; 	/* global data definition statement - initialized */ 
int rs; 		/* Uninitialized global data definition statement */ 
double d_rs; 	/* Uninitialized global data definition statement */ 

int main (void) 
{
	printf ("[1]:Addition demo:\n"); 
	rs = n1 + n2; 
	printf ("rs:%d\n", rs); 

	printf ("[2]:Subtraction demo:\n"); 
	rs = n1 - n2; 
	printf ("rs:%d\n", rs); 

	printf ("[3]:Multiplication demo:\n"); 
	rs = n1 * n2; 
	printf ("rs:%d\n", rs); 

	printf ("[4]:Division demo:\n"); 
	rs = n1 / n2; 
	printf ("rs:%d\n", rs); 

	printf ("[5]:Remainder demo:\n"); 
	rs = n1 % n2; 
	printf ("rs:%d\n", rs); 

	printf ("[6]:Floating division demo:\n"); 
	d_rs = (float)n1/n2; 
	printf ("d_rs:%lf\n", d_rs); 

	printf ("[7]:pre-ncrement operator:\n"); 
	printf ("n1:Before pre-increment:%d\n", n1); 
	rs = ++n1; 
	printf ("rs:%d\n", rs); 

	printf ("[8]:post-increment operator:\n"); 
	printf ("n1:Before post increment:%d\n", n1); 
	rs = n1++; 
	printf ("rs:%d\n", rs); 
	printf ("n1:%d\n", n1); 

	printf ("[9]:Left shift operator:\n"); 
	n1 = 100; 
	printf ("n1:%d\n", n1); 
	rs = n1 << 2; 
	printf ("rs=(n1<<2):%d\n", rs); 
       	rs = n1 << 3; 
	printf ("rs=(n1<<3):%d\n", rs); 
	rs = n1 << 4; 
	printf ("rs=(n1<<4):%d\n", rs); 

	printf ("[10]:Right shift operator:\n"); 
	n1 = 100; 
	printf ("n1:%d\n", n1); 
	rs = n1 >> 2; 
	printf ("rs=(n1>>2):%d\n", rs); 
       	rs = n1 >> 3; 
	printf ("rs=(n1>>3):%d\n", rs); 
	rs = n1 >> 4; 
	printf ("rs=(n1>>4):%d\n", rs); 

	n1 = 0x10101010; 
	n2 = 0x01010101; 

	printf ("[11]:Biwise AND:\n"); 
	rs = n1 & n2; 
	printf ("rs:%x\n", rs); 

	printf ("[12]:Bitwise OR:\n"); 
	rs = n1 | n2; 
	printf ("rs:%x\n", rs); 

	printf ("[13]:Bitwise XOR:\n"); 
	rs = n1 ^ n2; 
	printf ("rs:%x\n", rs); 
	
	printf ("[14]:Bitwise NOT:\n"); 
	printf ("n1:%d\n", n1); 
	rs = ~n1; 
	printf ("rs:%d\n", rs);

	printf ("[15]:Comparison operator\n"); 
	n1 = 100; 
	n2 = 200; 
	rs = (n1 < n2); 
	printf ("%d < %d = %d\n", n1, n2, rs); 
	rs = (n1 <= n2); 
	printf ("%d <= %d = %d\n", n1, n2, rs); 
	rs = (n1 > n2); 
	printf ("%d > %d = %d\n", n1, n2, rs); 
	rs = (n1 >= n2); 
	printf ("%d >= %d = %d\n", n1, n2, rs); 
	rs = (n1 == n2); 
	printf ("%d == %d = %d\n", n1, n2, rs); 
	rs = (n1 != n2); 
	printf ("%d != %d = %d\n", n1, n2, rs); 

	exit (0); 
}
/*------------------------------------*/

/*FILE NAME :  operators.c */
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
/*------------------------------------*/

/*FILE NAME :  pre_post_increment_decrement.c */
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
/*------------------------------------*/

/*FILE NAME :  shift_operators.c */
#include <stdio.h> 
#include <stdlib.h> 

unsigned char b1 = 0x0a; 

int main()
{
	/* left shift operator */ 
	printf("b1 = %hhd\n", b1); 
	b1 = b1 << 1; 
	printf("b1 = %hhd\n", b1); 
	b1 = b1 << 2; 
	printf("b1 = %hhd\n", b1); 
	/* right shift operator */ 
	b1 = 0x18; 
	printf("b1 = %hhd\n", b1); 
	b1 = b1 >> 1; 
	printf("b1 = %hhd\n", b1); 
	b1 = b1 >> 2; 
	printf("b1 = %hhd\n", b1); 
	exit(0); 

	exit(0); 
}
/*------------------------------------*/

/*FILE NAME :  shift_operators_class.c */
#include <stdio.h> 
#include <stdlib.h> 

int n = 0xa; 

int main()
{
	printf("n = %d\n", n); 
	n = (n << 1);
	printf("n = %d\n", n); 
	n = (n << 2);
	printf("n = %d\n", n); 

	n = 0x18; 	// 0x18 = 24 
	printf("n = %d\n", n); 
	n = (n >> 1); 
	printf("n = %d\n", n); 
	n = (n >> 2); 
	printf("n = %d\n", n); 

	exit(0); 
}
/*------------------------------------*/

/*FILE NAME :  summation_of_two_numbers.c */
void exit(int); 

int num1; 
int num2; 
int num3; 

int main(){
	num1=100; 
	num2=200; 
	num3=num1+num2; 
	exit(0); 
}
/*------------------------------------*/

/*FILE NAME :  unsigned_multiplication_demo.c */
#include <stdio.h> 

unsigned int n1 = 50; 
unsigned int n2 = 8; 
unsigned int rs; 

int main()
{
	rs = n1 * n2; 
	printf("rs = %u\n", rs); 
	exit(0); 
}
/*------------------------------------*/
