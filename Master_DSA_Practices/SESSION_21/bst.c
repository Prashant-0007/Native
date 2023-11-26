#include <stdio.h> 
#include <stdlib.h> 
#include "bst.h"

bst_t* create_bst(void)
{
    return (bst_t*)xcalloc(1, sizeof(bst_t)); 
}

status_t insert_bst(bst_t* p_bst, data_t new_data)
{
    bst_node_t* p_new_node = NULL; 
    bst_node_t* p_run = NULL; 

    p_new_node = get_bst_node(new_data); 
    if(p_bst->root_node == NULL)
    {
        /* Insert in empty BST */
        p_bst->root_node = p_new_node; 
        p_bst->nr_elements += 1; 
        return (SUCCESS); 
    }

    /* Insert in non-empty BST */
    p_run = p_bst->root_node; 
    while(TRUE)
    {
        if(new_data <= p_run->data)
        {
            if(p_run->left == NULL)            
                break; 
            p_run = p_run->left; 
        }
        else 
        {
            if(p_run->right == NULL)     
                break;  
            p_run = p_run->right; 
        }
    }

    if(new_data <= p_run->data)
        p_run->left = p_new_node; 
    else 
        p_run->right = p_new_node; 
    p_new_node->parent = p_run; 
    p_bst->nr_elements += 1; 

    return (SUCCESS); 
}

Bool search_bst(bst_t* p_bst, data_t s_data)
{
    bst_node_t* p_node = NULL; 

    p_node = search_node(p_bst->root_node, s_data); 
    return (p_node != NULL); 
}

height_t height_bst(bst_t* p_bst)
{
    return (height_bst_nodelevel(p_bst->root_node));
}

status_t destroy_bst(bst_t** pp_bst)
{
    bst_t* p_bst = *pp_bst; 
    // Destruction logic 
    destroy_bst_nodelevel(p_bst->root_node); 
    free(p_bst); 
    p_bst = NULL; 
    *pp_bst = NULL; 
    return (SUCCESS); 
}

height_t height_bst_nodelevel(bst_node_t* root_node)
{
    height_t h_lst, h_rst, h_max; 

    if(root_node == NULL)
        return (0); 

    h_lst = height_bst_nodelevel(root_node->left); 
    h_rst = height_bst_nodelevel(root_node->right); 
    h_max = (h_lst > h_rst) ? (h_lst) : (h_rst); 
    return (h_max + 1); 
}

void destroy_bst_nodelevel(bst_node_t* root_node)
{
    if(root_node != NULL)
    {
        destroy_bst_nodelevel(root_node->left); 
        destroy_bst_nodelevel(root_node->right); 
        free(root_node); 
    }
}

void preorder_traversal(bst_t* p_bst)
{
    printf("[BEGIN]<->"); 
    preorder_traversal_nodelevel(p_bst->root_node); 
    puts("[END]"); 
}

void inorder_traversal(bst_t* p_bst)
{
    printf("[BEGIN]<->"); 
    inorder_traversal_nodelevel(p_bst->root_node); 
    puts("[END]"); 
}

void postorder_traversal(bst_t* p_bst)
{
    printf("[BEGIN]<->"); 
    postorder_traversal_nodelevel(p_bst->root_node); 
    puts("[END]"); 
}

void preorder_traversal_nodelevel(bst_node_t* root_node)
{
    if(root_node != NULL)
    {
        printf("[%d]<->", root_node->data); 
        preorder_traversal_nodelevel(root_node->left); 
        preorder_traversal_nodelevel(root_node->right); 
    }
}

void inorder_traversal_nodelevel(bst_node_t* root_node)
{
    if(root_node != NULL)
    {
        inorder_traversal_nodelevel(root_node->left); 
        printf("[%d]<->", root_node->data); 
        inorder_traversal_nodelevel(root_node->right); 
    }
}

void postorder_traversal_nodelevel(bst_node_t* root_node)
{
    if(root_node != NULL)
    {
        postorder_traversal_nodelevel(root_node->left); 
        postorder_traversal_nodelevel(root_node->right); 
        printf("[%d]<->", root_node->data); 
    }
}

bst_node_t* search_node(bst_node_t* root_node, data_t s_data)
{
    bst_node_t* p_run = NULL; 

    p_run = root_node; 
    while(p_run != NULL)
    {
        if(s_data == p_run->data)
            break; 
        else if(s_data < p_run->data)
            p_run = p_run->left; 
        else 
            p_run = p_run->right; 
    }

    return (p_run); 
}

bst_node_t* get_bst_node(data_t new_data)
{
    bst_node_t* p_node = NULL; 

    p_node = (bst_node_t*)xcalloc(1, sizeof(bst_node_t)); 
    p_node->data = new_data; 
    
    return (p_node); 
}

void* xcalloc(size_t nr_elements, size_t size_per_element)
{
    void* p = NULL; 

    p = calloc(nr_elements, size_per_element); 
    if(NULL == p)
    {
        fprintf(stderr, "calloc:fatal:out of memory\n"); 
        exit(EXIT_FAILURE); 
    }

    return (p); 
}