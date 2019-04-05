`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/20 03:40:51
// Design Name: 
// Module Name: ext1byte
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


module ext1byte(
    input logic [7:0]a,
    output logic[31:0]y
    );
    
    assign y = {24'b0, a};
    
endmodule
