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
    
    int x, a, b, c, d, e;
    
    if(str_to_int("123", &x)) {
        printf("%d\n", x);
    } else {
        printf("Invalid integer string\n");
    }
    
    str_to_int( "-987", &a );
    printf("Should be: -987 - Is: %d\n", a);
    str_to_int( "9153295", &b );
    printf("Should be: 9153295 - Is: %d\n", b);
    str_to_int( "10a8", &c );
    printf("Should be: 0 - Is: %d\n", c);
    str_to_int( "1075-2", &d );
    printf("Should be: 0 - Is: %d\n", d);
    str_to_int( "", &e );
    printf("Should be: 0 - Is: %d\n", e);
    
    return 0;
}
