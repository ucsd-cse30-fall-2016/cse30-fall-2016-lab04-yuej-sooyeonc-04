@ Sooyeon E. Chough (A92093139)
@ Yue Jiang (A92095681)

.syntax unified

@ You can put constants in the .data section. Look up how to do it on your own,
@ or come ask us if you're curious! 

.data 

.text

@ int binary_search_ARM(int * data, int toFind, int start, int end) 

.align 8
.global binary_search_ARM
.func binary_search_ARM, binary_search_ARM
.type binary_search_ARM, %function

binary_search_ARM:

    push    {r4-r11, ip, lr}

    @ - - - - - - - - - - 
    
    @ r4 is mid
    SUB r4, r2, r3
    ADD r4, r5, r2
    LSR r4, r5, #1

    @ base case
    CMP r2, r3
    BGT notHere

    @ r5 is data[ mid ]
    LDR r5, [r0, r4]

    @ if equal to value
    CMP r5, r1
    BEQ equalTo
    BLT lessThan
    BGT greaterThan

equalTo:
    MOV r0, r4
    B end

lessThan:
    ADD r4, r4, #1
    MOV r2, r4
    B end

greaterThan:
    SUB r4, r4, #1
    MOV r2, r4
    B end
    
notHere:
    MOV r0, #-1
    B end

end:

    @ - - - - - - - - - -
   
    pop     {r4-r11, ip, pc}
    BX lr

.endfunc

.end
