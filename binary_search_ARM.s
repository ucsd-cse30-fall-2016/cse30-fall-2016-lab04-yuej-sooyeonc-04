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
    
    MOV r4, r0 @*data
    MOV r5, r1 @toFind
    MOV r6, r2 @start
    MOV r7, r3 @end

    SUB sp, sp, #8 @allocate one line for mid

    SUB r0, r7, r6
    LSR r0, r0, #1 @get (end - start)/2
    ADD r3, r6, r0 @now mid at r3 = start + (end - start)/2
    STR r3, [sp] @store mid into stack

    CMP r6, r7
    BGT return_neg_one

    MOV r2, #4
    MUL r2, r2, r3
    LDR r0, [r4, r2] @now r0 stores data[mid]

    CMP r0, r5
    BEQ return_mid

    CMP r0, r5
    BGT search_left

search_right:
    ADD r2, r3, #1
    MOV r0, r4
    MOV r1, r5
    MOV r3, r7
    BL binary_search_ARM
    B end

search_left:
    SUB r3, r3, #1 @mid - 1 is now at r3
    MOV r0, r4
    MOV r1, r5
    MOV r2, r6
    BL binary_search_ARM
    B end

return_neg_one:
    MOV r0, #-1
    B end

return_mid:
    LDR r0, [sp]

end:
    ADD sp, sp, #8

    @ - - - - - - - - - -
   
    pop     {r4-r11, ip, pc}

.endfunc

.end
