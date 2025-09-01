# Sequence Detector (101)

## Overview
This project implements a synchronous, non-overlapping Mealy FSM in Verilog to detect the binary sequence `101`. The FSM transitions through states based on input and outputs `1` when the sequence is detected.

## Theory
- State `s1`: Waiting for `1`  
- State `s2`: Received `1`  
- State `s3`: Received `10`  
- Output `y = 1` when `101` is detected  

Non-overlapping property ensures one detected sequence does not contribute to another.

## Project Files
- `seq_detector.v` → Verilog implementation  
- `seq_detector_tb.v` → Testbench for simulation  
