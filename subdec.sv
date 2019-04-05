`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/12 02:18:22
// Design Name: 
// Module Name: subdec
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
`include "InstrDef.sv"
`include "ALUDef.sv"
`define SRCIMM  1'b1
`define SRCB    1'b0

module subdec(
    input logic [6:0]op,
    input logic [3:0]optype,
    input logic [2:0]func3,
    input logic [6:0]func7,
    output logic pcjr, srcbr, 
    output logic [4:0]alucontrol,
    output logic ld
    );
    
    always_comb
        case(optype)
            `U_TYPE:begin
            end
            `J_TYPE:begin
                pcjr <= 1'b1;
                srcbr <= `SRCIMM;
                alucontrol <= `ADD;
            end

            `I_TYPE:begin
                srcbr <= `SRCIMM;
                case(op)
                    7'b1100111:begin    //jalr
                        pcjr <= 1'b1;
                        
                        alucontrol <= `ADD;
                    end
                    7'b0000011:begin       //load
                        pcjr <= 1'b0;
                        ld <= 1'b1;
                        case(func3)
                            3'b000:begin    //lb
                            end
                            3'b001:begin    //lh
                            end
                            3'b010:begin        //lw
                            end
                            3'b100:begin        //lbu
                            end
                        endcase
                    end
                    7'b0010011:begin
                        pcjr <= 1'b0;
                    end
                    default:begin
                    end
                endcase
            end
            `R_TYPE:begin
                pcjr <= 1'b0;
                srcbr <= `SRCB;
                case(func3)
                    3'b000:case(func7)
                            7'b0000000: alucontrol <= `ADD;
                            7'b0100000: alucontrol <= `SUB;
                    endcase
                    
                endcase
            end  
        endcase
    
    
endmodule
