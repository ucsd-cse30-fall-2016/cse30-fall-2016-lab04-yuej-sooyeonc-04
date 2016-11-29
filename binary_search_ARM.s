@ Sooyeon E. Chough (A92093139)
@ Yue Jiang (A92095681)

.syntax unified

/* You can put constants in the .data section. Look up how to do it on your own,
 * or come ask us if you're curious!*/
.data 


.text

/*int binary_search_ARM(int * data, int toFind, int start, int end)*/
/*Note that you return your value in r0*/

.align 8
.global binary_search_ARM
.func binary_search_ARM, binary_search_ARM
.type binary_search_ARM, %function

@questions: do we have to necessarily push r4-r11? 
@what if I'm storing the updated value in stack in registor r0-r3?

binary_search_ARM:
    @ We need to save away a bunch of registers
    push    {r4-r11, ip, lr}
    @ May need to decrement stack pointer for more stack space    
    SUB sp, sp, #16
    STR r0, [sp]
    STR r1, [sp, #4]
    STR r2, [sp, #8]
    STR r3, [sp, #12]
    
    SUB r6, r3, r2 @end - start
    LSR r6 @half of r6
    ADD r6, r2, r6 @mid = (end - start)/2 + start
    CMP r3, r2
    BLE return_one
    
    LDR r7, [r0, r6] @data[mid]
    CMP r7, r1
    BEQ return_mid
    
    BLE loop_right
    BGT loop_left
    
    B end
    
loop_right:   
    SUB r6, r6 ,#1
    MOV r3, r6
    BL binary_search_ARM

loop_left:
    ADD r6, r6, #1
    MOV r2, r6
    BL binary_search_ARM

return_mid:
    MOV r0, r6
    
return_one:
    MOV r0, #-1
    
end:ADD sp, sp, #16
    @ Remember to restore the stack pointer before popping!
    @ This handles restoring registers and returning
    pop     {r4-r11, ip, pc}

.endfunc

.end


