/* ********************************
 * CSE 30 - HW 4
 *
 * This file is merely designed to give you an idea how to compile/test your own
 * code. You may modify it as you like.
 *
 * ********************************/

#include <stdio.h>

int str_to_int(char * str, int * dest);

int main(int argc, char ** argv) {
    int x;
    if(str_to_int("123", &x)) {
        printf("%d\n", x);
    } else {
        printf("Invalid integer string\n");
    }
    return 0;
}
