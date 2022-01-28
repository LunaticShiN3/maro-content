.orga 0x120F800 ;replace TEXT HERE by your text, you can't use the letters J, Q, V, X or Z.
.asciiz "TE*T 0 HERE"

.orga 0x120F818
.asciiz "TE*T 1 HERE"

.orga 0x120F830
.asciiz "TE*T 2 HERE"

.orga 0x120F848
.asciiz "TE*T 3 HERE"

.orga 0x120F860
.asciiz "TE*T 4 HERE"

.orga 0x120F878
.asciiz "TE*T 5 HERE"

.orga 0x120F890
.asciiz "TE*T 6 HERE"

.orga 0x120F8A8
.asciiz "TE*T 7 HERE"

.orga 0x120F8C0
.asciiz "TE*T 8 HERE"

.orga 0x120F8D8
.asciiz "TE*T 9 HERE"

.orga 0x120F8F0
.asciiz "TE*T 10 HERE"

.orga 0x120F908
.asciiz "TE*T 11 HERE"

.orga 0x120F920
.asciiz "TE*T 12 HERE"

.orga 0x120F938
.asciiz "TE*T 13 HERE"

.orga 0x120F950
.asciiz "TE*T 14 HERE"

.orga 0x120F968
.asciiz "TE*T 15 HERE"

.orga 0x120F980
.asciiz "TE*T 16 HERE"

.orga 0x120F998
.asciiz "TE*T 17 HERE"

.orga 0x120F9B0
.asciiz "TE*T 18 HERE"

.orga 0x120F9C8
.asciiz "TE*T 19 HERE"

.orga 0x120F9E0
.asciiz "TE*T 20 HERE"

.orga 0x120F9F8
.asciiz "TE*T 21 HERE"

.orga 0x120FA10
.asciiz "TE*T 22 HERE"

.orga 0x120FA28
.asciiz "TE*T 23 HERE"

.orga 0x120FA40
.asciiz "TE*T 24 HERE"

.orga 0x21F480 ;0x13005680
.dw 0x00060000
.dw 0x11010041
.dw 0x08000000
.dd 0x0C0000008040F700
.dw 0x09000000

.orga 0x120F700
ADDIU SP, SP, 0xFFE8
SW RA, 0x14(SP)

LUI T0, 0x8036
LW T0, 0x1160(T0)

LUI T6, 0x8036
LW T6, 0x1160(T6)
ADDIU AT, R0, 300
MTC1 AT, F6
CVT.S.W F6, F6
LWC1 F4, 0x015C(T6)
C.LT.S F4, F6
BC1F End
NOP

LB T1, 0x188(T0)
ADDIU T2, R0, 0x18
MULTU T1, T2
MFLO T1

LI A2, 0x8040F800
ADDU A2, T1, A2

ADDIU A0, R0, 160
JAL 0x802D66C0
ADDIU A1, R0, 40

End:
LW RA, 0x14(SP)
JR RA
ADDIU SP, SP, 0x18
