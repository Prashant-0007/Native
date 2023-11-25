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
