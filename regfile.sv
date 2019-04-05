`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/10 15:58:22
// Design Name: 
// Module Name: regfile
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


module regfile(
    input logic clk,
    input logic [4:0]ra, rb, rc,
    input logic [31:0]wd,
    input logic we,
    output logic [31:0]rd1, rd2
    );
    
    logic [31:0]x[31:0];
    
    assign rd1 = (ra != 0) ? x[ra] : 0;
    assign rd2 = (rb != 0) ? x[rb] : 0;
    
    always_ff @(posedge clk)
        if(we) x[rc] <= wd;
    
    
endmodule
