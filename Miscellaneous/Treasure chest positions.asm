.orga 0x21E280
.dw 0x8040F680

.orga 0x120F680
ADDIU SP, SP, -0x20
SW RA, 0x1C(SP)

ADDIU T6, R0, 0
SW T6, 0x10(SP)

ADDIU A0, R0, 1
ADDIU A1, R0, -503 ;Treasure chest #1 X position
MTC1 A1, F4
CVT.S.W F4, F6
MFC1 A1, F6
ADDIU A2, R0, -630 ;Treasure chest #1 Y position
MTC1 A1, F4
CVT.S.W F4, F6
MFC1 A1, F6
ADDIU A3, R0, -400 ;Treasure chest #1 Z position
MTC1 A1, F4
CVT.S.W F4, F6
MFC1 A1, F6
JAL 0x802F7F1C
NOP

ADDIU T7, R0, 57344
SW T7, 0x10(SP)

ADDIU A0, R0, 2
ADDIU A1, R0, 743 ;Treasure chest #2 X position
MTC1 A1, F4
CVT.S.W F4, F6
MFC1 A1, F6
ADDIU A2, R0, -630 ;Treasure chest #2 Y position
MTC1 A1, F4
CVT.S.W F4, F6
MFC1 A1, F6
ADDIU A3, R0, -2117 ;Treasure chest #2 Z position
MTC1 A1, F4
CVT.S.W F4, F6
MFC1 A1, F6
JAL 0x802F7F1C
NOP

ADDIU T8, R0, 40960
SW T8, 0x10(SP)

ADDIU A0, R0, 3
ADDIU A1, R0, 800 ;Treasure chest #3 X position
MTC1 A1, F4
CVT.S.W F4, F6
MFC1 A1, F6
ADDIU A2, R0, -630 ;Treasure chest #3 Y position
MTC1 A1, F4
CVT.S.W F4, F6
MFC1 A1, F6
ADDIU A3, R0, 1169 ;Treasure chest #3 Z position
MTC1 A1, F4
CVT.S.W F4, F6
MFC1 A1, F6
JAL 0x802F7F1C
NOP

ADDIU T9, R0, 8192
SW T9, 0x10(SP)

ADDIU A0, R0, 4
ADDIU A1, R0, -777 ;Treasure chest #4 X position
MTC1 A1, F4
CVT.S.W F4, F6
MFC1 A1, F6
ADDIU A2, R0, -630 ;Treasure chest #4 Y position
MTC1 A1, F4
CVT.S.W F4, F6
MFC1 A1, F6
ADDIU A3, R0, -1736 ;Treasure chest #4 Z position
MTC1 A1, F4
CVT.S.W F4, F6
MFC1 A1, F6
JAL 0x802F7F1C
NOP

LUI T1, 0x8036
LW T1, 0x1160(T1)
ADDIU T0, R0, 1

SW T0, 0xF4(T1)
LUI T3, 0x8036
LW T3, 0x1160(T3)
ADDIU T2, R0, 1
SW T2, 0xFC(T3)

B End
NOP
End:

LW RA, 0x1C(SP)
ADDIU SP, SP, 0x20
JR RA
NOP
