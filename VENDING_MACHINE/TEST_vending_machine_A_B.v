`timescale 1ns / 1ps

module TEST_vending_machine_A_B;
    reg clk, rst;
    reg [1:0] coin;
    reg sel_item;
    wire dispense_A, dispense_B;
    wire [1:0] change;
    
    // Instantiate the vending machine
    vending_machine_A_B uut (
        .clk(clk),
        .rst(rst),
        .coin(coin),
        .sel_item(sel_item),
        .dispense_A(dispense_A),
        .dispense_B(dispense_B),
        .change(change)
    );
    
    // Clock generation (10ns period = 100MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Monitor signals for debugging
    initial begin
        $display("\n========================================");
        $display("  VENDING MACHINE SIMULATION START");
        $display("========================================");
        $display("Time(ns) | State | Coin | Sel | DispA | DispB | Change");
        $display("---------|-------|------|-----|-------|-------|-------");
        $monitor("%7t | %b    | %b   | %b   | %b     | %b     | %b", 
                 $time, uut.state, coin, sel_item, dispense_A, dispense_B, change);
    end
    
    // Test sequence
    initial begin
        // Initialize all inputs
        rst = 1; 
        coin = 2'b00; 
        sel_item = 0; 
        #20;
        
        rst = 0;
        #10;
        
        //==========================================================
        // TEST CASE 1: Insert ?10 ? Select Item A (?10)
        //==========================================================
        $display("\n>>> TEST CASE 1: ?10 coin ? Item A");
        coin = 2'b10;   // Insert ?10
        sel_item = 0;   // Select Item A
        #10; 
        coin = 2'b00;   // No more coins
        #30;
        $display("Expected: DispA=1, DispB=0, Change=00 (No change)");
        
        //==========================================================
        // TEST CASE 2: Insert ?10 + ?5 ? Select Item B (?15)
        //==========================================================
        $display("\n>>> TEST CASE 2: ?10 + ?5 ? Item B");
        coin = 2'b10;   // Insert ?10
        sel_item = 1;   // Select Item B
        #10;
        coin = 2'b01;   // Insert ?5
        #10; 
        coin = 2'b00;   // No more coins
        #30;
        $display("Expected: DispA=0, DispB=1, Change=00 (No change)");
        
        //==========================================================
        // TEST CASE 3: Insert ?10 + ?10 ? Select Item B (?5 change)
        //==========================================================
        $display("\n>>> TEST CASE 3: ?10 + ?10 ? Item B (?20 total)");
        coin = 2'b10;   // Insert ?10
        sel_item = 1;   // Select Item B
        #10;
        coin = 2'b10;   // Insert another ?10
        #10; 
        coin = 2'b00;   // No more coins
        #30;
        $display("Expected: DispA=0, DispB=1, Change=01 (?5 change)");
        
        //==========================================================
        // TEST CASE 4: Insert ?5 + ?10 ? Select Item A (?5 change)
        //==========================================================
        $display("\n>>> TEST CASE 4: ?5 + ?10 ? Item A (?15 total)");
        coin = 2'b01;   // Insert ?5
        #10;
        coin = 2'b10;   // Insert ?10
        sel_item = 0;   // Select Item A
        #10; 
        coin = 2'b00;   // No more coins
        #30;
        $display("Expected: DispA=1, DispB=0, Change=01 (?5 change)");
        
        //==========================================================
        // TEST CASE 5: Insert ?5 + ?5 + ?5 ? Select Item B
        //==========================================================
        $display("\n>>> TEST CASE 5: ?5 + ?5 + ?5 ? Item B");
        coin = 2'b01;   // Insert ?5
        #10;
        coin = 2'b01;   // Insert ?5
        #10;
        coin = 2'b01;   // Insert ?5
        sel_item = 1;   // Select Item B
        #10;
        coin = 2'b00;   // No more coins
        #30;
        $display("Expected: DispA=0, DispB=1, Change=00");
        
        $display("\n========================================");
        $display("  SIMULATION COMPLETE");
        $display("========================================\n");
        $finish;
    end
    
    // Generate VCD file for waveform viewing
    initial begin
        $dumpfile("vending_machine.vcd");
        $dumpvars(0, TEST_vending_machine_A_B);
    end
    
endmodule