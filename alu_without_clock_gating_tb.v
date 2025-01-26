`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.01.2025 22:46:53
// Design Name: 
// Module Name: alu_without_clock_gating_tb
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


module alu_without_clock_gating_tb;

    // Inputs to the ALU
    reg [7:0] A;
    reg [7:0] B;
    reg [2:0] Opcode;
    reg clk;
    reg reset;

    // Outputs from the ALU
    wire [7:0] Result;
    wire Carry;
    wire Zero;

    // Instantiate the ALU module
    alu_without_clock_gating uut (
        .A(A),
        .B(B),
        .Opcode(Opcode),
        .clk(clk),
        .reset(reset),
        .Result(Result),
        .Carry(Carry),
        .Zero(Zero)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns clock period
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        A = 0;
        B = 0;
        Opcode = 3'b000;  // Default to addition
        reset = 1;

        // Apply reset
        #10 reset = 0;

        // Test addition
        #10 A = 8'b00001101;  // 13
             B = 8'b00000110;  // 6
             Opcode = 3'b000;  // A + B

        // Test subtraction
        #10 A = 8'b00001101;  // 13
             B = 8'b00000110;  // 6
             Opcode = 3'b001;  // A - B

        // Test AND
        #10 A = 8'b10101010;  // 170
             B = 8'b11001100;  // 204
             Opcode = 3'b010;  // A & B

        // Test OR
        #10 Opcode = 3'b011;  // A | B

        // Test XOR
        #10 Opcode = 3'b100;  // A ^ B

        // Test Left Shift
        #10 A = 8'b00001111;  // 15
             Opcode = 3'b101;  // A << 1

        // Test Right Shift
        #10 Opcode = 3'b110;  // A >> 1

        // Test Comparison
        #10 A = 8'b00001101;  // 13
             B = 8'b00001101;  // 13
             Opcode = 3'b111;  // A == B

        // Finish simulation
        #20 $stop;
    end

    // Monitor output
    initial begin
        $monitor("Time = %0t | A = %b | B = %b | Opcode = %b | Result = %b | Carry = %b | Zero = %b",
                 $time, A, B, Opcode, Result, Carry, Zero);
    end

endmodule
