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
    input logic zero,
    output logic regwrite,
    output logic [3:0]funcout,
    output logic [2:0]alucontrol
    );
    
    maindec md(instr[6:0], regwrite, funcout);
    aludec ad(.func3(instr[11:7]), .func7(instr[31:25]), 
        .instr_type(funcout),
        .alucontrol1(alucontrol1), .alucontrol2(alucontrol2));

    
endmodule
