`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/10 17:44:35
// Design Name: 
// Module Name: pc
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


module pc(
    input logic clk, reset,
    input logic [31:0]instr,
    input logic pcjr,
    output logic[31:0]pc,
    output logic [31:0]pcnext
    );
    logic [31:0] pcplus4;
    
    flopr #(32) pcreg(clk, reset, pcnext, pc);
    adder       pcadd1(pc, 32'b100, pcplus4);
    mux2  #(32) pubrmux(pcplus4, 32'b0, pcjr, pcnext);
    
endmodule
