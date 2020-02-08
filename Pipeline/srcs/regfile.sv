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
    input logic clk, reset,
    input logic regWrite,
    input logic [4:0]     read_register1, read_register2, write_register,
    input logic [31:0]    write_data,
    output logic [31:0]   read_data1, read_data2
    );
    
    logic [31:0]register[31:0];

    always @(posedge clk)begin
        if(reset) begin
            for(int i = 0; i < 32; i++)register[i] <= 0;
        end
    end

    
    always @(posedge clk) begin
        if(regWrite)register[write_register] = write_data;
        //if(register[read_register1] == 0)register[read_register1] = 0;
        //if(register[read_register2] == 0)register[read_register2] = 0;
    end
    
    assign read_data1 = (read_register1 != 0) ? register[read_register1] : 0;
    assign read_data2 = (read_register2 != 0) ? register[read_register2] : 0;
    
endmodule
