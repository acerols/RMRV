`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/02/2020 09:13:43 PM
// Design Name: 
// Module Name: pcbranch
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


module pcbranch(
    input clk, reset,
    input [31:0] jump_address,
    input branch,
    input branch_en,
    output reg[31:0] pc
    );
    
    reg [31:0] pc_reg = 0;
    reg [31:0] _pc;
    
    wire [2:0]fuct3;
    
    wire [31:0] pcnext, pcplus4, pcbranch;
    wire [31:0] imm32_shiftleft1;
    
    assign imm32_shiftleft1 = {jump_address[30:0], 1'b0};
    assign pcbranch = pc + imm32_shiftleft1;
    assign pcplus4 = pc + 32'b100;
    assign pcnext = branch ? pcbranch : pcplus4;
    
    always @(posedge clk, posedge reset) begin
        if(reset)begin
             pc <= 32'b0;
             _pc <= 32'b0;
        end
        else begin
            if(branch)begin
                _pc <= pc;
                pc <= pcbranch;
            end
            else begin
                _pc <= pc;
                pc <= pcplus4;
            end
            
            
        end
    end
    
    
endmodule
