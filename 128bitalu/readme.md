# 128-Bit Arithmetic and Logic Unit (ALU)

## Overview
The 128-bit ALU is a high-performance Verilog module capable of performing a wide range of arithmetic and logical operations. It is controlled by a 4-bit selection input and includes essential status flags to ensure reliable operation.

## Theory
Supported operations:
- Arithmetic: ADD, SUBTRACT  
- Logic: AND, OR, XOR, NOT  
- Shift: LEFT, RIGHT  
- Rotate: LEFT, RIGHT  

Status flags:
- Zero, Negative, CarryOut, Overflow, Auxiliary Carry  

This design is applicable to high-speed processors, encryption systems, and embedded applications.

## Project Files
- `alu128bit.v` → Verilog implementation  
- `alu128bit_tb.v` → Testbench for simulation  
