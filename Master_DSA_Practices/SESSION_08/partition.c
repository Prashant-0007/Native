#include <stdio.h> 
#include <stdlib.h> 

typedef long long ssize_t; 

/* 
    Precondition: 0 <= p < r < N 
    Postcondition: 
        Permute the elements of a[p...r]
        in such a way that 
        i) the element at a[r] at the beginning of 
            algorithm in shifted to index q (p <= q <= r) and 
        ii) a[p...q-1] <= a[q]
        iii) a[q+1...r] > a[q]
        iv) return q 
*/
int partition(int* a, int p, int r); 
void test_partition(void); 
void show(int* a, ssize_t start, ssize_t end, const char* msg); 

int main(void)
{
    test_partition(); 
    return (EXIT_SUCCESS); 
}

int partition(int* a, int p, int r)
{
    int pivot;  /* to store a[r] so that a[r] can be over-written */
    int j;      /* loop variable for travelling from p to r-1 */
    int i;      /* Elements from a[p...i] will be less than or equal 
                    to the pivot and elements from a[i+1...j-1 will be 
                    greater than the pivot] */
    int tmp;    /* temp variable for swapping */

    pivot = a[r]; 
    i = p - 1; 
    j = p; 
    
    while(j < r)
    {
        if(a[j] < pivot)
        {
            i = i + 1; 
            tmp = a[i]; 
            a[i] = a[j]; 
            a[j] = tmp; 
        }

        j = j + 1; 
    }

    tmp = a[i+1]; 
    a[i+1] = pivot; 
    a[r] = tmp; 

    return (i+1); 
}

void test_partition(void)
{
    int a[] = {-1, -1, -1, 25, 50, 32, 6, 8, 2, 
                10, 18, 60, 70, 20, -1, -1, -1}; 
    ssize_t p=3; 
    ssize_t r=13; 
    ssize_t q; 

    show(a, p, r, "a[p...r] before partition:"); 
    q = partition(a, p, r); 
    printf("q=%lld, a[%lld]=%d\n", q, q, a[q]); 
    show(a, p, q-1, "a[p...q-1]:"); 
    show(a, q+1, r, "a[q+1...r]:"); 
}

void show(int* a, ssize_t start, ssize_t end, const char* msg)
{
    ssize_t i; 

    if(msg)
        puts(msg); 

    for(i=start; i<=end; ++i)
        printf("a[%lld]:%d\n", i, a[i]); 
}