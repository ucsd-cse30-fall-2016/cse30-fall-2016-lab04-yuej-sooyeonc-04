@ Sooyeon E. Chough (A92093139)
@ Yue Jiang (A92095681)

.syntax unified

.text

.align 8
.global substring
.func substring, substring
.type substring, %function

@ int substring(char * s1, char * s2)
substring:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @-----------------------

    @ r8 is count for s1
    MOV r8, #0
    @ r9 is count for s2
    MOV r9, #0
    @ r4 is s1
    MOV r4, r0
    @ r6 is s2
    MOV r6, r1
    @ r5 is length of s1
    MOV r0, r4
    BL strlen
    MOV r5, r0
    @ r7 is length of s2
    MOV r0, r6
    BL strlen
    MOV r7, r0
checkEmpty1:
    @ check if s1 is empty string
    CMP r5, #0
    BNE checkEmpty2
    @ if an empty string, return true
    MOV r0, #1
    B end
checkEmpty2:
    @ check if s2 is empty string
    CMP r7, #0
    BNE notEmpty
    @ if an empty string, return true
    MOV r0, #1
    B end
notEmpty:
    @ getting first chars of arrays
    @ r0 is s1[ 0 ]
    LDR r0, [r4, r8]
    @ r1 is s2[ 0 ]
    LDR r1, [r6, r9]
loop:
checkNull1:
    @ check if s1 is null
    CMP r0, #0
    BNE checkNull2
    MOV r0, #0
    B end
checkNull2:
    @ check if s2 is null
    CMP r1, #0
    BNE notNull
    MOV r0, #0
    B end
notNull:
    @

@ TODO // Does not account for when reach end of s1 AND is a substring (aka when null and right)

checkLength1:
    @ check if end of loop
    CMP r8, r5
    BNE checkLength2
    MOV r0, #0
    B end
checkLength2:
    @ check if end of loop
    CMP r9, r7
    BNE loopAgain
    MOV r0, #0
    B end
loopAgain:
    @ not end of loop so increment
    ADD r9, r9, #1
    @ and get next char
    @ r0 is s1[ count ]
    LDR r0, [r4, r8]
    @ r1 is s2[ count ]
    LDR r1, [r6, r9]
    B loop
end:

    @-----------------------

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

