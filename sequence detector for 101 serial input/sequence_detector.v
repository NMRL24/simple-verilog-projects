`timescale 1ns / 1ps
// my sequence is 3bit i.e 101 & i'm using a non overlapping meelay sequence detector 
module sequence_detector(
input clk,rst,x,
output reg y    );
parameter s1=2'd1,s2=2'd2,s3=2'd3;
reg [1:0] CS,NS;
always @(posedge clk or posedge rst)begin
    if (rst)
    begin
    CS<=s1;
    end
    else
    begin
    CS<=NS;
    end
end
always @(CS,x)begin
case (CS)
s1:begin
    if (x) 
    begin
    NS<=s2; 
    end
    else  
    begin 
    NS<=s1;
    end
    y<=0;
    end
s2:begin
    if (x) 
    begin
    NS<=s2; 
    end
    else   
    begin
    NS<=s3;
    end
    y<=0;
    end 
s3:begin
    if (x) begin
    y<=1; end
    else   begin
    y<=0; end
    NS<=s1;
    end
endcase
end
endmodule
