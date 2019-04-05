`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/20 03:43:47
// Design Name: 
// Module Name: extention
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


module extention #(parameter WIDTH = 8)(
    input logic [WIDTH-1:0]a,
    output logic [31:0]y
    );
    logic [31 - WIDTH:0]b;
    
    always_comb
        if(a[WIDTH-1] == 1'b1)
            b <= 1'b1;
    
    
endmodule
