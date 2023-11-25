The result of two 32 bit integers can easily go beyond 2 ^ 32 
Therefore, we cannot store the multiplication result in 32 bit 
destination operand as we do in add and sub instructions. 

So how do we define mul instruction?? 

mul instruction takes only one operand. 

mul 	reg-operand

Let's say we are multiplying 4 byte numbers. 

mull	%reg-32 	# eax, ebx, ecx, edx, esi, edi 

mull	%ebx 		# ebx * ? 

# mull instruction has INVISIBLE operand eax. 
# In technical language INVISIBLE OPERAND is called as IMPLICIT OPERAND. 

eax * reg-32 result is given in two registers. Why? 
Because result is potentially 64 bit long. 

LOWER 32 bits of the result are placed in eax 
UPPER 32 bits of the result are placed in edx 



