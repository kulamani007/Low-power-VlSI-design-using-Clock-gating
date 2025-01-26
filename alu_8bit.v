`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2024 21:27:46
// Design Name: 
// Module Name: alu_8bit
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

module alu_8bit (
    input wire clk,          // Main clock signal
    input wire reset,        // Reset signal
    input wire enable,       // Clock gating enable signal
    input wire [3:0] A,      // Operand A
    input wire [3:0] B,      // Operand B
    input wire [2:0] op,     // Operation select (e.g., 000: ADD, 001: SUB, etc.)
    output reg [3:0] result, // ALU result
    output reg zero          // Zero flag
);

    // Gated clock signal
    wire gated_clk;
    assign gated_clk = clk & enable;

    // ALU Operation
    always @(posedge gated_clk or posedge reset) begin
        if (reset) begin
            result <= 4'b0;
            zero <= 1'b0;
        end else begin
            case (op)
                3'b000: result <= A + B;       // ADD
                3'b001: result <= A - B;       // SUB
                3'b010: result <= A & B;       // AND
                3'b011: result <= A | B;       // OR
                3'b100: result <= ~A;          // NOT
                3'b101: result <= A ^ B;       // XOR
                3'b110: result <= A << 1;      // Logical Left Shift
                3'b111: result <= A >> 1;      // Logical Right Shift
                default: result <= 4'b0;
            endcase
            zero <= (result == 4'b0); // Set zero flag
        end
    end

endmodule


