`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/12 02:58:42
// Design Name: 
// Module Name: mux2_2
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


module mux2_2 #(parameter WIDTH = 8)(
    input logic [WIDTH-1:0]srca1, srca2,
    input logic [WIDTH-1:0]srcb1, srcb2,
    input logic s,
    output logic [WIDTH-1:0]out1, out2
    );
    
    assign out1 = s ? srcb1: srca1;
    assign out2 = s ? srcb2: srca2;
    
endmodule
