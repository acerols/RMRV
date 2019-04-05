`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/10 18:14:29
// Design Name: 
// Module Name: alu
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


module alu(
    input logic [31:0]a, b,
    input logic [4:0] f,
    output logic [31:0]y,
    output logic c_out
    );
    logic [31:0] b_sel, sum;
    
    always_comb
    begin
        if(f == 5'b00001) y <= a - b;
        else y <= a + b;
    end
    
endmodule
