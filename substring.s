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

    @ r4 is count
    MOV r4, #0
    @ r5 is s1
    MOV r5, r0
    @ r7 is s2
    MOV r7, r1
    @ r6 is length of s1
    MOV r0, r5
    BL strlen
    MOV r6, r0
    @ r8 is length of s2
    MOV r0, r7
    BL strlen
    MOV r7, r0
checkEmpty1:
    @ check if s1 is empty string
    CMP r6, #0
    BNE checkEmpty2
    @ if an empty string, return true
    MOV r0, #1
    B end
checkEmpty2:
    @ check if s2 is empty string
    CMP r8, #0
    BNE notEmpty
    @ if an empty string, return true
    MOV r0, #1
    B end
notEmpty:
    @ getting first chars of arrays
    @ r0 is s1[ 0 ]
    LDR r0, [r5, r4]
    @ r1 is s2[ 0 ]
    LDR r1, [r7, r4]
loop:
checkNull1:
    @ check if s1 is null
    CMP r0, #0
    BNE checkNull2
    MOV r0, #0
    B end
checkNull2:
    @ check if s2 is null
    CMP r3, #0
    BNE notNull
    MOV r0, #0
    B end
notNull:
    @ 
end:

    @-----------------------

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

