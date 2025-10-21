`timescale 1ns / 1ps

module vending_machine_A_B (
    input clk,
    input rst,
    input [1:0] coin,      // 00->No coin, 01->?5, 10->?10
    input sel_item,        // 0 -> Item A (?10), 1 -> Item B (?15)
    output reg dispense_A,
    output reg dispense_B,
    output reg [1:0] change
);
    parameter S0  = 2'b00;
    parameter S5  = 2'b01;
    parameter S10 = 2'b10;
    parameter S15 = 2'b11;
    
    reg [1:0] state, next_state;
    reg [4:0] total_money;  // Track exact amount (up to ?20)
    reg transaction_done;
    
    // Sequential: State and money tracking
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= S0;
            total_money <= 5'd0;
            transaction_done <= 0;
        end
        else begin
            state <= next_state;
            
            // Update total money based on coin input
            if (state == S0 && coin == 2'b00) begin
                total_money <= 5'd0;
                transaction_done <= 0;
            end
            else if (coin == 2'b01 && !transaction_done) begin
                total_money <= total_money + 5'd5;
            end
            else if (coin == 2'b10 && !transaction_done) begin
                total_money <= total_money + 5'd10;
            end
            
            // Mark transaction as done when dispensing
            if ((state == S10 || state == S15) && coin == 2'b00 && 
                (sel_item == 0 || sel_item == 1)) begin
                transaction_done <= 1;
            end
        end
    end
    
    // Combinational: Next state logic
    always @(*) begin
        next_state = state;
        
        case (state)
            S0: begin
                if (coin == 2'b01)      next_state = S5;
                else if (coin == 2'b10) next_state = S10;
            end
            
            S5: begin
                if (coin == 2'b01)      next_state = S10;
                else if (coin == 2'b10) next_state = S15;
            end
            
            S10: begin
                if (coin == 2'b01)      next_state = S15;
                else if (coin == 2'b10) next_state = S15;
                else if (coin == 2'b00 && sel_item == 0 && !transaction_done)
                    next_state = S0;  // Dispense Item A
            end
            
            S15: begin
                if (coin == 2'b00 && !transaction_done)
                    next_state = S0;  // Dispense based on selection
            end
        endcase
    end
    
    // Sequential: Output generation
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            dispense_A <= 0;
            dispense_B <= 0;
            change <= 2'b00;
        end
        else begin
            // Default: clear outputs
            dispense_A <= 0;
            dispense_B <= 0;
            change <= 2'b00;
            
            // Generate outputs when transitioning to S0 (dispensing)
            if (next_state == S0 && (state == S10 || state == S15) && !transaction_done) begin
                
                // Item A selected (?10)
                if (sel_item == 0) begin
                    dispense_A <= 1;
                    // Give change if overpaid
                    if (total_money == 5'd15) begin
                        change <= 2'b01;  // ?5 change
                    end
                    else if (total_money >= 5'd20) begin
                        change <= 2'b10;  // ?10 change
                    end
                end
                
                // Item B selected (?15)
                else if (sel_item == 1) begin
                    dispense_B <= 1;
                    // Give change if overpaid
                    if (total_money == 5'd20) begin
                        change <= 2'b01;  // ?5 change
                    end
                    else if (total_money >= 5'd25) begin
                        change <= 2'b10;  // ?10 change
                    end
                end
            end
        end
    end
    
endmodule