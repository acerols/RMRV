`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2020 05:09:21 AM
// Design Name: 
// Module Name: PC_sim
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


module PC_sim(

    );
    logic clk, reset;
    logic [31:0] readData;
    logic MemWrite;
    logic [31:0] pcF, instrF, aluResult, WriteData;
    
    logic [31:0]mem[31:0];
    
    logic [31:0] pcpr;
    assign pcpr = pcF >> 2;
    
    assign instrF = mem[pcpr];
    
    riscv rmrv(clk, reset, pcF, instrF, MemWrite, aluResult, WriteData, readData);
    
    initial begin
        mem[0] = 32'b0;
        mem[1] = 32'b10;
        reset = 1;
        #9;
        reset = 0;
    end
    
    always begin
        clk <= 1; #5; clk <= 0; #5;
    end
    
endmodule
