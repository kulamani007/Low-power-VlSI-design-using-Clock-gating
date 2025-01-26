`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2024 21:29:46
// Design Name: 
// Module Name: alu_8bit_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu_8bit_tb;

    reg clk, reset, enable;
    reg [3:0] A, B;
    reg [2:0] op;
    wire [3:0] result;
    wire zero;

    alu_8bit uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .A(A),
        .B(B),
        .op(op),
        .result(result),
        .zero(zero)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // Test scenarios
    initial begin
        // Initialize signals
        reset = 1; enable = 0; A = 4'b0; B = 4'b0; op = 3'b0;
        #10 reset = 0; enable = 1;

        // Test ADD operation
        A = 4'b0101; B = 4'b0011; op = 3'b000; #10;

        // Test SUB operation
        A = 4'b1000; B = 4'b0010; op = 3'b001; #10;

        // Test AND operation
        A = 4'b1100; B = 4'b1010; op = 3'b010; #10;

        // Test OR operation
        A = 4'b1100; B = 4'b0011; op = 3'b011; #10;

        // Test Clock Gating Disable
        enable = 0; #10;

        $stop;
    end
endmodule

