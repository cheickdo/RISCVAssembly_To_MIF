# RISCVAssembly_To_MIF

Converts RISCV assembly into 32bit machine code MIF file in a word addressable format

After compilation the assembler can be run using:
assembler -[optional args] -f <filename.asm>

Where the args includes
-m: outputs an additional BINARY.mc file containing string of binary files
-f: must be followed by input assembly file 