`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/10 14:56:00
// Design Name: 
// Module Name: aludec
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

//instr[31:25]

module aludec(
    input logic [6:0]func7,
    output logic [2:0]alucontrol
    );
    
    always_comb
        case(func7)
            7'b0000000: alucontrol <= 3'b000;   //add
            7'b0100000: alucontrol <= 3'b001;   //sub
            default: alucontrol <= 3'bxxx;
        endcase
    
    
    
endmodule
