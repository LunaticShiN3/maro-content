.orga 0x93658
LUI T7, 0x8034
LB T7, 0xAFF8(T7)
ANDI T7, T7, 0x0008 ;each of these is for a different dpad direction, I figured them out by trial and error, cba to comment which is which
NOP
BEQZ T7, 0x9367C
NOP

.orga 0x9367C
LUI T1, 0x8034
LB T1, 0xAFF8(T1)
ANDI T1, T1, 0x0004 ;each of these is for a different dpad direction, I figured them out by trial and error, cba to comment which is which
NOP
BEQZ T1, 0x936A0
NOP

.orga 0x936B8
LUI T6, 0x8034
LB T6, 0xAFF8(T6)
ANDI T6, T6, 0x0001 ;each of these is for a different dpad direction, I figured them out by trial and error, cba to comment which is which
NOP
BEQZ T6, 0x936DC
NOP

.orga 0x936DC
LUI T0, 0x8034
LB T0, 0xAFF8(T0)
ANDI T0, T0, 0x0002 ;each of these is for a different dpad direction, I figured them out by trial and error, cba to comment which is which
NOP
BEQZ T0, 0x93700
NOP
