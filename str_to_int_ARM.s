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
    push {r4-r11, ip, lr}
    
    @ - - - - - - - - - - 
    
    @ r7 is copy of s
    MOV r7, r0
    @ r8 is copy of dest
    MOV r8, r1
    
    @ making sure neither s nor dest is null
    CMP r0, #0
    BNE notNullOne
    B endFail
notNullOne:
    CMP r1, #0
    BNE notNullEither
    B endFail
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
    B endFail
longEnough:

    @ r3 is i
    MOV r3, #0
    @ r4 is digit
    MOV r4, #0
    @ r5 is total
    MOV r5, #0
    
    @ making sure first digit is - or 0 - 9
    LDRB r4, [r0, r3]
    @ checking if 9 or less first
    CMP r4, #57
    BLE firstDigitLess
    B endFail
firstDigitLess:
    @ checking if 0 or more
    CMP r4 #48
    BGE firstDigitCorrect
    @ checking if -
    CMP r4, #45
    BEQ firstDigitCorrect
    B endFail
firstDigitCorrect:
    @ incrementing i
    ADD r3, r3, #1
    @ making sure other digits are 0 - 9
digitCheck:
    @ loop condition
    CMP r3, r2
    BGE digitCheckEnd
    @ getting digit
    LDRB r4, [r0, r3]
    @ checking if 0 or greater
    CMP r4, #48
    BGE digitCheckMid1
    B endFail
digitCheckMid1:
    @ checking if 9 or less
    CMP r4, #57
    BLE digitcheckMid2
    B endFail
digitCheckMid2:
    @ incrementing i
    ADD r3, r3, #i
    B digitCheckEnd
digitCheckEnd:

    @ r10 is #10
    MOV r10, #10
    @ resetting i to 1
    MOV r3, #1
totalLoop:
    @ loop condition
    CMP r3, r2
    BGE totalLoopEnd
    @ getting digit
    LDRB r4, [r0, r3]
    @ turning into 0 - 9
    SUB r4, r4, #48
    @ multiplying total by 10
    MUL r5, r5, r10
    @ adding the digit to changed total
    ADD r5, r5, r4
    @ incrementing loop
    ADD r3, r3, #1
    B totalLoop
totalLoopEnd:

    @ the first digit
    LDRB r4, [r0, #0]
    @ check if - or actual number
    CMP r4, #45
    BNE notZero
    @ if is -
    MOV r10, #-1
    MUL r5, r5, r10
    B endSuccess
notZero:
    @ if 0 - 9
    MOV r10, #10
    SUB r4, r4, #48
    @ loop for multiplying digit enough
    MOV r3, #1
powerTen:
    CMP r3, r2
    BGE powerTenEnd
    MUL r4, r4, r10
    ADD r3, r3, #1
    B powerTen
powerTenEnd:
    @ adding digit to total
    ADD r5, r5, r4
    B endSuccess

@ if is null or string is incorrect
endFail:
    MOV r10, #0
    MOV r0, #0
    STR r10, [r1]
    B end
@ when successfully convert
endSuccess:
    MOV r0, #1
    STR r5, [r1]
    
end:
    
    @ - - - - - - - - - -

    @ This handles restoring registers and returning
    pop {r4-r11, ip, pc}

.endfunc

.end


