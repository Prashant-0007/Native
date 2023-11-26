#include <stdio.h> 
#include <stdlib.h> 
#include "list.h"

/* Interface functions -> Called by the user of linked list  */
struct node* create_list(void)
{
    return (get_node(-1)); 
}

int insert_start(struct node* p_list, int new_data)
{
    struct node* p_new_node = NULL; 
    
    p_new_node = get_node(new_data); 
    p_new_node->next = p_list->next; 
    p_list->next = p_new_node; 

    return (SUCCESS); 
}

int insert_end(struct node* p_list, int new_data)
{
    struct node* p_run = NULL; 

    p_run = p_list; 
    while(p_run->next != NULL)
        p_run = p_run->next; 

    /*  
        When control flow comes out of while loop 
        then p_run contains an address of node 
        whose next member is NULL 
    */

   p_run->next = get_node(new_data); 
   return (SUCCESS); 
}

int insert_after(struct node* p_list, int ext_data, int new_data)
{
    struct node* p_ext_node = NULL; 
    struct node* p_new_node = NULL; 

    p_ext_node = search_node(p_list, ext_data); 
    if(p_ext_node == NULL)
        return (DATA_NOT_FOUND); 

    p_new_node = get_node(new_data); 
    p_new_node->next = p_ext_node->next; 
    p_ext_node->next = p_new_node; 

    return (SUCCESS); 
}

int insert_before(struct node* p_list, int ext_data, int new_data)
{
    struct node* p_ext_node = NULL; 
    struct node* p_ext_node_prev = NULL; 
    struct node* p_new_node = NULL; 

    get_node_and_previous(p_list, ext_data, &p_ext_node, &p_ext_node_prev); 
    if(p_ext_node == NULL && p_ext_node_prev == NULL)
        return (DATA_NOT_FOUND); 

    p_new_node = get_node(new_data); 
    p_new_node->next = p_ext_node; 
    p_ext_node_prev->next = p_new_node; 

    return (SUCCESS); 
}

void show_list(struct node* p_list, const char* msg)
{
    struct node* p_run = NULL; 

    if(msg)
        puts(msg); 

    printf("[START]->"); 

    p_run = p_list->next;
    while(p_run != NULL)
    {
        printf("[%d]->", p_run->data); 
        p_run = p_run->next; 
    }

    puts("[END]"); 
}

void destroy_list(struct node* p_list)
{
    struct node* p_run = NULL; 
    struct node* p_run_next = NULL; 

    p_run = p_list->next; 
    while(p_run != NULL)
    {
        p_run_next = p_run->next; 
        free(p_run); 
        p_run = p_run_next; 
    }

    /* At this point all nodes will data are freed */
    free(p_list); 
    p_list = NULL; 
}

/* Helper functions of interface */

struct node* search_node(struct node* p_list, int search_data)
{
    struct node* p_run = NULL; 

    p_run = p_list->next; 
    while(p_run != NULL)
    {
        if(p_run->data == search_data)
            break; 

        p_run = p_run->next; 
    }

    return (p_run); 
}

void get_node_and_previous(struct node* p_list, int search_data, 
                            struct node** pp_node, struct node** pp_prev_node)
{
    struct node* p_run = NULL; 
    struct node* p_run_prev = NULL; 

    p_run = p_list->next; 
    p_run_prev = p_list; 

    while(p_run != NULL)
    {
        if(p_run->data == search_data)
        {
            *pp_node = p_run; 
            *pp_prev_node = p_run_prev; 
            return; 
        }
        p_run_prev = p_run; 
        p_run = p_run->next; 
    }

    *pp_node = NULL; 
    *pp_prev_node = NULL; 
}

struct node* get_node(int new_data)
{
    struct node* p_new_node = NULL; 

    p_new_node = (struct node*)xcalloc(1, sizeof(struct node)); 
    p_new_node->data = new_data; 
    p_new_node->next = NULL; 

    return (p_new_node); 
}

void* xcalloc(size_t nr_of_elements, size_t size_per_element)
{
    void* p = NULL; 

    p = calloc(nr_of_elements, size_per_element); 
    if(NULL == p)
    {
        fprintf(stderr, "calloc():fatal:out of virtual memory\n"); 
        exit(EXIT_FAILURE); 
    }

    return (p); 
}
