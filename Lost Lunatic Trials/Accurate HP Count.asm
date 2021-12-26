.orga 0x9E8EC
JAL 0x80406B50
NOP

.orga 0x1206B50
ADDIU SP, SP, 0xFFE8
SW RA, 0x14(SP)

LUI T0, 0x8034
ADDIU T1, T0, 0xB170 ;load hp counter both bytes
LH A3, 0xAE(T1)

ADDIU T2, R0, 0xFF
BLE A3, T2, Hug4 ;branch to end if hp is less than/equal to 255
NOP

ANDI A3, A3, 0xFF ;removes upper byte

ADDIU T2, R0, 99
BLE A3, T2, LessThanThree ;all this garbage sets x position depending on how many digits the number has, cba to comment everything 
NOP

ADDIU A0, R0, 0x18
B Done ;all this garbage sets x position depending on how many digits the number has, cba to comment everything
NOP

LessThanThree:
ADDIU T2, R0, 9
BLE A3, T2, LessThanTwo ;all this garbage sets x position depending on how many digits the number has, cba to comment everything
NOP

ADDIU A0, R0, 0x1E
B Done ;all this garbage sets x position depending on how many digits the number has, cba to comment everything
NOP

LessThanTwo:
ADDIU A0, R0, 0x24 ;all this garbage sets x position depending on how many digits the number has, cba to comment everything

Done:
ADDIU A1, R0, 0x0 ;set y pos
JAL 0x802D62D8 ;print hud number function
ADDIU A2, T0, 0x83A0 ;A2 meme number that is always the same

Hug4:
LW RA, 0x14(SP)
JR RA
ADDIU SP, SP, 0x18
