@ Sooyeon E. Chough (A92093139)
@ Yue Jiang (A92095681)

.syntax unified

/* You can put constants in the .data section. Look up how to do it on your own,
 * or come ask us if you're curious!*/
.data 


.text

/* int str_to_int(char * str, int * dest);*/
/* Return 1 for success and 0 for failure. */
/* If successful, store the result at the */
/* location pointed to by "dest" */

.align 8
.global str_to_int
.func str_to_int, str_to_int
.type str_to_int, %function

str_to_int:
    @ We need to save away a bunch of registers
    push    {r4-r11, ip, lr}

    CMP r0, #0
    BEQ end
    
    CMP r1, #0
    BEQ end @if either parameter is NULL, return 0
    
    BL ss
    /* Return back to calling function */
    mov r0, #0
    @ This handles restoring registers and returning
    pop     {r4-r11, ip, pc}

.endfunc

.end


