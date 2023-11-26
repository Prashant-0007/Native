#include <iostream>
using ssize_t = long long int; 

class array
{
    private: 
        int* a; 
        ssize_t N; 

        static void merge(int* a, int p, int q, int r); 
        static void merge_sort(int* a, int p, int r); 

    public: 
        array(ssize_t _N) : N(_N), a(new int[N]) {} 
        
        ~array() { delete[] a; }
        
        void fill_array()
        {

        }

        friend std::ostream& operator<<(std::ostream& os, 
                                        const array& A)
        {

        }

        void sort() 
        {
            merge_sort(this->a, 0, this->N-1); 
        }
}; 