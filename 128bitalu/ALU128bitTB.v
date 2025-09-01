`timescale 1ns / 1ps
module ALU128bitTB;
reg  [127:0] A, B;
reg  [3:0]   ALU_Sel;
wire [127:0] Result;
wire Zero, CarryOut, Overflow, Negative, AuxCarry;

ALU128BIT DUT (
    .IP1(A),
    .IP2(B),
    .ALU_Sel(ALU_Sel),
    .Result(Result),
    .Zero(Zero),
    .CarryOut(CarryOut),
    .Overflow(Overflow),
    .Negative(Negative),
    .AuxCarry(AuxCarry));

initial begin
    ALU_Sel = 4'd0;
    A = 128'd25; B = 128'd17;       #10;
    A = 128'd10; B = -128'd10;      #10;
    A = 128'd10; B = -128'd20;      #10;
    A = 128'd8;  B = 128'd8;        #10;
    A = 128'hFFFFFFFF_FFFFFFFF_FFFFFFFF_FFFFFFFF; B = 128'd1; #10;
    A = 128'h7FFFFFFF_FFFFFFFF_FFFFFFFF_FFFFFFFF; B = 128'd1; #10;

    ALU_Sel = 4'd1;
    A = 128'd100; B = 128'd55;      #10;
    A = 128'd55;  B = 128'd100;     #10;
    A = 128'd20;  B = 128'd5;       #10;
    A = 128'h80000000_00000000_00000000_00000000; B = 128'd1; #10;

    ALU_Sel = 4'd2;
    A = 128'd255; B = 128'd170;     #10;

    ALU_Sel = 4'd3;
    A = 128'd170; B = 128'd85;      #10;

    ALU_Sel = 4'd4;
    A = 128'd255; B = 128'd170;     #10;

    ALU_Sel = 4'd5;
    A = 128'd0; B = 128'd0;         #10;

    ALU_Sel = 4'd6;
    A = 128'd10; B = 128'd0;        #10;

    ALU_Sel = 4'd7;
    A = 128'd10; B = 128'd0;        #10;

    #20 $stop;
end

endmodule