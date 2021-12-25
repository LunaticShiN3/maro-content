.orga 0x21B408 ;;;just overwrite some stupid behavior;;;

.dw 0x00060000 ;;;Start behavior script;;;
.dw 0x11014001 ;;;Load and or;;;
.dw 0x08000000 ;;;idk what this does;;;
.dd 0x0C0000008040F600 ;;;Load asm function from address;;;
.dw 0x09000000 ;;;End behavior script;;;
.dd 0x0101010101010101 ;;;Empty space;;;

.orga 0x120F600
ADDIU SP, SP, 0xFFE8 ;;;function wrapper start;;;
SW RA, 0x14(SP)

LUI T0, 0x8034
ADDIU T0, T0, 0xB218
ADDIU T1, R0, 0
SH T1, 0(T0)

LW RA, 0x14(SP)
JR RA
ADDIU SP, SP, 0x18 ;;;function wrapper end;;;
