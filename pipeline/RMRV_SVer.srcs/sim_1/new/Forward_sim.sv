`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2020 03:56:14 AM
// Design Name: 
// Module Name: Forward_sim
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


module Forward_sim(

    );
    logic clk, reset, stall, rw;
    logic [4:0] rs1, rs2, rd;
    logic [31:0] rs1d, rs2d, rdd;
    logic [31:0] f1, f2;
    forward fd(clk, reset, stall, rd, rdd, rw,
                rs1, rs2, rs1d, rs2d, f1, f2);
                
                
    always begin
        clk <= 1; #5; clk <= 0; #5;
    end
    initial begin
        reset <= 1;
        stall <= 0; #10
        reset <= 0;
        #5;
        rs1 <= 5'b00001;
        rs2 <= 5'b00010;
        rd <= 5'b00010;
        rw <= 1;
        rs1d <= 32'b0;
        rs2d <= 32'b0;
        rdd <= 32'b110;
        #30;
        rw <= 0;
        
    end
endmodule
