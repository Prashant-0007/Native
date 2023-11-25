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


