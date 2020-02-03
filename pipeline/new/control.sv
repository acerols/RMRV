`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/02/2020 01:28:22 AM
// Design Name: 
// Module Name: control
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


module controlunit(input logic [6:0] opcode,
               output logic alusrc, memtoreg, regwrite, memread, memwrite, branch,
               output logic [1:0] aluop
    );
    logic [7:0] controls;
    assign {alusrc, memtoreg, regwrite, memread, memwrite, branch, aluop} = controls;
    //alusrc 即値を使うか　regster src2を使うか
    //memtoreg register d に　メモリからロードするか aluresult をいれるか load系
    //regwrite rdが存在する命令か　R, I type instruction
    //memread メモリを読み出すか load系
    //memwrite メモリに書き出すか　store系
    //branch　　branch するか  branch系
    
    always_comb begin
        case (opcode)
            7'b0110011 : controls = 8'b00100010;    //R type
            7'b0000011 : controls = 8'b11110000;    //I type   load
            7'b0100011 : controls = 8'b10001000;    //S type 
            7'b1100011 : controls = 8'b00000101;    //B-type    branch
            7'b0010011 : controls = 8'b10100011;    //I type immediate calcurate
            default : controls = 8'bx;
        endcase
    end
    
endmodule
