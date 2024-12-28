.data
var1: .word 0x02FAF080
var2: .word 0xFD050F80
.text
START: jal x1, VGA_INIT #branch to program
TRAP: addi x2, x0, 3
slli x2, x2, 8 
addi x2, x2, 4
slli x2, x2, 2
sw x0, 0(x2) #disable timer interrupts
PRINT: sw x16, 0(x12)
sw x17, 4(x12)
sw x18, 8(x12)
sw x19, 12(x12)
sw x0, 12(x12)
addi x16, x16, 1
addi x17, x17, 1
READMTIME: addi x7, x0, 15
slli x7, x7, 8
addi x7, x7, 1
slli x7, x7, 2
lw x8, 0(x7) #write mtime and mtimeh to registers
lw x9, 512(x7) 
lw x20 var2
lw x10 var1
NOOVERFLOW: bge x8, x20, OVERFLOW
add x8, x8, x10
sw x8, 0(x4)
sw x9, 4(x4)
sw x5, 0(x2) #enable timer interrupts
mtvec
OVERFLOW: add x8, x8, x10
addi x9, x9, 1
sw x8, 0(x4)
sw x9, 4(x4)
sw x5, 0(x2) #enable timer interrupts
mtvec
VGA_INIT: addi x11, x0, 1
slli x12, x11, 14
addi x18, x0, 511
addi x19, x0, 1
addi x16, x0, 10
addi x17, x0, 10
PROGRAM: addi x2, x0, 3
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
TIMECMP_W:addi x6, x0, 512
addi x4, x0, 8
slli x4, x4, 8
slli x4, x4, 2
sw x6, 0(x4) #write to timecmp
sw x0, 4(x4) #write to timecmph
MIE_W: addi x5 x0, 1
slli x5, x5, 7
addi x2, x0, 3
slli x2, x2, 8 
addi x2, x2, 4
slli x2, x2, 2
sw x5, 0(x2) #write to mie to enable timer interrupt
LOOP:addi x2, x0, 1
jal x1, LOOP