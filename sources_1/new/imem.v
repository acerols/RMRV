`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/02/2020 02:26:04 AM
// Design Name: 
// Module Name: dmem
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


module imem(
    input [31:0] address,
    output [31:0] read_data
    );
    
    reg [31:0] RAM[63:0];
    
    
    initial
        begin
            $readmemb("imemfileB_loop.mem", RAM);
    end
    
    assign read_data = RAM[address];
    
    
endmodule
