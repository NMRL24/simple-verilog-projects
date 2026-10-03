`timescale 1ns / 1ps
module elivatorTB;
reg clk, rst;
reg [5:0] req_floor;
wire up, dwn, door, stop;
wire [5:0] y;
elivator DUT (.clk(clk),.rst(rst),.up(up),.dwn(dwn),.door(door),.req_floor(req_floor),.stop(stop),.y(y));
always #2 clk = ~clk;
initial begin
    clk = 0;
    rst = 1;
    #10 rst = 0;
    req_floor = 6'd10;
    #100;
    req_floor = 6'd3;
    #140;
    $finish;
end
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, elivatorTB);
end
endmodule
