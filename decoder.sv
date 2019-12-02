`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/10 14:56:00
// Design Name: 
// Module Name: decoder
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


module decoder(
    input logic [31:0]instr,
    output logic src1reg_en, src2reg_en, 
    output logic jal, alures2reg, memory2reg, memwrite,
    output logic [4;0]src1reg_addr, src2reg_addr,dstreg_addr
    output logic [2:0]func3,
    output logic [6:0]func7, opcode,
    output logic [31:0]imm,
    );
    
    assign {func7, src2reg_addr, src1reg_addr, func3, dstreg_addr, opcode} = instr_type;
    enum {UKNOWN_TYPE, R_TYEP, I_TYPE, IZ_TYPE, S_TYPE, B_TYPE, U_TYPE, J_TYPE}instr_type;
p)

localparam  OPCODE_AUIPC         = 7'b0010111,   // rd=pc+imm
            OPCODE_LUI           = 7'b0110111,   // rd=imm;
            OPCODE_JAL           = 7'b1101111,   // rd=pc+4,            pc= pc+imm*2,
            OPCODE_JALR          = 7'b1100111,   // rd=pc+4,            pc= rs1+imm
            OPCODE_BRANCH        = 7'b1100011,   // conditional branch, pc= pc+imm*2,
            OPCODE_ALI           = 7'b0010011,   // arithmetic and logical I-TYPE, rd=alu_res
            OPCODE_ALR           = 7'b0110011,   // arithmetic and logical R-TYPE, rd=alu_res
            OPCODE_LOAD          = 7'b0000011,   // load
            OPCODE_STORE         = 7'b0100011;   // store
    assign jal = (opcode == OPCODE_JAL);
    assign memory2reg = (opcode == OPCODE_LOAD);
    assign memwrite = (opcode == OPCODE_STORE);
    assign alures2reg = (opcode == OPCODE_JAL || opcade == OPCODE_JALR||
                        opcode == OPCODE_LUI || opcode == OPCODE_AUIPC ||
                        opcode == OPCODE_ALI || opcode == OPCODE_ALR);

    always_comb         // calculate instruction type
        case(o_opcode)
            OPCODE_AUIPC  : instr_type <= U_TYPE;
            OPCODE_JAL    : instr_type <= J_TYPE;
            OPCODE_JALR   : instr_type <= I_TYPE;
            OPCODE_BRANCH : instr_type <= B_TYPE;
            OPCODE_LUI    : instr_type <= U_TYPE;
            OPCODE_ALI    : instr_type <= I_TYPE;
            OPCODE_ALR    : instr_type <= R_TYPE;
            OPCODE_LOAD   : instr_type <= I_TYPE;
            OPCODE_STORE  : instr_type <= S_TYPE;
            default       : instr_type <= UKNOWN_TYPE;
        endcase

    always_comb
        case(instr_type)
            I_TYPE:imm <= {{20{instr[31]}}, instr[31:20};
        endcase
    
    always_comb
        case(instr_type)
            I_TYPE: {src2reg_en, src1reg_en} <= 2'b01;
            default {src2reg_en, src1reg_en} <= 2'b00;

endmodule
