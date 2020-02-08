`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2020 09:39:09 PM
// Design Name: 
// Module Name: Mux2
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
module Mux2
  #(parameter WIDTH = 8)
   (input logic [WIDTH - 1:0] d0, d1, // 入力値0, 1
    input logic                s,     // 選択信号
    output logic [WIDTH - 1:0] y);    // 選択値

   assign y = s ? d1 : d0;

endmodule // Mux2
