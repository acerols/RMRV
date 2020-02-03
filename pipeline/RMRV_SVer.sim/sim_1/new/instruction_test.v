`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/02/2020 08:50:34 PM
// Design Name: 
// Module Name: instruction_test
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

module instruction_test();

  logic         clk;
  logic         reset;
  
  logic [31:0] dmem[31:0];

  wire [31:0] write_data, address;
  wire memwrite;
  wire [31:0] o_pc;
  reg [31:0] instruction, read_data;
  wire [31:0] o_alu_result, o_write_data;
  
  riscv riscv(clk, reset, o_pc, instruction, memwrite, o_alu_result, o_write_data, read_data);
  always @(*)begin
    if(memwrite)dmem[o_alu_result] = o_write_data;
    dmem[0] = 32'hffffff00;
    dmem[1] = 32'hffff0000;
    read_data = dmem[o_alu_result];
  end
  initial
    begin
      reset <= 1; #7; reset <= 0;

      # 200 //wait

      $finish;
    end

    initial begin
        instruction <= {12'b111111111111, 5'b00000, 3'b111, 5'b00001, 7'b0010011};  //Itype imm calc
        #19;
        instruction <= {12'b000000000001, 5'b00000, 3'b000, 5'b00001, 7'b0000011};  //Itype load
        #10;
        instruction <= {7'b0000000, 5'b00001, 5'b00000, 3'b000, 5'b00010, 7'b0100011};  //S type store
        //32'b11001000000100000001000000000001;
        #10;
        //instruction <= {12'b000000000001, 5'b00000, 3'b000, 5'b00010, 7'b0000011};  //Itype
        //#9;
        instruction <= {7'b0000000, 5'b00010, 5'b00001, 3'b000, 4'b1111, 1'b0, 7'b1100011}; //Btype branch
        #40;
        instruction <= {12'b000000000001, 5'b00000, 3'b000, 5'b00010, 7'b0000011};  //Itype
        #10;
        instruction <= {7'b0000000, 5'b00010, 5'b00001, 3'b000, 4'b1111, 1'b0, 7'b1100011}; //Btype branch
        
    end

  // generate clock
  always
    begin
      clk <= 1; # 5; clk <= 0; # 5;
    end

endmodule
