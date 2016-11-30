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

    @ Saving registers
    push {r4-r11, ip, lr}
    
    @ - - - - - - - - - - 
    
    @ r7 is copy of s
    MOV r7, r0
    @ r8 is copy of dest
    MOV r8, r1
    
    @ making sure neither s nor dest is null
    CMP r0, #0
    BNE notNullOne
    MOV r0, #0
    STR r1, #0
    B end
notNullOne:
    CMP r1, #0
    BNE notNullEither
    MOV r0, #0
    STR r1, #0
    B end
notNullEither:
    @ getting string length of s
    MOV r0, r7
    BX strlen
    @ r2 is length of s
    MOV r2, r0
    @ r0 is s 
    MOV r0, r7
    
    @ making sure s is longer than one
    CMP r2, #1
    BGE longEnough
    MOV r0, #0
    STR r1, #0
    B end
    
longEnough:
    @ r3 is i
    MOV r3, #0
    @ r4 is digit
    MOV r4, #0
    @ r5 is total
    MOV r5, #0
    
end:
    
    @ - - - - - - - - - -
    MOV r7, r0 @use r7 to stores input string because r0 needs to be set to 0 to indicate conversion failed
    MOV r0, #0
    
    CMP r0, #0
    BEQ end
    
    CMP r1, #0
    BEQ end       @if either parameter is NULL, return 0
    
    BL strlen     @length = strlen(s)
    MOV r2, r0    @now r2 stores length
    CMP r2, #1
    BLT end       @if length < 1, return 0
    
    LDRB r3, [r7]  @r3 temporarily stores the first value of the input string
    CMP r3, #45
    BNE first_value_comparison
    B skip_return_total
    
first_value_comparison:
    CMP r3, #48
    CMPGE r3, 57
    BLE skip_return_total
    MOV r0, #0
    B end

skip_return_total:


    MOV r4, #1    @i = 1
    CMP r4, r2    @i < length @QUESTION: why in your c code it's i < length instead of i<=length?
    BLE loop 
    B out_of_loop
    
    
loop:
    LDRB r3, [r7, r4]
    CMP r3, #48
    BLT end
    CMP r3, #57
    BGT end
    ADD r4, r4, #1
    CMP r4, r2
    BLE loop

out_of_loop:    
    MOV r5, #0    @total is stored in r5
    MOV r4, #1    @i = 1
    CMP r4, r2 
    BLE loop_conversion  @I used BLE here (?)
    B out_of_loop_conversion
    
loop_conversion:
    LDRB r3, [r7, r4]
    SUB r3, r3, #48
    MOV r0, #10
    MUL r5, r5, r0
    ADD r5, r5, r3
    ADD r4, r4, #1
    CMP r4, r2
    BLE loop_conversion

out_of_loop_conversion:
    LDRB r3, [r7]
    CMP r3, #45
    MOV r0, #-1
    MULEQ r5, r5, r0
    
    MOV r4, #0
    CMP r4, r2
    BLT digit_loop
    B out_of_digit_loop
    
digit_loop:
    MOV r0, #10
    MUL r3, r3, r0  @if i < length then digit  = digit * 10
    ADD r4, r4, #1
    CMP r4, r2
    BLT digit_loop

out_of_digit_loop:
    ADD r5, r5, r3
    STR r5, [r1] @should I use STR instead of STRB here?
    MOV r0, #1
    
end:

    
    @ This handles restoring registers and returning
    pop     {r4-r11, ip, pc}

.endfunc

.end


