`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/12 03:49:41
// Design Name: 
// Module Name: imem
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
    input logic [5:0] a,
    output logic [31:0] rd
);

    logic [31:0]RAM[64:0];
        
    
    initial begin
        RAM[0] = {12'b0, 5'b0, 3'b000, 5'b1, 7'b0010011};               //x[1] = x[0] + 0 = 0
        RAM[1] = {12'b1, 5'b0, 3'b000, 5'b10, 7'b0010011};               //x[2] = x[0] + 1 = 1
        RAM[2] = {7'b0000000, 5'b10, 5'b01, 3'b000, 5'b011, 7'b0110011};    //x[3] = x[1] + x[2]
        RAM[3] = {12'b0, 5'b10, 3'b000, 5'b1, 7'b0010011};        //x[1] = x[2] + 0
        RAM[4] = {12'b0, 5'b11, 3'b000, 5'b10, 7'b0010011};        //x[2] = x[3] + 0
        RAM[5] = {7'b0000000, 5'b10, 5'b01, 3'b000, 5'b011, 7'b0110011};    //x[3] = x[1] + x[2]
        RAM[6] =  {12'b1100, 5'b0, 3'b0, 5'b100, 7'b1100111};           //jalr x[4] = pc + 4, pc = x[0] + 12
        RAM[7] = 32'h0064202a;        //         slt  $4, $3, $4      # $4 = $3 < $4  // 0 (1C)
        RAM[8] = {12'b0, 5'b0, 3'b0, 5'b111, 7'b1100111};        //         beq  $4, $0, around  # if ($4 == 0) goto around; // true (20)
        RAM[9] = 32'h20050000;        //         addi $5, $0, 0       # should not happen // (24)
        RAM[10] = 32'h00e2202a;        // around: slt  $4, $7, $2      # $4 = $7 < $2; // 1 (28)
        RAM[11] = 32'h00853820;        //         add  $7, $4, $5      # $7 = $4 + $5; // 12 (2C)
        RAM[12] = 32'h00e23822;        //         sub  $7, $7, $2      # $7 = $7 - $2; // 7 (30)
        RAM[13] = 32'hac670044;        //         sw   $7, 68($3)      # [80] = 7; 	// (34)
        RAM[14] = 32'h8c020050;        //         lw   $2, 80($0)      # $2 = [80];    // 7 (38)
        RAM[15] = 32'h08000011;        //         j    end             # goto end;	// (3C)
        RAM[16] = 32'h20020001;        //         addi $2, $0, 1       # should not happen // (40)
        RAM[17] = 32'hac020054;        // end     sw   $2, 84($0)	# 	     	    // (44)
    end

    assign rd = RAM[a];
    
endmodule
