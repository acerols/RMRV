`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/10 15:53:47
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


module riscv(
    input logic clk, reset,
    input logic [31:0]instr,
    output logic [31:0]aluout
    );
    logic [2:0]alucontrol;
    logic funcout;
    logic src1reg_en, src2reg_en, jal, alures2reg, memory2reg, memwrite;


    decoder dc(instr, );

    controller c(clk, reset, instr, funcout, alucontrol);
    datapath dp(clk, reset, instr, funcout, alucontrol, pc, aluout);
    
endmodule
