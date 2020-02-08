`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/02/2020 01:44:40 AM
// Design Name: 
// Module Name: forward
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

module forward(
    input logic clk, reset, stall,
    input logic [4:0] rd,
    input logic [31:0] rdData,
    input logic regWrite,
    input logic [4:0] rs1, rs2,
    input logic [31:0] rs1Data, rs2Data,
    output logic [31:0] rs1Forward, rs2Forward
    );
    
    always @* begin
        if(~stall)begin
            if(regWrite & (rd == rs1))begin
                rs1Forward <= rdData;
            end
            else
                rs1Forward <= rs1Data;
            if(regWrite & (rd == rs2))begin
                rs2Forward <= rdData;
            end
            else 
                rs2Forward <= rs2Data;
        end
    end

endmodule