`timescale 1ns / 1ps
module digiclk (
input clk,rst,
output reg [5:0] s,m,
output reg [4:0] h   );
always @(posedge clk or posedge rst) begin
if (rst) begin
            s<=6'd0;
            m<=6'd0;
            h<=5'd0;
            end
else    begin
        s<=s+1;
        if (s == 6'd59) begin
            s<=0;
            m<=m+1;
            if (m == 6'd59) begin
                m<=0;
                h<=h+1;
                if (h == 5'd23) begin
                    h <=0;
                    end
                end
         end                       
        end
end
endmodule
