.orga 0x21AC88
.dw 0x00060000
.dd 0x0C0000008040F500
.dw 0x1D000000
.dw 0x0A000000


.orga 0x120F500
ADDIU SP, SP, 0xFFE8
SW RA, 0x14(SP)

ADDIU T0, R0, 180
LUI T1, 0x8036
SB T0, 0x7500(T1)

LW RA, 0x14(SP)
JR RA
ADDIU SP, SP, 0x18


.orga 0x9E8EC
JAL 0x8040F600
NOP


.orga 0x120F600
ADDIU SP, SP, 0xFFE8
SW RA, 0x14(SP)

LUI T8, R0, 0x8036
LB T9, 0x7500(T8)

BEQZ T9, Reality
NOP
ADDIU T9, T9, -1
SB T9, 0x7500(T8)

LUI T1, 0x8034
ADDIU T1, T1, 0xB170

LW T2, 0x10(T1) ;;;load previous action variable;;;
ADDIU T3, R0, 0x08A7
BEQ T2, T3, LetsGo ;;;branch if previous action is air hitting wall;;;
NOP

LUI T3, 0x0800
ADDIU T3, T3, 0x034B
BEQ T2, T3, LetsGo ;;;branch if previous action is ledgegrab;;;
NOP

LW T2, 0xC(T1) ;;;load action variable;;;

LUI T3, 0x0102
ADDIU T3, T3, 0x08B6
BNE T2, T3, HeFast ;;;branch if action isn't soft bonk;;;
NOP
B DoIt
NOP

HeFast:
LUI T3, 0x0102
ADDIU T3, T3, 0x08B0
BNE T2, T3, LetsGo ;;;branch if action isn't hard bonk;;;
NOP

DoIt:
ADDIU T4, R0, 0x08A7
SW T4, 0x10(T1) ;;;set previous action to air hitting wall;;;
ADDIU T4, R0, 0xA
SB T4, 0x2A(T1) ;;;set wallkick timer to 10;;;

LetsGo:
LUI T0, 0x802A
ADDIU T1, R0, 0x2400
SH T1, 0xCE9C(T0)
SH T1, 0xCEC0(T0)

;;;LA T4, 0x8033B170

LH T6, 0xE6(T4)
ADDIU T7, R0, 49
BLE T6, T7, Reality
NOP
ADDIU T7, R0, 69
BLE T6, T7, NotReality
NOP
B Reality
NOP

NotReality:
LW T5, 0x000C(T4)
ADDIU AT, R0, 0x1321
BEQ T5, AT, Reality
NOP
ADDIU AT, R0, 0x1320
BEQ T5, AT, Reality
NOP

LA T0, 0x8033B170

LUI T2, 0x8033 ;loads level ID
LH T2, 0xDDF8(T2)
ADDIU T3, R0, 0x0010
BEQ T2, T3, Reality ;checks if level ID is castle grounds to prevent crash
NOP

LB T1, 0xAE(T0)
BEQZ T1, Dreams
NOP

LW T1, 0xC(T0)
LI T2, 0x21312
BEQ T1, T2, Dreams
NOP

LUI T0, 0x8034
LH T1, 0xBAB0(T0)
ADDIU T2, R0, 267
BEQ T1, T2, Dreams
NOP

B Reality
NOP

Dreams:
ADDIU T1, R0, 0x0008
SB T1, 0xB21E(T0)
ADDIU T1, R0, 0x0000
SH T1, 0xB262(T0)
SH T1, 0xB218(T0)
ADDIU T1, R0, 0x0002
SB T1, 0xB248(T0)
LUI T0, 0x8036
ADDIU T1, R0, 0x0005
SH T1, 0x1414(T0)
LA T0, 0x8033B170
ADDIU T1, R0, 0x0008
SB T1, 0xB3(T0)

Reality:
LW RA, 0x14(SP)
JR RA
ADDIU SP, SP, 0x18
