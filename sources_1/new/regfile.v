`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2019 06:58:34 PM
// Design Name: 
// Module Name: regfile
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


module regfile(
    input           clk,
    input           reg_write,
    input [4:0]     read_register1, read_register2, write_register,
    input [31:0]    write_data,
    output [31:0]   read_data1, read_data2
    );
    
    reg [31:0]register [31:0];
    
    always @(posedge clk) begin
        if(reg_write)register[write_register] <= write_data;
    end
    
    assign read_data1 = (read_register1 != 0) ? register[read_register1] : 0;
    assign read_data2 = (read_register2 != 0) ? register[read_register2] : 0;
    
endmodule
