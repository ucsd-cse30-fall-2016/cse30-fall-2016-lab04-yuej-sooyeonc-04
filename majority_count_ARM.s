@ Sooyeon E. Chough (A92093139)
@ Yue Jiang (A92095681)

.syntax unified

/* You can put constants in the .data section. Look up how to do it on your own,
 * or come ask us if you're curious!*/
.data 


.text

/* int majority_count_ARM(int * arr, int len, int * result)*/
/* Remember to place your return value in r0. */
/* Return the count of the majority element in arr, */
/* or 0 if there is no majority. If "result" is not */
/* NULL, place the value of the majority element at */
/* that memory location before returning. */

.align 8
.global majority_count_ARM
.func majority_count_ARM, majority_count_ARM
.type majority_count_ARM, %function

majority_count_ARM:
    @ We need to save away a bunch of registers
    push    {r4-r11, ip, lr}
    @ May want to decrement stack pointer for more space   
    SUB sp, sp, #16 @ r0, r1, r2, r4 -> majority_count/c
    STR r0, [sp]
    STR r1, [sp, #4]
    STR r2, [sp, #8]
    
    CMP r1, #0
    BEQ return_0
    CMP r1, #1
    BEQ return_one
    
    MOV r7, r1 @keep a copy of original len
    MOV r3, r0 @keep a copy of original arr
    
    MOV r6, #0 @left_majority_count
    MOV r7, #0 @right_majority_count
    
    LSL r1 @get len/2
    
    MOV r2, r5
    BL majority_count_ARM
    
    ADD r0, r0, r1
    SUB r1, r7, r1 @len-len/2
    MOV r2, r6
    BL majority_count_ARM
    
    CMP r5, #0
    BNE c_left
    CMP r6, #0
    BNE c_right

c_left:
    MOV r0, r3
    MOV r1, r7
    MOV r2, r5
    BL count
    
   
mov r0, #0
    @ Remember to restore your stack pointer before popping!
    @ This handles restoring registers and returning
    pop     {r4-r11, ip, pc}

.endfunc

.end


