/* ********************************
 * CSE 30 - HW 4
 *
 * Sooyeon E. Chough (A92093139)
 * Yue Jiang (A92095681)
 * ********************************/

#include <stdio.h>
#include <assert.h>
#include "binary_search.h"

int main(int argc, char ** argv) {
    
    int data[] = {1,2,3,4,5,6,7,8,9,10};
    int test[] = { 1, 3, 5, 7, 9 };
    int x;

    printf("C   Binary Search: %d\n", binary_search(data, 4, 0, 9));
    printf("ARM Binary Search: %d\n", binary_search_ARM(data, 4, 0, 9));
    
    x = binary_search_ARM( data, 3, 0, 4 );
    printf( "Should be: 1 - Is: %d\n", x );
    x = binary_search_ARM( data, 5, 0, 4 );
    printf( "Should be: 2 - Is: %d\n", x );
    x = binary_search_ARM( data, 2, 0, 4 );
    printf( "Should be: -1 - Is: %d\n", x );
    x = binary_search_ARM( data, 6, 0, 4 );
    printf( "Should be: -1 - Is: %d\n", x );
    
    return 0;
}
