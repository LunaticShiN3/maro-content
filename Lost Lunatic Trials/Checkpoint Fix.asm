.orga 0x7E69E0
ADDIU SP, SP, 0xFFE8
SW RA, 0x14(SP)

LUI A0, 0x8036
LW A1, 0x1158(A0)
JAL 0x802A1424
LW A0, 0x1160(A0)
BEQZ V0, Branch1 ;0x7CC80C ;checks if collided with object
NOP

LUI A0, 0x8036
LW A0, 0x1160(A0)
LW T2, 0x144(A0)
BNEZ T2, Branch2 ;0x7CC7DC ;checks if subtype is 0
NOP

LUI AT, 0x8040
ADDIU T3, R0, 1
LW A3, 0x10(AT) ;loads checkpoint state for later use
SW T3, 0x10(AT) ;sets checkpoint to enabled state

LWC1 F2, 0xA0(A0)
SWC1 F2, 0x14(AT)
LWC1 F2, 0xA4(A0) ;stores checkpoint XYZ position in RAM
SWC1 F2, 0x18(AT)
LWC1 F2, 0xA8(A0)
SWC1 F2, 0x1C(AT)

LUI T3, 0x8034
LUI T4, 0x8036
LB T5, 0xB249(T3)
SB T5, 0x7750(T4) ;stores current level and area
LB T5, 0xB24A(T3)
SB T5, 0x7751(T4)

LUI T1, 0x8060
LUI AT, 0xB886
ORI AT, AT, 0xBFF
SW AT, 0x4400(T1) ;no idea what any of this does
LUI AT, 0x4818
ORI AT, AT, 0x1FF
SW AT, 0x4408(T1)

BNEZ A3, Branch1 ;0x7CC80C checks if checkpoint is enabled
NOP

LUI A0, 0x306A
JAL 0x802CA144
ORI A0, A0, 0x81 ;makes checkpoint sound
B Branch1 ;0x7CC80C
NOP

Branch2:
LUI AT, 0x8040
SW R0, 0x14(AT)
SW R0, 0x18(AT)
SW R0, 0x1C(AT)
SW R0, 0x10(AT)
LUI T1, 0x8060 ;resets checkpoint state and positions
LUI AT, 0xFFFF
ORI AT, AT, 0xFFFF
SW AT, 0x4400(T1)
LUI AT, 0x7F7F
ORI AT, AT, 0x7FFF
SW AT, 0x4408(T1)

LUI T4, 0x8036
SH R0, 0x7750(T4) ;resets stored level and area

Branch1:
LUI A0, 0x8036
LW A0, 0x1160(A0)
LW T2, 0x144(A0)
SW R0, 0x9C(A0)
SW R0, 0x134(A0)
LUI AT, 0x42C8
SW AT, 0x1F8(A0)
LUI AT, 0x441C
SW AT, 0x1FC(A0)
BEQZ T2, Branch3 ;0x7CC84C ;check if subtype is 0
NOP

LUI AT, 0x441C
SW AT, 0x1F8(A0)
LUI AT, 0x8000 ;no idea what any of this does
SW AT, 0x130(A0)
SW R0, 0x14(A0)

Branch3:
BNEZ T2, Branch4 ;0x7CC898 ;check if subtype is 0
NOP

LW T2, 0x154(A0)
BNEZ T2, Branch4 ;0x7CC898 ;check if obj timer is 0 so it only happens once
NOP

LUI AT, 0x8040
LW T2, 0x10(AT) ;check if checkpoint is in active state
BEQZ T2, Branch4 ;0x7CC898

LUI T3, 0x8034
LUI T4, 0x8036
LB T5, 0xB249(T3)
LB T6, 0x7750(T4) ;checks current level and area 
BNE T5, T6, Branch4
NOP
LB T5, 0xB24A(T3)
LB T6, 0x7751(T4)
BNE T5, T6, Branch4
NOP

LUI T4, 0x8034
LWC1 F2, 0x14(AT)
LUI T6, 0x42C8
MTC1 T6, F4
ADD.S F2, F2, F4
SWC1 F2, 0xB1AC(T4)
LWC1 F2, 0x18(AT)
SWC1 F2, 0xB1B0(T4) ;set mario's xyz position to stored values
LWC1 F2, 0x1C(AT)
SWC1 F2, 0xB1B4(T4)

Branch4:
LW RA, 0x14(SP)
JR RA
ADDIU SP, SP, 0x18
