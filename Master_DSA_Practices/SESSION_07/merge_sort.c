#include <stdio.h> 
#include <stdlib.h> 

#define TRUE 1 

typedef long long ssize_t; 

void fill_array(int* p, ssize_t N); 
void show_array(int* p, ssize_t N, const char* msg); 
void sort(int* p, ssize_t N); 
void merge(int* a, ssize_t p, ssize_t q, ssize_t r); 
void merge_sort(int* a, ssize_t p, ssize_t r); 

int main(int argc, char* argv[])
{
    int* a = NULL; 
    ssize_t N = 0; 

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
    show_array(a, N, "Array : Before sort"); 
    sort(a, N); 
    show_array(a, N, "Array : After sort"); 

    free(a); 
    a = NULL; 

    return (EXIT_SUCCESS); 
}

void merge(int* a, ssize_t p, ssize_t q, ssize_t r)
{
    int* a1 = NULL;     /* pointer to sub-array 1 */
    int* a2 = NULL;     /* pointer to sub-array 2 */
    ssize_t N1, N2;     /* Lengths of subarray 1 & 2 */
    ssize_t i, j, k;    /* Markers into subarrays and the original array */
    ssize_t index;      /* general purpose index variable */

    N1 = q - p + 1; 
    N2 = r - q; 

    a1 = (int*)calloc(N1, sizeof(int)); 
    if(a1 == NULL)
    {
        fprintf(stderr, "calloc():fatal:out of memory\n"); 
        exit(EXIT_FAILURE); 
    }

    a2 = (int*)calloc(N2, sizeof(int)); 
    if(a2 == NULL)
    {
        fprintf(stderr, "calloc():fatal:out of memory\n"); 
        exit(EXIT_FAILURE); 
    }

    for(index = 0; index < N1; ++index)
        a1[index] = a[p+index]; 

    for(index = 0; index < N2; ++index)
        a2[index] = a[q+1+index]; 

    i = 0; 
    j = 0; 
    k = 0; 

    while(TRUE)
    {
        if(a1[i] <= a2[j])
        {
            a[p+k] = a1[i]; 
            ++i; 
            ++k; 
            if(i == N1)
            {
                /* Sub-array a1 has exhausted */
                /* Response: Copy remaining part of a2 in a*/
                /* Remaining part of a2: current value of j to N2-1*/
                while(j < N2)
                {
                    a[p+k] = a2[j]; 
                    ++j; 
                    ++k; 
                }
                break; 
            }
        }
        else 
        {
            a[p+k] = a2[j]; 
            ++j; 
            ++k; 
            if(j == N2)
            {
                /* Sub-array a2 has exhausted */
                /* Response: Copy remaining part of a1 into a*/
                /* Remaining part of a1: Current value of i to N1-1 */
                while(i < N1)
                {
                    a[p+k] = a1[i]; 
                    ++i; 
                    ++k; 
                }
                break; 
            }
        }
    }

    free(a1); 
    a1 = NULL; 

    free(a2);
    a2 = NULL; 
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

void merge_sort(int* a, ssize_t p, ssize_t r)
{
    ssize_t q; 

    if(p < r)
    {
        q = (p+r)/2; 
        merge_sort(a, p, q); 
        merge_sort(a, q+1, r); 
        merge(a, p, q, r); 
    }
}

void sort(int* p, ssize_t N)
{
    merge_sort(p, 0, N-1); 
}