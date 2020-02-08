`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/02/2020 01:44:40 AM
// Design Name: 
// Module Name: controller
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
`include "control.v"
`include "alucontrol.v"


module controller(
    input [6:0] opcode,
    input [2:0] funct3,
    input [6:0] funct7,
    input zero,
    output memtoreg, memwrite, memread,
    output pcsrc,
    output alusrc, regwrite,
    output [3:0] alucontrol
    );
    
    wire [1:0] aluop;
    wire       branch;
    
    controlunit     ctrl(opcode, alusrc, memtoreg, regwrite, memread, memwrite, branch, aluop);
    alucontrolunit  aluctrl(aluop, funct3, funct7, alucontrol);
    
    assign pcsrc  = branch & zero;
    
    
endmodule
