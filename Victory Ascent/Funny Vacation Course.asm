.orga 0x21F410 ;Hex Behav: 13005610
.dw 0x00060000
.dw 0x11014001
.dw 0x08000000
.dd 0x0C0000008040F550
.dw 0x09000000

.orga 0x120F550
ADDIU SP, SP, 0xFFE8
SW RA, 0x14(SP)

LUI T0, 0x8034
LB T0, 0xAFF8(T0)
ANDI T0, T0, 0x80
BEQZ T0, end

LI T0, 0x8033B170
LW T1, 0xC(T0)
LI T2, 0x018008AC
BNE T1, T2, next
NOP

ADDIU T1, R0, -75
MTC1 T1, F4
NOP
CVT.S.W F6, F4
SWC1 F6, 0x4C(T0)

next:
LI T1, 0x03000880
SW T1, 0xC(T0)

end:
LW RA, 0x14(SP)
JR RA
ADDIU SP, SP, 0x18