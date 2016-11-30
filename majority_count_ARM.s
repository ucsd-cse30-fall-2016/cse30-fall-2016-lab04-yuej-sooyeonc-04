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
.global count_ARM
.func count_ARM, count_ARM
.type count_ARM, %function

count_ARM:

    push {r4-r11, ip, lr}
    
    @parameters:arr, len, &majority element
    
    MOV r4, #0 @use r4 to store count
    LDR r5, [r2]
    CMP r1, #0
    BGT loop
    
loop:
    LDR r3, [r0], #4
    CMP r3, r5
    ADDEQ r4, r4, #1
    SUB r1, r1, #1
    CMP r1, #0
    BGT loop

    MOV r0, r4
    
.endfunc

.align 8
.global majority_count_ARM
.func majority_count_ARM, majority_count_ARM
.type majority_count_ARM, %function

majority_count_ARM:
    @ We need to save away a bunch of registers
    push    {r4-r11, ip, lr}
    @ May want to decrement stack pointer for more space   
    
    CMP r1, #0
    BEQ return_0
    CMP r1, #1
    BEQ return_one

    MOV r4, r0
    MOV r5, r1
    MOV r6, r2


    SUB sp, sp, #16
    LSR r1, r1, #1 @len/2
    ADD r2, sp, #12
    BL majority_count_ARM
    MOV r3, r0 @now r3 stores left_majority_count
    STR r0, [sp]

    SUB sp, sp, #8
    ADD r0, r0, r1
    SUB r1, r5, r1
    ADD r2, sp, #16
    BL majority_count_ARM
    STR r0, [sp, #4]
    @r0 still stores right_majority_count

    CMP r3, #1
    BEQ loop_left

    CMP r0, #1
    BEQ loop_right

loop_left:
    MOV r0, r4
    MOV r1, r5
    LDR r2, [sp, #20]
    BL count_ARM
    STR r0, [sp, #12]
    LSR r1, r1, #1
    CMP r0, r1
    BLE skip_left
    CMP r6, #1
    STREQ r2, [r6]
    B return_c

skip_left:

loop_right:
    MOV r0, r4
    MOV r1, r5
    LDR r2, [sp, #16]
    BL count_ARM
    STR r0, [sp, #12]
    LSR r1, r1, #1
    CMP r0, r1
    BLE skip_right
    CMP r6, #1
    STREQ r2, [r6]
    B return_c

skip_right:

return_0:
    MOV r0, #0

return_one:
    MOV r0, #1
    B end
    
return_c:
    LDR r0, [sp, #12]
    
end:
    ADD sp, sp, #24
    
    @ Remember to restore your stack pointer before popping!
    @ This handles restoring registers and returning
    pop     {r4-r11, ip, pc}

.endfunc

.end


