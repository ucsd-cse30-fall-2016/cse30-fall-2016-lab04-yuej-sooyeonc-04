/* ********************************
 * CSE 30 - HW 4
 *
 * Sooyeon E. Chough (A92093139)
 * Yue Jiang (A92095681)
 * ********************************/

#include <stdio.h>
#include <assert.h>

int str_to_int(char * str, int * dest);

int main(int argc, char ** argv) {
    
    int x, a;
    
    if(str_to_int("123", &x)) {
        printf("%d\n", x);
    } else {
        printf("Invalid integer string\n");
    }
    
    str_to_int( "-012", &a );
    assert( a == -012 );
    str_to_int( "9153295", &a );
    assert( a == 9153295 );
    str_to_int( "10a8", &a );
    assert( a == 0 );
    str_to_int( "1075-2", &a );
    assert( a == 0 );
    
    return 0;
}
