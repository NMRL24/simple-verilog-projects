`timescale 1ns / 1ps
module test101sequence;
reg clk,rst,x;
wire y;
sequence_detector DUT(
.clk(clk),
.rst(rst),
.x(x),
.y(y));
initial begin
x=0;clk=0;rst=1;#20;rst=0;
end
always #5 clk =~clk;
always #10 x=~x;
endmodule