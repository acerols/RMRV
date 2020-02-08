`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2019 06:40:30 PM
// Design Name: 
// Module Name: alu
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

module alu(
    input logic [3:0]     alu_operation,
    input logic [31:0]    input_data1,
    input logic [31:0]    input_data2,
    output logic [31:0]   alu_result,
    output logic zero    
    );

    always_comb begin
        case (alu_operation)
            4'b0000 : alu_result = input_data1 & input_data2;
            4'b0001 : alu_result = input_data1 | input_data2;
            4'b0010 : alu_result = input_data1 + input_data2;
            4'b0011 : alu_result = input_data1 ^ input_data2;
            4'b0110 : alu_result = input_data1 - input_data2;
            4'b1001 : alu_result = input_data1 << input_data2[4:0];    //sll
            4'b1010 : begin     //slt
                        if($signed(input_data1) < $signed(input_data2))
                            alu_result = 32'b1;
                        else
                            alu_result = 32'b0;
                      end
            4'b1011 : begin     //slyu
                        if(input_data1 < input_data2)            
                            alu_result = 32'b1;    //sltu
                        else
                            alu_result = 32'b0;
                      end
            4'b1100 : alu_result = input_data1 >> input_data2[4:0];    //srl
            4'b1101 : alu_result = input_data1 >>> input_data2[4:0];    //sra
            default : alu_result = 0;
        endcase
    end
    
    assign zero = alu_result ? 0 : 1;
    
endmodule
