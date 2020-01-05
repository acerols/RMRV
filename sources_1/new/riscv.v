`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/02/2020 02:20:52 AM
// Design Name: 
// Module Name: riscv
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
`include "controller.v"
`include "datapath.v"

module riscv(
    input   clk, reset,
    output [31:0] pc,
    input [31:0] instruction,
    output memwrite,
    output [31:0] alu_result, write_data,
    input [31:0] read_data
    );
    
    wire            memtoreg, pcsrc, zero, alusrc, regwrite;
    wire [3:0]     alu_operation;
    
    controller  c(instruction[6:0],
                  instruction[14:12],
                  instruction[31:25],
                  zero,
                  memtoreg, memwrite, memread,
                  pcsrc,
                  alusrc, regwrite,
                  alu_operation);
    
    datapath    dp(clk, reset,
                   memtoreg, pcsrc,
                   alusrc, 
                   regwrite,
                   alu_operation,
                   zero,
                   pc,
                   instruction,
                   alu_result,
                   write_data,
                   read_data);
    
endmodule
