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
    input logic branch,
    input logic [31:0] input_data1, input_data2,
    input logic [2:0] funct3,
    output logic out
    );
    
    logic _out;

    always_comb begin
        case(funct3)
        3'b000 : _out = (input_data1 == input_data2);
        3'b001 : _out = (input_data1 != input_data2);
        3'b100 : _out = ($signed(input_data1) < $signed(input_data2));
        3'b101 : _out = ($signed(input_data1) >= $signed(input_data2));
        3'b110 : _out = (input_data1 < input_data2);
        3'b111 : _out = (input_data1 >= input_data2);
        default : _out = 0;
        endcase
    end
    
    assign out = branch ? _out : 0;

endmodule
