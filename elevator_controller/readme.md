# Elevator Controller

## Overview
The Elevator Controller is a simple digital system designed in Verilog HDL to simulate the real-world operation of an elevator. When reset, the elevator starts at the ground floor. Upon receiving a floor request, it compares the requested floor with the current floor and moves step by step until the request is fulfilled. Once it reaches the requested floor, it stops and opens the door.

## Theory
- If requested floor > current floor → Elevator moves up.  
- If requested floor < current floor → Elevator moves down.  
- If requested floor == current floor → Elevator stops and opens door.  

This design demonstrates digital logic decision-making and control using Verilog HDL.

## Project Files
- `elevator.v` → Verilog implementation  
- `elevator_tb.v` → Testbench for simulation  
