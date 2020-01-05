`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2019 07:21:18 PM
// Design Name: 
// Module Name: immgen
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


module immgen(
    input [31:0]        inst,
    output reg [31:0]   imm
    );
    
    wire [31:0] imm_i, imm_s, imm_b;
    
    assign imm_i = { {20{inst[31]}}, inst[20+:12]};
    assign imm_s = { {20{inst[31]}}, inst[25+:7], inst[7+:5]};
    assign imm_b = { {19{inst[31]}}, inst[31], inst[7], inst[25+:6], inst[8+:4], 1'b0};
    
    always @(*) begin
        case (inst[6:2])
            5'b00000 : imm = imm_i;
            5'b00100 : imm = imm_i;
            5'b01000 : imm = imm_s;
            5'b11000 : imm = imm_b;
            default : imm = 32'bx;
        endcase
    end
    
endmodule
