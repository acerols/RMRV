`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/20 02:25:00
// Design Name: 
// Module Name: demux
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


module demux #(parameter WIDTH = 8)(
    input logic [WIDTH-1:0]a,
    input logic s,
    output logic [WIDTH-1:0]y1, y2
    );
    
    assign y1 = s ? 32'b0 : a;
    asssig y2 = s ? a : 32'b0;
    
endmodule
