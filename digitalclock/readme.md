# Digital Clock

## Overview
The Digital Clock is a sequential circuit designed in Verilog to display time in hours, minutes, and seconds. It counts seconds and rolls over to minutes and hours as appropriate. The design includes reset functionality for reinitializing the clock.

## Theory
- Uses a reference clock signal to increment seconds.  
- When seconds reach 60, they reset and increment minutes.  
- When minutes reach 60, they reset and increment hours.  
- When hours reach 24, they reset, completing a day cycle.  

This system illustrates time-keeping using counters and sequential logic.

## Project Files
- `digiclk.v` → Verilog implementation  
- `digiclk_tb.v` → Testbench for simulation  
