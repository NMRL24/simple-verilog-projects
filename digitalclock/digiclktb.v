`timescale 1ns / 1ps
module digiclktb;
reg clk,rst;
wire [5:0]s,m;
wire [4:0]h;
digiclk DUT (
.clk(clk),
.rst(rst),
.s(s),
.m(m),
.h(h));
initial begin
clk=0;rst=1;#10;rst=0;
end
always #5 clk=~clk;
endmodule