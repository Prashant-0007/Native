#include "DateClient.h" 

int main(void)
{
    int iDate1, iDate2; 

    InitDateLib(); 

    iDate1 = CreateDate(10, 2, 2021); 
    iDate2 = CreateDate(2, 3, 1999); 

    ShowDate(iDate1); 

    SetDay(iDate1, 12); 
    SetMonth(iDate1, 5); 
    SetYear(iDate1, 2020);  

    ShowDate(iDate1);

    ReleaseDate(iDate1); 
    ReleaseDate(iDate2); 

    ReleaseDateLib(); 

    return (0); 
}
