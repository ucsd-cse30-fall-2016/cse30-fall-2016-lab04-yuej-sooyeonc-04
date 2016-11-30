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
@check empty string
CMP r0, #0
BEQ return_0
CMP r1, #0
BEQ return_0

MOV r4, r0 @s1
MOV r5, r1 @s2

BL strlen
MOV r6, r0 @r6 now stores the length of s1

MOV r0, r5
BL strlen
MOV r7, r0 @r7 now stores the length of s2

CMP r6, r7 @see if s1 is the substring of s2 or in reverse order
BLE right_order @length of s1 < s2

MOV r1, #0 @r1 for the loop to find the first matching char
MOV r0, #0 @r0 for the inner loop 

reverse_order:  @ s1 > s2 then s2 might be a substring
LDRB r2, [r5]
LDRB r3, [r4, r1]
CMP r2, r3
BNE increment_reverse @compare each char in s1 with the first char in s2
BEQ inner_loop_reverse @if the first char is the same, keep track of the followings

increment_reverse: @keep looking
ADD r1, r1, #1
CMP r1, r6
BLT reverse_order @make sure it doesn’t reach the end of s1
BGE return_0 @if it reaches the end then return 0

inner_loop_reverse:
LDRB r2, [r5, r0]
ADD r1, r1, r0 @r1 remains unchanged now and r0 keeps increasing
LDRB r3, [r4, r1]
@comparison
CMP r2, r3
BNE return_0
ADD r0, r0, #1
CMP r0, r0, r7
BLT inner_loop_reverse
B return_one @ if it finishes the loop yet not returning 0, then it should return 1


right_order:
LDRB r2, [r4]
LDRB r3, [r5, r1]
CMP r2, r3
BNE increment @compare each char in s2 with the first char in s1
BEQ inner_loop @if the first char is the same, keep track of the followings

increment: @keep looking
ADD r1, r1, #1
CMP r1, r7
BLT right_order @make sure it doesn’t reach the end of s2
BGE return_0 @if it reaches the end then return 0

inner_loop:
LDRB r2, [r4, r0]
ADD r1, r1, r0 @r1 remains unchanged now and r0 keeps increasing
LDRB r3, [r5, r1]
@comparison
CMP r2, r3
BNE return_0
ADD r0, r0, #1
CMP r0, r0, r6
BLT inner_loop
B return_one @ if it finishes the loop yet not returning 0, then it should return 1

return_0:
MOV r0, #0
B end

return_one:
MOV r0, #1

end:
    @-----------------------

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end
