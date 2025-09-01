`timescale 1ns / 1ps
module elivator(
input clk,rst,
input [5:0] req_floor,
output reg up,dwn,door,stop,
output [5:0] y
    );
reg [5:0] cf;
always @(posedge clk or posedge rst) begin
if(rst)begin
    cf <= 6'd0;
    up <= 0;
    dwn <= 0;
    door <= 0;
    stop <= 0;
    end
else begin
    if(req_floor<=6'd50) begin
        if (req_floor > cf) begin
            cf <= cf+1;
            up <= 1;
            dwn <= 0;
            door <= 0;
            stop <= 0;
            end
        else if (req_floor < cf) begin
            cf <= cf-1;
            up <= 0;
            dwn <= 1;
            door <= 0;
            stop <= 0;
            end
        else if (req_floor == cf) begin
            up <= 0;
            dwn <= 0;
            door <= 1;
            stop <= 1;
            end 
        end
    end
end
assign y = cf;
endmodule
