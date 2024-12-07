START: addi x2, x0, 2
addi x3, x0, 3
addi x4, x0, 4
fcvt.s.w x1, x2
fcvt.s.w x2, x3
fcvt.s.w x3, x4
fmadd.s x4, x1, x2, x3
fmsub.s x4, x1, x2, x3
fnmadd.s x4, x1, x2, x3
fnmsub.s x4, x1, x2, x3
addi x2, x0, 4
addi x2, x0, 71
addi x2, x0, 71
