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


module dmem(
    input   clk, memwrite,
    input [31:0] address,
    input [31:0] write_data,
    output [31:0] read_data
    );
    
    reg [31:0] RAM [63:0];
    
    initial begin
        $readmemh("dmemfileH_loop.mem", RAM);
    end
    
    assign read_data = RAM[address];
    
    always @(posedge clk)begin
        if(memwrite)
            RAM[address] <= write_data;
    end
    
    
endmodule
