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

module controller(
    input logic clk, reset,
    input logic [6:0] opcode,
    input logic [2:0] funct3,
    input logic [6:0] funct7,
    input logic flush,
    output logic memToRegD, memWriteD, memReadD,
    output logic memValid,
    output logic branch,
    output logic alusrcD, regWriteD,
    output logic [3:0] alucontrolD
    );
    
    logic   [1:0] aluop;
    
    controlunit     ctrl(opcode, alusrcD, memToRegD, regWriteD, memReadD, memWriteD, branch, aluop);
    alucontrolunit  aluctrl(aluop, funct3, funct7, alucontrolD);
    

    assign memValid = (opcode == 7'h03) | (opcode == 7'h23);

    
    
    
endmodule
