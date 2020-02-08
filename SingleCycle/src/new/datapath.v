`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/02/2020 02:00:58 AM
// Design Name: 
// Module Name: datapath
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
`include "immgen.v"
`include "regfile.v"
`include "alu.v"

module datapath(
    input clk, reset, 
    input memtoreg, pcsrc, alusrc, regwrite,
    input [3:0] alu_operation,
    output zero,
    output [31:0] pc,
    input [31:0] instruction,
    output [31:0] alu_result, read_data2,
    input  [31:0] read_data
    );
    
    reg [31:0] pre_pc;
    
    wire [4:0] writereg;
    wire [31:0] pcnext, pcplus4, pcbranch;
    wire [31:0] read_data1, select_data;
    wire [31:0] result;
    
    wire [31:0] imm32, imm32_shiftleft1;
    
    wire branch_en;
    wire [2:0] funct3;
    
    assign funct3 = {instruction[12+:3]};
    
    immgen igen(instruction, imm32);
    
    
    
    /*
    assign imm32_shiftleft1 = {imm32[30:0], 1'b0};
    
    assign pcbranch = pc + imm32_shiftleft1;
    
    assign pcplus4 = pc + 32'b100;
    
    assign pcnext = pcsrc ? pcbranch : pcplus4;
    
    always @(posedge clk, posedge reset)begin
        if(reset) pc <= 0;
        else begin
            if(pcsrc)
                pc <= pcbranch;
            else pc <= pcplus4;
        end
    end
    */
    
    regfile rf(clk, regwrite,
                instruction[19:15], instruction[24:20], instruction[11:7],
                result,
                read_data1, read_data2);
  
    assign select_data = alusrc ? imm32 : read_data2;
    
    branchcomp brcm(read_data1, read_data2, funct3, branch_en);
    
    pcbranch pcbr(clk, reset, imm32, pcsrc, branch_en, pc);
    
    alu alu(alu_operation, read_data1, select_data, alu_result, zero);
    
    assign result = memtoreg ? read_data : alu_result;
    
endmodule
