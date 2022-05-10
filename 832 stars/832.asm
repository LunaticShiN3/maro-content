.orga 0x120CD00 ;Tweak version 1.1.1
.dw 0x00060000
.dw 0x11010041
.dw 0x08000000
.dd 0x0C0000008040CD20
.dw 0x09000000

.orga 0x120CD20
ADDIU SP, SP, 0xFFE8
SW RA, 0x14(SP)

LUI T0, 0x8036
LW T0, 0x1160(T0) ;loads object B Param 1
LB T0, 0x188(T0)

LUI T1, 0x8033
SH T0, 0xDDF4(T1) ;current save file is set to object's B Param 1,    File A =1, File B =2, File C =3, File D =4

LW RA, 0x14(SP)
JR RA
ADDIU SP, SP, 0x18

.orga 0x9E8C4
JAL 0x8040CE00

.orga 0x120CE00
ADDIU SP, SP, 0xFFE8
SW RA, 0x14(SP)

LUI T0, 0x8036
SW A0, 0x7510(T0)
SW A1, 0x7514(T0)

;the next part loads star count of each file and stores it into the empty RAM area in 0x80367500 onwards
ADDIU A0, R0, 0
ADDIU A1, R0, 0
JAL 0x8027A010
ADDIU A2, R0, 24 ;file a

LUI T0, 0x8036
SW V0, 0x7500(T0)

ADDIU A0, R0, 1
ADDIU A1, R0, 0
JAL 0x8027A010
ADDIU A2, R0, 24 ;file b

LUI T0, 0x8036
SW V0, 0x7504(T0)

ADDIU A0, R0, 2
ADDIU A1, R0, 0
JAL 0x8027A010
ADDIU A2, R0, 24 ;file c

LUI T0, 0x8036
SW V0, 0x7508(T0)

ADDIU A0, R0, 3
ADDIU A1, R0, 0
JAL 0x8027A010
ADDIU A2, R0, 24 ;file d

LUI T0, 0x8036
LW T1, 0x7500(T0)
ADDU A3, T1, V0

LW T1, 0x7504(T0) ;these add up the star counts of every file
ADDU A3, A3, T1

LW T1, 0x7508(T0)
ADDU A3, A3, T1

LUI T1, 0x8034
LW A0, 0x7510(T0) ;displays star count
LW A1, 0x7514(T0)
JAL 0x802D62D8
ADDIU A2, T1, 0x83A0

JAL 0x8027A16C
NOP
LUI T0, 0x8036
LW T0, 0x7520(T0) ;basically stores save file flags when files are switched cba to elaborate
OR A0, T0, V0
JAL 0x8027A0A8
NOP

LW RA, 0x14(SP)
JR RA
ADDIU SP, SP, 0x18
