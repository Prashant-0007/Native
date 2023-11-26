#include <stdio.h> 
#include <stdlib.h> 

#include "list.h"

list_t* create_list(void)
{
    list_t* p_list = NULL; 

    p_list = get_node(-1); 
    p_list->prev = p_list; 
    p_list->next = p_list; 

    return (p_list); 
}

status_t insert_start(list_t* p_list, data_t new_data)
{
    generic_insert(p_list, get_node(new_data), p_list->next); 
    return (SUCCESS); 
}

status_t insert_end(list_t* p_list, data_t new_data)
{
    generic_insert(p_list->prev, get_node(new_data), p_list); 
    return (SUCCESS); 
}

status_t insert_after(list_t* p_list, data_t e_data, data_t new_data)
{
    node_t* p_enode = NULL; 

    if((p_enode = search_node(p_list, e_data)) == NULL)
        return (LIST_DATA_NOT_FOUND); 

    generic_insert(p_enode, get_node(new_data), p_enode->next); 
    return (SUCCESS); 
}

status_t insert_before(list_t* p_list, data_t e_data, data_t new_data)
{
    node_t* p_enode = NULL; 

    if((p_enode = search_node(p_list, e_data)) == NULL)
        return (LIST_DATA_NOT_FOUND); 

    generic_insert(p_enode->prev, get_node(new_data), p_enode); 
    return (SUCCESS); 
}

status_t get_start(list_t* p_list, data_t* p_start_data)
{
    if(is_empty(p_list))
        return (LIST_EMPTY); 

    *p_start_data = p_list->next->data; 
    return (SUCCESS); 
}

status_t get_end(list_t* p_list, data_t* p_end_data)
{
    if(is_empty(p_list))
        return (LIST_EMPTY); 

    *p_end_data = p_list->prev->data; 
    return (SUCCESS); 
}

status_t pop_start(list_t* p_list, data_t* p_start_data)
{
    if(is_empty(p_list))
        return (LIST_EMPTY); 

    *p_start_data = p_list->next->data; 
    generic_delete(p_list->next); 
    
    return (SUCCESS); 
}

status_t pop_end(list_t* p_list, data_t* p_end_data)
{
    if(is_empty(p_list))
        return (LIST_EMPTY); 

    *p_end_data = p_list->prev->data; 
    generic_delete(p_list->prev); 
    
    return (SUCCESS); 
}

status_t remove_start(list_t* p_list)
{
    if(is_empty(p_list))
        return (LIST_EMPTY); 

    generic_delete(p_list->next); 
    return (SUCCESS); 
}

status_t remove_end(list_t* p_list)
{
    if(is_empty(p_list))
        return (LIST_EMPTY); 
    
    generic_delete(p_list->prev); 
    return (SUCCESS); 
}

status_t remove_data(list_t* p_list, data_t data)
{
    node_t* p_rnode = NULL; 
 
    p_rnode = search_node(p_list, data); 
    if(p_rnode == NULL)
        return (LIST_DATA_NOT_FOUND); 
    generic_delete(p_rnode); 
    
    return (SUCCESS); 
}

Bool is_empty(list_t* p_list)
{
    return (p_list->next == p_list && p_list->prev == p_list); 
}

Bool is_member(list_t* p_list, data_t data)
{
    node_t* p_node = NULL; 

    p_node = search_node(p_list, data); 
    return (p_node != NULL); 
}

len_t get_length(list_t* p_list)
{
    node_t* p_run = NULL; 
    len_t L = 0; 

    for(p_run = p_list->next; p_run != p_list; p_run = p_run->next)
        ++L; 

    return (L); 
}

void show(list_t* p_list, const char* msg)
{
    node_t* p_run = NULL; 

    if(msg)
        puts(msg); 

    printf("[START]<->"); 
    for(p_run = p_list->next; p_run != p_list; p_run = p_run->next)
        printf("[%d]<->", p_run->data); 
    puts("[END]"); 
}

void to_array(list_t* p_list, data_t** pp_array, size_t* p_size)
{
	data_t* p_array = NULL;
	size_t size = 0;
	node_t* p_run = NULL;
	len_t len = 0;
	int i;

	len = get_length(p_list);
	if (!len)
	{
		*pp_array = p_array;
		*p_size = size;
		return;
	}

	p_array = (data_t*)xcalloc(len, sizeof(data_t));

	for (p_run = p_list->next, i = 0; p_run != p_list; p_run = p_run->next, ++i)
		p_array[i] = p_run->data;

	*pp_array = p_array;
	*p_size = size;
}

list_t* to_list(data_t* p_array, size_t size)
{
	list_t* p_list = NULL;
	size_t i;

	p_list = create_list();
	for (i = 0; i < size; ++i)
		insert_end(p_list, p_array[i]);

	return (p_list);
}

status_t destroy_list(list_t** pp_list)
{
	node_t* p_run = NULL;
	node_t* p_run_next = NULL;
	list_t* p_list = NULL;

	p_list = *pp_list;
	for (p_run = p_list->next; p_run != p_list; p_run = p_run_next)
	{
		p_run_next = p_run->next;
		free(p_run);
	}

	free(p_list);
	*pp_list = NULL;

	return (SUCCESS);   
}

list_t* concat(list_t* p_list_1, list_t* p_list_2)
{
    list_t* p_new_list = NULL;
	node_t* p_run = NULL;

	p_new_list = create_list();
	for (p_run = p_list_1->next; p_run != p_list_1; p_run = p_run->next)
		insert_end(p_new_list, p_run->data);
	for (p_run = p_list_2->next; p_run != p_list_2; p_run = p_run->next)
		insert_end(p_new_list, p_run->data);

	return (p_new_list);
}

list_t* merge(list_t* p_list_1, list_t* p_list_2)
{
    node_t* p_run1 = NULL;
	node_t* p_run2 = NULL;
	list_t* p_merged_list = NULL;

	p_merged_list = create_list();
	p_run1 = p_list_1->next;
	p_run2 = p_list_2->next;

	while (TRUE)
	{
		if (p_run1 == p_list_1)
		{
			for (; p_run2 != p_list_2; p_run2 = p_run2->next)
				insert_end(p_merged_list, p_run2->data);

			break;
		}

		if (p_run2 == p_list_2)
		{
			for (; p_run1 != p_list_1; p_run1 = p_run1->next)
				insert_end(p_merged_list, p_run1->data);

			break;
		}

		if (p_run1->data <= p_run2->data)
		{
			insert_end(p_merged_list, p_run1->data);
			p_run1 = p_run1->next;
		}
		else
		{
			insert_end(p_merged_list, p_run2->data);
			p_run2 = p_run2->next;
		}
	}

	return (p_merged_list);
}

list_t* get_reversed_list(list_t* p_list)
{
    list_t* p_reversed_list = NULL;
	node_t* p_run = NULL;

	p_reversed_list = create_list();
	for (p_run = p_list->next; p_run != p_list; p_run = p_run->next)
		insert_start(p_reversed_list, p_run->data);

	return (p_reversed_list);
}

status_t append(list_t* p_list_1, list_t** pp_list_2)
{
    list_t* p_list_2 = *pp_list_2; 

    if(is_empty(p_list_2))
        goto out; 

    p_list_1->prev->next = p_list_2->next; 
    p_list_2->next->prev = p_list_1->prev; 
    p_list_2->prev->next = p_list_1; 
    p_list_1->prev = p_list_2->prev; 

out: 
    free(p_list_2); 
    *pp_list_2 = NULL; 
    return (SUCCESS); 
}

status_t reverse_list(list_t* p_list)
{
    node_t* original_first_node = NULL; 
    node_t* p_run = NULL; 
    node_t* p_run_next = NULL; 

    if(is_empty(p_list) || p_list->next->next == p_list)
        return (SUCCESS); 

    original_first_node = p_list->next; 
    for(p_run = p_list->next->next; p_run != p_list; p_run = p_run_next)
    {
        p_run_next = p_run->next; 
        generic_insert(p_list, p_run, p_list->next); 
    }

    original_first_node->next = p_list; 
    p_list->prev = original_first_node; 

    return (SUCCESS); 
}

static void generic_insert(node_t* p_beg, node_t* p_mid, node_t* p_end)
{
    p_mid->next = p_end; 
    p_mid->prev = p_beg; 
    p_beg->next = p_mid; 
    p_end->prev = p_mid; 
}

static void generic_delete(node_t* p_delete_node)
{
    p_delete_node->prev->next = p_delete_node->next; 
    p_delete_node->next->prev = p_delete_node->prev; 
    free(p_delete_node); 
}

static node_t* search_node(list_t* p_list, data_t s_data)
{
    node_t* p_run = NULL; 

    for(p_run = p_list->next; p_run != p_list; p_run = p_run->next)
        if(p_run->data == s_data)
            return (p_run); 

    return (NULL); 
}

static node_t* get_node(data_t new_data)
{
    node_t* p_new_node = NULL; 

    p_new_node = (node_t*)xcalloc(1, sizeof(node_t)); 
    p_new_node->data = new_data; 

    return (p_new_node); 
}

static void* xcalloc(size_t nr_elements, size_t size_per_element)
{
    void* p = NULL; 

    p = calloc(nr_elements, size_per_element); 
    if(NULL == p)
    {
        fprintf(stderr, "calloc():fatal:out of memory\n"); 
        exit(EXIT_FAILURE); 
    }

    return (p); 
}
