#include <stdio.h> 
#include <stdlib.h> 
#include <time.h>

#define TRUE 1 

typedef long long ssize_t; 

void fill_array(int* p, ssize_t N); 
void show_array(int* p, ssize_t N, const char* msg); 
void sort(int* p, ssize_t N); 
int partition(int* a, ssize_t p, ssize_t r); 
void quick_sort(int* a, ssize_t p, ssize_t r); 

int main(int argc, char* argv[])
{
    int* a = NULL; 
    ssize_t N = 0; 
    time_t start, end, delta; 

    if(argc != 2)
    {
        fprintf(stderr, "Usage Error:%s number of elements\n", argv[0]); 
        exit(EXIT_FAILURE); 
    }

    N = atoll(argv[1]);
    if(N <= 0)
    {
        fprintf(stderr, "Bad size for array"); 
        exit(EXIT_FAILURE); 
    }

    a = (int*)calloc(N, sizeof(int)); 
    if(a == NULL)
    {
        fprintf(stderr, "calloc():fatal:out of memory\n"); 
        exit(EXIT_FAILURE); 
    }

    fill_array(a, N); 

    start = time(0); 
    sort(a, N); 
    end = time(0); 
    delta = end-start; 
    printf("Delta=%llu\n", delta); 

    free(a); 
    a = NULL; 

    return (EXIT_SUCCESS); 
}

void fill_array(int* p, ssize_t N)
{
    ssize_t i; 
    
    srand(time(0)); 
    for(i = 0; i < N; ++i)
        p[i] = rand(); 
}

void show_array(int* p, ssize_t N, const char* msg)
{
    ssize_t i; 

    if(msg)
        puts(msg); 

    for(i = 0; i < N; ++i)
        printf("p[%lld]:%d\n", i, p[i]); 
}

int partition(int* a, ssize_t p, ssize_t r)
{
    int pivot;  /* to store a[r] so that a[r] can be over-written */
    ssize_t j;      /* loop variable for travelling from p to r-1 */
    ssize_t i;      /* Elements from a[p...i] will be less than or equal 
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

void quick_sort(int* a, ssize_t p, ssize_t r)
{
    ssize_t q; 

    if(p < r)
    {
        q = partition(a, p, r); 
        quick_sort(a, p, q-1); 
        quick_sort(a, q+1, r); 
    }

}

void sort(int* p, ssize_t N)
{
    quick_sort(p, 0, N-1); 
}