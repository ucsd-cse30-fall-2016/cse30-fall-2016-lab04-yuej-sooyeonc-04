/* ********************************
 * CSE 30 - HW 3
 *
 * Sooyeon E. Chough (A92093139)
 * Yue Jiang (A92095681)
 * ********************************/

#include <stdio.h>
#include <assert.h>
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
    printf( "True: %d\n", check );
    check = substring( helloT, helloWorld );
    printf( "True: %d\n", check );
    
    check = substring( helloWorld, helloF );
    printf( "False: %d\n", check );
    
    check = substring( helloWorld, loWoT );
    printf( "True: %d\n", check );
    
    check = substring( helloWorld, loWoF );
    printf( "False: %d\n", check );
    check = substring( loWoF, helloWorld );
    printf( "False: %d\n", check );
    
    check = substring( emptyString, helloWorld );
    printf( "True: %d\n", check );
    check = substring( nullString, helloWorld );
    printf( "False: %d\n", check );
    
    return 0;
}
