`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2020 09:39:09 PM
// Design Name: 
// Module Name: branchcomp
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


module branchcomp(
    input [31:0] input_data1, input_data2,
    input [2:0] funct3,
    output reg out
    );
    
    always @(*)begin
        case(funct3)
        3'b000 : out = (input_data1 == input_data2);
        3'b001 : out = (input_data1 != input_data2);
        3'b100 : out = ($signed(input_data1) < $signed(input_data2));
        3'b101 : out = ($signed(input_data1) >= $signed(input_data2));
        3'b110 : out = (input_data1 < input_data2);
        3'b111 : out = (input_data1 >= input_data2);
        default : out = 0;
        endcase
    end
    
endmodule
