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

    @ r6 is count1 for s1
    MOV r6, #0
    @ r9 is count2 for s2
    MOV r9, #0
    
    @ r4 is s1
    MOV r4, r0
    @ r7 is s2
    MOV r7, r1
    
    @ r5 is length of s1
    MOV r0, r4
    BL strlen
    MOV r5, r0
    @ r8 is length of s2
    MOV r0, r7
    BL strlen
    MOV r8, r0
    
    @ check if s1 is empty string
    CMP r5, #0
    BNE checkEmpty
    @ if an empty string, return true
    B endTrue
checkEmpty:
    @ check if s2 is empty string
    CMP r8, #0
    BNE lengthComparison
    @ if an empty string, return true
    B endTrue

lengthComparison:
    @ comparing the lengths of the two strings
    CMP r5, r8
    BLE shorterFirst
    @ reordering so that shorter s is first
    MOV r0, r7
    MOV r1, r8
    MOV r2, r9
    MOV r7, r4
    MOV r8, r5
    MOV r9, r6
    MOV r4, r0
    MOV r5, r1
    MOV r6, r2
shorterFirst:
    @ now, shorter s is r4 - r6 (now s1)
    @ and, longer s is r7 - r9 (now s2)

    @ r10 is s2 length - s1 length
    SUB r10, r8, r5
    @ getting first char of s1
    LDRB r0, [ r4, r6 ]
    
@ finding where s1[ 0 ] = s2[ count2 ]
searchLoopStart:
    @ loop condition 
    CMP r9, r10
    LGE endFail 
    @ getting char from string
    @ r1 is s2[ count2 ]
    LDRB r1, [ r7, r9 ]
    @ comparing s1[ 0 ] and s2[ count2 ]
    CMP r0, r1
    BEQ searchLoopDone
    
    @ incrementing count2 
    ADD r9, r9, #1
    B seachLoopStart
searchLoopDone:
    
@ if true or false
endFail:
    MOV r0, #0
    B end
endTrue:
    MOV r0, #1
    
end:

    @-----------------------

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
    
.endfunc

.end

