.orga 0x21ACB0
.dw 0x00060000
.dw 0x11010041
.dw 0x08000000
.dd 0x0C0000008040F800
.dw 0x09000000

.orga 0x120F800
ADDIU SP, SP, 0xFFE8
SW RA, 0x14(SP)

LUI T6, 0x8036
LW T6, 0x1160(T6)
ADDIU AT, R0, 500
MTC1 AT, F6
CVT.S.W F6, F6
LWC1 F4, 0x015C(T6)
C.LT.S F4, F6
BC1F End
NOP

JAL 0x8027A16C
NOP

ORI A0, V0, 0x200

JAL 0x8027A0A8
NOP

End:
LW RA, 0x14(SP)
JR RA
ADDIU SP, SP, 0x18