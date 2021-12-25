.orga 0x219F74 ;behav id 0x13000174
.dw 0x00090000
.dw 0x11010001
.dd 0x2A00000001010101
.dw 0x08000000
.dd 0x0C0000008040F400
.dw 0x09000000

.orga 0x120F400
ADDIU SP, SP, 0xFFE8
SW RA, 0x14(SP)

LUI T0, 0x8036
LB T1, 0x7500(T0)
LW T2, 0x1160(T0) ;load a bunch of stuff
LB S5, 0x188(T2) ;BParam1 is timer
LB S6, 0x189(T2) ;BParam2 is rot speed
LB S7, 0x18A(T2) ;BParam3 is amount of platforms

BNEZ T1, Icy
ADDIU T1, T1, -1 ;check if timer is 0 and update it

LB T1, 0x188(T2)
MULTU S5, S7 ;reset timer when it's 0
MFLO T1

Icy:
SB T1, 0x7500(T0) ;store timer

ADDIU T3, R0, 2
DIVU S5, T3
MFLO T3
BGT T1, T3, Skid ;check if timer reached half
NOP

SUBU S6, R0, S6 ;invert speed sign

Skid:
SW S6, 0x114(T2) ;store speed

LW RA, 0x14(SP)
JR RA
ADDIU SP, SP, 0x18
