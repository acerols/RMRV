`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/02/2020 09:13:43 PM
// Design Name: 
// Module Name: pcbranch
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


module pcbranch(
    input logic clk, reset, ene,
    input logic [31:0] jump_address, pcPlus4F,
    input logic branch,
    input logic branchEn,
    output logic [31:0] pcNext
    );
    
    logic [31:0] pc_reg = 0;
    logic [31:0] _pc;
    logic [2:0]fuct3;
    logic [31:0] pcnext, pcbranch;
    logic [31:0] imm32_shiftleft1;
    
    assign imm32_shiftleft1 = {jump_address[30:0], 1'b0};
    assign pcbranch = pc + imm32_shiftleft1;
    
    always @* begin
        if(ene)begin
            if(branchEn) _pc <= pcbranch;
            else _pc <= pcplus4;
        end
    end

    always @(posedge clk) begin
        pcNext <= _pc;
    end
    
    
endmodule
