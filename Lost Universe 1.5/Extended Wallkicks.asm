.orga 0x21A958 ;uses behavior ID 0x13000B58
.dw 0x00060000
.dw 0x11014001
.dw 0x08000000
.dd 0x0C0000008040F600 ;object shit
.dw 0x09000000

.orga 0x120F600
ADDIU SP, SP, 0xFFE8 ;function wrapper
SW RA, 0x14(SP)

LUI T1, 0x8034
ADDIU T1, T1, 0xB170 ;load previous action variable
LW T2, 0x10(T1)

ADDIU T3, R0, 0x08A7
BEQ T2, T3, LetsGo ;branch if previous action is air hitting wall
NOP

LUI T3, 0x0800
ADDIU T3, T3, 0x034B
BEQ T2, T3, LetsGo ;branch if previous action is ledgegrab
NOP

LW T2, 0xC(T1) ;load action variable

LUI T3, 0x0102
ADDIU T3, T3, 0x08B6
BNE T2, T3, HeFast ;branch if action isn't soft bonk
NOP
B DoIt
NOP

HeFast:
LUI T3, 0x0102
ADDIU T3, T3, 0x08B0
BNE T2, T3, LetsGo ;branch if action isn't hard bonk
NOP

DoIt:
ADDIU T4, R0, 0x08A7
SW T4, 0x10(T1) ;set previous action to air hitting wall
ADDIU T4, R0, 0xA
SB T4, 0x2A(T1) ;set wallkick timer to 10

LetsGo:
LW RA, 0x14(SP)
JR RA
ADDIU SP, SP, 0x18
