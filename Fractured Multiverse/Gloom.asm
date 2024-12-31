.headersize 0x7F200000
.orga 0xB7FC ;Gloom collision type setup
J 0x80407600
NOP
.orga 0x1207600
ADDIU SP, SP, -0x28
SW RA, 0x001C(SP)
SW A0, 0x0028(SP)
SW S0, 0x0018(SP)
LW T6, 0x0028(SP)
ADDIU AT, R0, 0x0100
LW T7, 0x000C(T6)
ANDI T8, T7, 0x01C0
BNE T8, AT, ExFloorsBranch1 ;This is complete nonsense to me
NOP
B ExFloorsEnd
NOP
ExFloorsBranch1:
LW T9, 0x0028(SP)
LW T0, 0x0068(T9)
BEQZ T0, ExFloorsEnd
NOP
LW T1, 0x0028(SP)
LW T2, 0x0068(T1)
LH T3, 0x0000(T2)
SW T3, 0x0024(SP)
LW S0, 0x0024(SP)
ADDIU AT, R0, 0x000A
BEQ S0, AT, ExFloorBranch2 ;I have no idea what any of this does
NOP
ADDIU AT, R0, 0x0032
BEQ S0, AT, ExFloorBranch3
NOP
ADDIU AT, R0, 0x0033
BEQ S0, AT, ExFloorBranch4
NOP
ADDIU AT, R0, 0x0034
BEQ S0, AT, ExFloorBranch5
NOP
ADDIU AT, R0, 0x0038
BEQ S0, AT, ExFloorBranch2
NOP
ADDIU AT, R0, 0x00A6
BEQ S0, AT, ExFloorBranch6 ;I am in pain and misery from trying to read/understand any of this shit
NOP
B FuncEndExFloor
NOP
ExFloorBranch2:
JAL 0x802505C8
LW A0, 0x0028(SP)
B FuncEndExFloor
NOP
ExFloorBranch3:
JAL 0x8024A9CC
LW A0, 0x0028(SP)
ADDIU A1, R0, 0x0013
B FuncEndExFloor
NOP
ExFloorBranch4:
JAL 0x80250724
LW A0, 0x0028(SP) ;Please do me a favor and pray for my sanity
B FuncEndExFloor
NOP
ExFloorBranch5:
JAL 0x80250778
LW A0, 0x0028(SP) 
B FuncEndExFloor
NOP
ExFloorBranch6:
JAL 0x804077CC
LW A0, 0x0028(SP)
B FuncEndExFloor
NOP
FuncEndExFloor:
J 0x802508D8
NOP
ExFloorsEnd:
J 0x80250920
NOP

.orga 0x12077CC ;Here's where everything starts to make sense
ADDIU SP, SP, -0x18
SW RA, 0x0014(SP)
SW A0, 0x0018(SP)
LW T6, 0x0018(SP)
LUI AT, 0x4120
MTC1 AT, F8
LWC1 F6, 0x0070(T6)
LWC1 F4, 0x0040(T6) ;I take it this is all just init shit that checks if you're standing on the ground, just good ol basic stuff
ADD.S F10, F6, F8
C.LT.S F4, F10
BC1F GloomEnd
NOP

LUI T0, 0x8040
LH T2, 0x7900(T0)
ADDIU T2, T2, -16 ;Decreases maximum HP by 0+16
SH T2, 0x7900(T0)

GloomEnd:
LW RA, 0x0014(SP)
JR RA
ADDIU SP, SP, 0x18

.orga 0x1207908
.asciiz "Z"

.orga 0x1207910 ;Gloom manager object
.dw 0x00060000
.dw 0x11010001
.dw 0x0C000000
.dw gloomobjinit
.dw 0x08000000
.dw 0x0C000000
.dw gloomobjloop
.dw 0x09000000

gloomobjinit:
ADDIU SP, SP, 0xFFE8
SW RA, 0x14(SP)

LUI T0, 0x8040
ADDIU T1, R0, 0x0880
SH T1, 0x7900(T0) ;init max hp value to 8+128

LW RA, 0x14(SP)
JR RA
ADDIU SP, SP, 0x18

gloomobjloop:
ADDIU SP, SP, 0xFFE0
SW RA, 0x14(SP)

LUI T0, 0x8034
LH T1, 0xB21E(T0) ;if hp exceeds max hp, set hp to max hp
LUI T2, 0x8040
LH T3, 0x7900(T2)
ADDIU T4, R0, 0x880
BLE T3, T4, MaxHPGood
NOP

ADDIU T3, R0, 0x880
SH T3, 0x7900(T2)

MaxHPGood:
BLT T1, T3, DontLowerHP
NOP

SH T3, 0xB21E(T0)

DontLowerHP:

SW S3, 0x18(SP)

OR S3, T3, R0
ADDIU T4, R0, 0x7FF
BLE T4, S3, NoMoreBrokenHearts
.f_PrintReg 16, 16, 0x80407908, R0

ADDIU T4, R0, 0x6FF
BLE T4, S3, NoMoreBrokenHearts
.f_PrintReg 32, 16, 0x80407908, R0

ADDIU T4, R0, 0x5FF
BLE T4, S3, NoMoreBrokenHearts
.f_PrintReg 48, 16, 0x80407908, R0

ADDIU T4, R0, 0x4FF
BLE T4, S3, NoMoreBrokenHearts
.f_PrintReg 64, 16, 0x80407908, R0

ADDIU T4, R0, 0x3FF
BLE T4, S3, NoMoreBrokenHearts
.f_PrintReg 80, 16, 0x80407908, R0

ADDIU T4, R0, 0x2FF
BLE T4, S3, NoMoreBrokenHearts
.f_PrintReg 96, 16, 0x80407908, R0

ADDIU T4, R0, 0x1FF
BLE T4, S3, NoMoreBrokenHearts
.f_PrintReg 112, 16, 0x80407908, R0

ADDIU T4, R0, 0x0FF
BLE T4, S3, NoMoreBrokenHearts
.f_PrintReg 128, 16, 0x80407908, R0

NoMoreBrokenHearts:
LW S3, 0x18(SP)
LW RA, 0x14(SP)
JR RA
ADDIU SP, SP, 0x20



.orga 0x1207B00 ;sundelion code
.dw 0x00060000
.dw 0x11010041
.dw 0x08000000
.dw 0x0C000000
.dw sundelionloop
.dw 0x09000000

sundelionloop:
ADDIU SP, SP, 0xFFE8
SW RA, 0x14(SP)

LUI T6, 0x8036
LW T6, 0x1160(T6)
ADDIU AT, R0, 100
MTC1 AT, F6
CVT.S.W F6, F6
LWC1 F4, 0x015C(T6)
C.LT.S F4, F6
BC1F SundelionEnd
NOP

LUI T0, 0x8040
LH T1, 0x7900(T0)
ADDIU T1, T1, 0x300
SH T1, 0x7900(T0)

LUI A0, 0x8036
LW A0, 0x1160(A0)
JAL 0x802A0568
NOP

SundelionEnd:
LW RA, 0x14(SP)
JR RA
ADDIU SP, SP, 0x18



.orga 0x80A8E2
.dw 0x00407B80 ;replaces letter Z texture pointer

.orga 0x1207B80
.import ".\gloomtexturerawdata.bin" ;imports broken heart texture raw data
