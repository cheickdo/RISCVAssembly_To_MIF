START: addi x1, x0, 1
slli x2, x1, 14
addi x8, x0, 511
addi x9, x0, 1
jal x1, CLEARSCREEN
INF: add x1, x0, x0
jal x1, INF
CLEARSCREEN: addi x7, x0, 60
VERTICAL: addi x6, x0, 60
addi x3, x0, 0
addi x4, x0, 15
PRINT: sw x6, 0(x2)
sw x7, 4(x2)
sw x8, 8(x2)
sw x9, 12(x2)
sw x0, 12(x2)
addi x3, x3, 1
DONE:addi x0, x0, 1
jal x1, DONE