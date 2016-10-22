#ifndef BINARY_SEARCH_H_INC
#define BINARY_SEARCH_H_INC 1

/*********************************
 * CSE 30 HW 4: Binary Search
 * ******************************/

/* C version of binary search (implemented in binary_search.c) */
int binary_search(int *data, int toFind, int start, int end);

/* You need to implement the same binary_search() into ARM */
int binary_search_ARM(int *data, int toFind, int start, int end);

#endif
