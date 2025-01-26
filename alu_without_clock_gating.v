`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.01.2025 22:43:37
// Design Name: 
// Module Name: alu_without_clock_gating
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


module alu_without_clock_gating (
    input [7:0] A,
    input [7:0] B,
    input [2:0] Opcode,
    input clk,
    input reset,
    output reg [7:0] Result,
    output reg Carry,
    output reg Zero
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            Result <= 8'b0;
            Carry <= 0;
            Zero <= 0;
        end else begin
            case (Opcode)
                3'b000: {Carry, Result} <= A + B;          // Addition
                3'b001: {Carry, Result} <= A - B;          // Subtraction
                3'b010: Result <= A & B;                   // AND
                3'b011: Result <= A | B;                   // OR
                3'b100: Result <= A ^ B;                   // XOR
                3'b101: Result <= A << 1;                  // Left Shift
                3'b110: Result <= A >> 1;                  // Right Shift
                3'b111: Result <= (A == B) ? 8'b1 : 8'b0;  // Comparison
                default: Result <= 8'b0;
            endcase
            Zero <= (Result == 8'b0);
        end
    end
endmodule

