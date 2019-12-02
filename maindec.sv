`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/10 15:27:25
// Design Name: 
// Module Name: maindec
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
`include "InstrDef.sv"
//instr[6:0]

module maindec(
    input logic [6:0]op,
    output logic writereg,
    output logic [3:0]funcout,
    );
    
    assign writereg = funcout[3];
    
    always_comb
        case(op)
            7'b0110111: funcout <= `U_TYPE;  //U_TYPE
            7'b0010111: funcout <= `U_TYPE;  //U_TYPE
            7'b1101111: funcout <= `J_TYPE;  //J_TYPE
            7'b1100111: funcout <= `I_TYPE;  //L_TYPE   jalr
            7'b1100011: funcout <= `B_TYPE;  //B_TYPE
            7'b0000011: funcout <= `I_TYPE;  //L_TYPE
            7'b0100011: funcout <= `S_TYPE;  //S_TYPE
            7'b0010011: funcout <= `I_TYPE;   //I_TYP
            7'b0110011: funcout <= `R_TYPE;   //R_TYPE
            default: funcout <=4'bxxxx;
        endcase

    
endmodule
