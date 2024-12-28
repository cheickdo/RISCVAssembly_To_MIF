VGA_INIT: addi x11, x0, 1
slli x12, x11, 14
addi x18, x0, 511
addi x19, x0, 1
CLEARSCREEN: addi x17, x0, 240
VERTICAL: sub x17, x17, x19
beq x17, x0, DONE
addi x16, x0, 360
HORIZONTAL: beq x16, x0, VERTICAL
PRINT: sw x16, 0(x12)
sw x17, 4(x12)
sw x18, 8(x12)
sw x19, 12(x12)
sw x0, 12(x12)
sub x16, x16, x19
jal x11, HORIZONTAL
DONE:addi x0, x0, 1
jal x1, DONE