`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/11 14:41:22
// Design Name: 
// Module Name: InstrDef
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

`define U_TYPE  4'b1000
`define J_TYPE  4'b0001
`define B_TYPE  4'b0010
`define L_TYPE  4'b1011
`define S_TYPE  4'b0100
`define I_TYPE  4'b1101
`define R_TYPE  4'b1110

/*
 7'b0110111: funcout <= 4'b0000;  //U_TYPE
            7'b0010111: funcout <= 4'b0000;  //U_TYPE
            7'b1101111: funcout <= 4'b0001;  //J_TYPE
            7'b1100011: funcout <= 4'b0010;  //B_TYPE
            7'b0000011: funcout <= 4'b1011;  //L_TYPE
            7'b0100011: funcout <= 4'b0100;  //S_TYPE
            7'b0010011: funcout <= 4'b1101;   //I_TYP
            7'b0110011: funcout <= 4'b1110;   //R_TYPE
            */
