`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/02/2020 01:38:30 AM
// Design Name: 
// Module Name: alucontrol
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


module alucontrolunit(input logic [1:0] aluop,
                  input logic [2:0] funct3,
                  input logic [6:0] funct7,
                  output logic [3:0] alucontrol
    );
    logic [9:0] funct;
    assign funct = {funct7[6:0], funct3[2:0]};
    
    always @(*)begin
        case(aluop)
            2'b00 : alucontrol = 4'b0010;   //ld, sd
            2'b01 : case(funct3)
                3'b000 : alucontrol = 4'b0110;   //beq
                default : alucontrol = 4'b0110;   //beq
            endcase
            2'b11 : case(funct3)
                3'b000 : alucontrol = 4'b0010;      //addi
                3'b010 : alucontrol = 4'b1010;      //slt
                3'b011 : alucontrol = 4'b1011;      //sltiu
                3'b100 : alucontrol = 4'b0011;      //xori
                3'b110 : alucontrol = 4'b0001;      //ori
                3'b111 : alucontrol = 4'b0000;      //andi
                3'b001 : alucontrol = 4'b1001;      //slli
                3'b101 :begin if(funct7 == 7'b0) alucontrol = 4'b1100;       //srli
                            else alucontrol = 4'b1101;                       //srai        
                        end
            endcase
            default : case(funct)
                10'b0000000000 : alucontrol = 4'b0010;  //add
                10'b0100000000 : alucontrol = 4'b0110;  //sub
                10'b0000000001 : alucontrol = 4'b1001;  //sll
                10'b0000000010 : alucontrol = 4'b1010;  //slt
                10'b0000000011 : alucontrol = 4'b1011;  //sltu
                10'b0000000100 : alucontrol = 4'b0011;  //xor
                10'b0000000101 : alucontrol = 4'b1100;  //srl
                10'b0100000101 : alucontrol = 4'b1101;  //sra
                10'b0000000111 : alucontrol = 4'b0000;  //and
                10'b0000000110 : alucontrol = 4'b0001;  //or
                default : alucontrol = 4'bx;
            endcase
         endcase
    end
    
endmodule
