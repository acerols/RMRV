`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/10 15:57:12
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


module datapath(
    input logic clk, reset,
    input logic [31:0]instr,
    input logic funcout,
    input logic [2:0]alucontrol,
    output logic [31:0] pc,
    output logic [31:0]aluout
    );
    
    logic [31:0]srca, srcb, srcbranch;
    
    pc          pcreg(clk, reset, 1'b0, 30'b0, pc);
    regfile     rf(clk, instr[19:15], instr[20:24], instr[7:11], aluout, 1'b1, srca, srcb);
    mux2 #(32)  brsrcb(srcb, {20'b0, instr[31:20]}, funcout, srcbranch);
    
    
    
    
    
endmodule
