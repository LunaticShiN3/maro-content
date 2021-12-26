.orga 0x21A424 ;behav ID 0x13000624
.dw 0x00060000
.dw 0x11014041
.dw 0x08000000
.dd 0x0C0000008040F780 ;Bullet spawner behavior
.dw 0x09000000

.orga 0x21A448 ;behav ID 0x13000648
.dw 0x000C0000 ;Give up object slot if too many objects loaded 
.dw 0x11014041
.dw 0x08000000
.dd 0x0C0000008040FB00 ;Bullet behavior
.dw 0x09000000


.orga 0x120F780
ADDIU SP, SP, 0xFFE8
OR FP, R0, RA

ADDIU T1, R0, 2000
MTC1 T1, F4
NOP
CVT.S.W F6, F4
LWC1 F4, 0x15C(A0) ;skip if mario is over 2000 units away from the object
C.LT.S F4, F6
BC1F Skip
NOP

LUI T0, 0x8033
LW T0, 0xD5D4(T0)
ADDIU T1, R0, 90 ;skip if timer isn't a multiple of 3 seconds
DIVU T0, T1
MFHI T0
BNEZ T0, Skip

ADD S6, R0, R0
LUI S3, 0x8036
LW S3, 0x1160(S3)
LB S4, 0x188(S3) ;load bullet model id from obj BParam1
LI S5, 0x13000648 ;store function arguments into S registers

LB T0, 0x18A(S3)
BEQZ T0, Return
ADDIU S7, R0, 30 ;determine 10 or 30 bullets depending on BParam3
B Return
ADDIU S7, R0, 10

Return:
ADD A0, R0, S6
ADD A1, R0, R0
ADD A2, R0, R0
ADD A3, R0, R0
SW S3, 0x10(SP) ;store function arguments into the correct places
SW S4, 0x14(SP)
SW S5, 0x18(SP)
JAL 0x8029EF64 ;spawn object relative. A0 = BParam2, A1 = rel XPos, A2 = rel YPos, A3 = rel ZPos, 10SP = parent pointer, 14SP = model ID, 18SP = segmented behav ID
ADDIU S6, S6, 1

LB T0, 0x189(V0)
BNEZ T0, Branch1 ;;;sets object speeds depending on BParam2 (decided by the function);;;
ADDIU T1, R0, 1
ADDIU T2, R0, 0
B End
ADDIU T3, R0, 36

Branch1:
BNE T0, T1, Branch2
ADDIU T1, R0, 2
ADDIU T2, R0, -4
B End
ADDIU T3, R0, 31

Branch2:
BNE T0, T1, Branch3
ADDIU T1, R0, 3
ADDIU T2, R0, 4
B End
ADDIU T3, R0, 31

Branch3:
BNE T0, T1, Branch4
ADDIU T1, R0, 4
ADDIU T2, R0, 0
B End
ADDIU T3, R0, 26

Branch4:
BNE T0, T1, Branch5
ADDIU T1, R0, 5
ADDIU T2, R0, -7
B End
ADDIU T3, R0, 25

Branch5:
BNE T0, T1, Branch6
ADDIU T1, R0, 6
ADDIU T2, R0, 7
B End
ADDIU T3, R0, 25

Branch6:
BNE T0, T1, Branch7
ADDIU T1, R0, 7
ADDIU T2, R0, -3
B End
ADDIU T3, R0, 21

Branch7:
BNE T0, T1, Branch8
ADDIU T1, R0, 8
ADDIU T2, R0, 3
B End
ADDIU T3, R0, 21

Branch8:
BNE T0, T1, Branch9
ADDIU T1, R0, 9
ADDIU T2, R0, -8
B End
ADDIU T3, R0, 20

Branch9:
BNE T0, T1, Branch10
ADDIU T1, R0, 10
ADDIU T2, R0, 8
B End
ADDIU T3, R0, 20

Branch10:
BNE T0, T1, Branch11
ADDIU T1, R0, 11
ADDIU T2, R0, -31
B End
ADDIU T3, R0, -18

Branch11:
BNE T0, T1, Branch12
ADDIU T1, R0, 12
ADDIU T2, R0, -24
B End
ADDIU T3, R0, -19

Branch12:
BNE T0, T1, Branch13
ADDIU T1, R0, 13
ADDIU T2, R0, -29
B End
ADDIU T3, R0, -12

Branch13:
BNE T0, T1, Branch14
ADDIU T1, R0, 14
ADDIU T2, R0, -23
B End
ADDIU T3, R0, -13

Branch14:
BNE T0, T1, Branch15
ADDIU T1, R0, 15
ADDIU T2, R0, -19
B End
ADDIU T3, R0, -18

Branch15:
BNE T0, T1, Branch16
ADDIU T1, R0, 16
ADDIU T2, R0, -25
B End
ADDIU T3, R0, -7

Branch16:
BNE T0, T1, Branch17
ADDIU T2, R0, 17
ADDIU T2, R0, -17
B End
ADDIU T3, R0, -13

Branch17:
BNE T0, T1, Branch18
ADDIU T1, R0, 18
ADDIU T2, R0, -20
B End
ADDIU T3, R0, -8

Branch18:
BNE T0, T1, Branch19
ADDIU T1, R0, 19
ADDIU T2, R0, -13
B End
ADDIU T3, R0, -17

Branch19:
BNE T0, T1, Branch20
ADDIU T1, R0, 20
ADDIU T2, R0, -21
B End
ADDIU T3, R0, -3

Branch20:
BNE T0, T1, Branch21
ADDIU T1, R0, 21
ADDIU T2, R0, 31
B End
ADDIU T3, R0, -18

Branch21:
BNE T0, T1, Branch22
ADDIU T1, R0, 22
ADDIU T2, R0, 29
B End
ADDIU T3, R0, -12

Branch22:
BNE T0, T1, Branch23
ADDIU T1, R0, 23
ADDIU T2, R0, 25
B End
ADDIU T3, R0, -19

Branch23:
BNE T0, T1, Branch24
ADDIU T1, R0, 24
ADDIU T2, R0, 23
B End
ADDIU T3, R0, -13

Branch24:
BNE T0, T1, Branch25
ADDIU T1, R0, 25
ADDIU T2, R0, 25
B End
ADDIU T3, R0, -7

Branch25:
BNE T0, T1, Branch26
ADDIU T1, R0, 26
ADDIU T2, R0, 21
B End
ADDIU T3, R0, -3

Branch26:
BNE T0, T1, Branch27
ADDIU T1, R0, 27
ADDIU T2, R0, 19
B End
ADDIU T3, R0, -18

Branch27:
BNE T0, T1, Branch28
ADDIU T1, R0, 28
ADDIU T2, R0, 20
B End
ADDIU T3, R0, -8

Branch28:
BNE T0, T1, Branch29
ADDIU T2, R0, 13
B End
ADDIU T3, R0, -17

Branch29:
ADDIU T2, R0, 17
ADDIU T3, R0, -13

End:
MTC1 T2, F4
NOP
CVT.S.W F6, F4 ;converts speeds to floats
MTC1 T3, F4
NOP
CVT.S.W F8, F4

LB T0, 0x18A(S3)
BNEZ T0, Ten
NOP
SWC1 F6, 0xAC(V0) ;sets speeds depending on the correct value
SWC1 F8, 0xB0(V0)

Ten:
ADDIU T1, R0, 1
BNE T0, T1, Right
NOP
MTC1 R0, F10 ;;;inverts sign of F8 if BParam3 = 1;;;
NOP
SUB.S F8, F10, F8

Right:
SWC1 F8, 0xAC(V0) ;stores speeds
SWC1 F6, 0xB0(V0)

BNE S6, S7, Return ;branches back until all bullets are spawned
NOP

Skip:
OR RA, R0, FP
JR RA
ADDIU SP, SP, 0x18


.orga 0x120FB00
ADDIU SP, SP, 0xFFE8
SW RA, 0x14(SP)

LUI T0, 0x8033
LW T0, 0xD5D4(T0)
ADDIU T1, R0, 90
DIVU T0, T1
MFHI T0
BEQZ T0, Skip2

LUI A0, 0x8036
LW A0, 0x1160(A0)

ADDIU T1, R0, 100
MTC1 T1, F4
NOP
CVT.S.W F6, F4
LWC1 F4, 0x15C(A0) ;checks if mario is in 100 unit radius
C.LT.S F4, F6
BC1F Nothing
NOP

LI T1, 0x8033B170
LUI T2, 0x8034
LB T2, 0xB941(T2) ;sets mario's health to 0
SH T2, 0xAE(T1)

Skip2:
LI A2, 0x13003510
JAL 0x8029EDCC ;explodes bullets
ADDIU A1, R0, 0xCD

LUI A0, 0x8036
JAL 0x802A0568 ;flags for deletion
LW A0, 0x1160(A0)

Nothing:
LW RA, 0x14(SP)
JR RA
ADDIU SP, SP, 0x18
