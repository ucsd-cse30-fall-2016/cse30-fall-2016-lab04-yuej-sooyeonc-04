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
    
    MOV r7, r0 @use r7 to stores input string because r0 needs to be set to 0 to indicate conversion failed
    MOV r9, r1 
    MOV r0, #0
    
    CMP r0, #0
    BEQ return_0
    
    CMP r1, #0
    BEQ return_0      @if either parameter is NULL, return 0
    
    BL strlen     @length = strlen(s)
    MOV r2, r0    @now r2 stores length
    CMP r2, #1
    BLT return_0       @if length < 1, return 0
    
    LDRB r3, [r7]  @r3 temporarily stores the first value of the input string
    CMP r3, #45
    BNE first_value_comparison
    B skip_return_total
    
first_value_comparison:
    CMP r3, #48
    BLT return_0
    CMP r3, #57
    BGT return_0
    
skip_return_total:
    MOV r4, #1    @i = 1
    CMP r4, r2    
    BLT loop 
    B out_of_loop
    
    
loop:   
    LDRB r3, [r7, r4]
    CMP r3, #48
    BLT return_0
    CMP r3, #57
    BGT return_0
    ADD r4, r4, #1
    CMP r4, r2
    BLT loop


out_of_loop:    
    MOV r5, #0    @total is stored in r5
    MOV r4, #1    @i = 1
    CMP r4, r2 
    BLT loop_conversion  
    B out_of_loop_conversion
    
loop_conversion:
    LDRB r3, [r7, r4]
    SUB r3, r3, #48
    MOV r0, #10
    MUL r5, r5, r0
    ADD r5, r5, r3
    ADD r4, r4, #1
    CMP r4, r2
    BLT loop_conversion

out_of_loop_conversion:
    LDRB r3, [r7]
    MOV r0, #-1
    CMP r3, #45
    MULEQ r5, r5, r0
    BEQ change_dest
    
    SUB r3, r3, #48 @digit is taking place of ch
    MOV r4, #1
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
    
change_dest:
    @STR r5, [r9] @should I use STR instead of STRB here?
    MOV r9, #100
    MOV r0, #1
    B end
    
return_0:
    MOV r0, #0
    STR r0, [r9]

end:

    
    @ This handles restoring registers and returning
    pop     {r4-r11, ip, pc}

.endfunc

.end


