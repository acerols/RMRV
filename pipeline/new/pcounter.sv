`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/02/2020 02:00:58 AM
// Design Name: 
// Module Name: datapath
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
module pcounter(
    input logic clk, reset, 
    input logic [31:0] jump,
    input logic jumpEn,
    input logic stall,
    output logic [31:0] pc
    );

    logic [31:0] _pc_reg, _pc;

    assign pc = _pc;
    