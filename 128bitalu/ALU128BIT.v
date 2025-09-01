`timescale 1ns / 1ps
module ALU128BIT(
    input  [127:0] IP1, IP2,
    input  [3:0]   ALU_Sel,
    output reg [127:0] Result,
    output reg Zero,
    output reg CarryOut,
    output reg Overflow,
    output reg Negative,
    output reg AuxCarry );

    always @(*) begin
       case (ALU_Sel)
            4'b0000: Result = IP1 + IP2;                 // ADD
            4'b0001: Result = IP1 - IP2;                 // SUBTRACT
            4'b0010: Result = IP1 & IP2;                 // AND
            4'b0011: Result = IP1 | IP2;                 // OR
            4'b0100: Result = IP1 ^ IP2;                 // XOR
            4'b0101: Result = ~IP1;                      // NOT
            4'b0110: Result = IP1 << 1;                  // SHIFT LEFT
            4'b0111: Result = IP1 >> 1;                  // SHIFT RIGHT
            4'b1000: Result = {IP1[126:0], IP1[127]};    // ROTATE LEFT
            4'b1001: Result = {IP1[0], IP1[127:1]};      // ROTATE RIGHT
            default: Result = 128'b0;                    // DEFAULT
        endcase

        Zero = (Result == 128'b0);
        Negative = Result[127];

        // -------- Flag Decision Making --------
        case (ALU_Sel)
            4'b0000: begin // ADD
                CarryOut = ({1'b0, IP1} + {1'b0, IP2}) > {1'b0, {128{1'b1}}};
                Overflow = (IP1[127] == IP2[127]) && (Result[127] != IP1[127]);
                AuxCarry = (IP1[3:0] + IP2[3:0]) > 4'hF;
            end
            4'b0001: begin // SUBTRACT
                CarryOut = (IP1 >= IP2);
                Overflow = (IP1[127] != IP2[127]) && (Result[127] != IP1[127]);
                AuxCarry = (IP1[3:0] < IP2[3:0]);
            end
            default: begin // Other Ops
                CarryOut = 1'b0;
                Overflow = 1'b0;
                AuxCarry = 1'b0;
            end
        endcase
    end
endmodule
