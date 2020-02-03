`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/02/2020 02:35:19 AM
// Design Name: 
// Module Name: riscvtop
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

module riscvtop(
    input logic clk, reset,
    output logic [31:0] write_data, address,
    output logic  memwrite
    );
    
    logic [31:0] instruction;
    logic [31:0] pc, read_data;
    
    riscv riscv(clk, reset, pc, instruction, memwrite, address,
                write_data, read_data);
             
    imem imem(pc, instruction);
    dmem dmem(clk, memwrite, address, write_data, read_data);
    
endmodule
