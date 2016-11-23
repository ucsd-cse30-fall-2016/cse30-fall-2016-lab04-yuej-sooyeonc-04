/* ********************************
 * CSE 30 - HW 3
 *
 * Sooyeon E. Chough (A92093139)
 * Yue Jiang (A92095681)
 * ********************************/

#include <stdio.h>
#include "substring.h"

int main() {
    
    char *helloWorld = "Hello world";
    char *helloT = "Hello";
    char *helloF = "hello";
    char *loWoT = "lo wo";
    char *loWoF = "LO WO";
    char *emptyString = "";
    char *nullString = NULL;
    
    int check = 0;
    
    check = substring( helloWorld, helloT );
    assert( check == 1 );
    check = substring( helloT, helloWorld );
    assert( check == 1 );
    
    check = substring( helloWorld, helloF );
    assert( check == 0 );
    
    check = substring( helloWorld, loWoT );
    assert( check == 1 );
    
    check = substring( helloWorld, loWoF );
    assert( check == 0 );
    check = substring( loWoF, helloWorld );
    assert( check == 0 );
    
    check = substring( emptyString, helloWorld );
    assert( check == 1 );
    check = substring( nullString, helloWorld );
    assert( check == 0 );
    
    return 0;
}
