
# RISC-V Single Cycle Processor (RV32I)

## Overview

This project implements a basic RV32I Single Cycle Processor using Verilog HDL. The processor executes a subset of the RISC-V instruction set and demonstrates the complete instruction execution flow from instruction fetch to register write-back.

The design was developed and simulated using Xilinx Vivado.

---

## Features

- Program Counter (PC)
- Instruction Memory (ROM)
- Control Unit
- Register File (32 × 32-bit Registers)
- Immediate Generator
- Arithmetic Logic Unit (ALU)
- ALU Source Multiplexer
- Single Cycle Datapath
- Functional Simulation in Vivado

---

## Supported Instructions

| Instruction | Status |
|------------|--------|
| ADDI | ✅ |
| ADD | ✅ |
| SUB | Hardware support available *(can be tested by updating the ROM)* |

---

## Project Structure

```
riscv-single-cycle-processor/
│
├── rtl/
│   ├── alu.v
│   ├── control.v
│   ├── imm_gen.v
│   ├── pc.v
│   ├── reg_file.v
│   ├── rom.v
│   └── riscv_top.v
│
├── sim/
│   └── tb_riscv.v
│
├── results/
│   ├── rtl_schematic.png
│   └── waveform.png
│
└── README.md
```

---

## Simulation

The processor was verified using the following test program:

```assembly
addi x1, x0, 5
addi x2, x0, 10
add  x3, x2, x1
```

Expected Register Values:

| Register | Value |
|----------|------:|
| x1 | 5 |
| x2 | 10 |
| x3 | 15 |

---

## RTL Schematic

<img width="1092" height="612" alt="image" src="https://github.com/user-attachments/assets/a417fcda-94aa-4600-a708-3fb0f6cd55c8" />


---

## Simulation Waveform

<img width="1615" height="907" alt="Screenshot 2026-08-02 131155" src="https://github.com/user-attachments/assets/6c34fd33-8e4b-4cc3-be02-e6408daf51e3" />

---

## Tools Used

- Verilog HDL
- Xilinx Vivado Simulator (XSim)

---

## Future Improvements

- Load Word (LW)
- Store Word (SW)
- Branch Equal (BEQ)
- Jump Instructions
- Complete RV32I Instruction Support

---

## Author

**Yashas U**
