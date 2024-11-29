START: jal x1, PROGRAM #branch to program
TRAP: addi x2, x0, 3
slli x2, x2, 8 
addi x2, x2, 4
slli x2, x2, 2
sw x0, 0(x2) #disable timer interrupts
mtvec
PROGRAM:addi x2, x0, 3
slli x2, x2, 8 
addi x2, x2, 5
slli x2, x2, 2
addi x3, x0 ,4
sw x3, 0(x2) #write to mtvec to point to TRAP table
MSTATUS_W: addi x5 x0, 1
slli x5, x5, 3
addi x2, x0, 3
slli x2, x2, 8 
slli x2, x2, 2
sw x5, 0(x2) #write to mstatus to enable interrupts
MIE_W: addi x5 x0, 1
slli x5, x5, 7
addi x2, x0, 3
slli x2, x2, 8 
addi x2, x2, 4
slli x2, x2, 2
sw x5, 0(x2) #write to mie to enable timer interrupt
TIMECMP_W:addi x5, x0, 64
addi x4, x0, 8
slli x4, x4, 8
slli x4, x4, 2
sw x5, 0(x4) #write to timecmp
srli x4, x4, 2
addi x4, x4, 1
slli x4, x4, 2
sw x0, 0(x4) #write to timecmph
LOOP:addi x2, x0, 1
jal x1, LOOP