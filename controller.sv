`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/10 15:48:55
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
    input logic [31:0]instr,
    output logic regwrite,
    output logic funcout,
    output logic [2:0]alucontrol
    );
    
    
    
    aludec aludec(instr[31:25], regwrite, alucontrol);
    maindec maindec(instr[6:0], funcout);
    
    
endmodule
