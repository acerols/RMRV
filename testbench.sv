`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/10 18:17:26
// Design Name: 
// Module Name: testbench
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


module testbench(

    );
    logic clk, reset;
    logic [31:0]instr;
    logic [3:0]funcout;
    logic [4:0]alucontrol;
    
    logic   jump;
    logic   [31:0]pc;
    logic   regwrite;
    logic   [31:0]regwritedata;
    logic   aluoutin;
    logic   pcjr, srcbr;
    
    logic   [31:0]srca, srcb, writedata;
    logic   [31:0]aluout;
    
    logic   [31:0]dmemout;
    logic   [31:0]result;
    logic   dmemwrite, ld;
    
    imem        imem(pc[7:2], instr);
    
    maindec     md(instr[6:0], regwrite, funcout);
    subdec      sb(instr[6:0], funcout, instr[14:12], instr[31:25], pcjr, srcbr, alucontrol);
    logic [31:0] pcplus4, pcnext;
    
    //program counter
    flopr #(32) pcreg(clk, reset, pcnext, pc);
    adder       pcadd1(pc, 32'b100, pcplus4);
    mux2  #(32) pcbrmux(pcplus4, aluout, pcjr, pcnext);
    mux2  #(32) pctoreg(aluout, pcplus4, pcjr, regwritedata);
    
    regfile     rf(clk, instr[19:15], instr[24:20], instr[11:7], result, regwrite, srca, writedata);
    mux2    #(32)   alusrcbr(writedata, {20'b0, instr[31:20]}, srcbr, srcb);
    
    alu         alu(srca, srcb, alucontrol, aluout, aluoutin);
    dmem        dmem(clk, dmemwrite, aluout, 32'b0, dmemout);
    assign ld = 1'b0;
    mux2    #(32)   result_se(aluout, dmemout, ld, result);
    
   /* pc          pcreg(clk, reset, 1'b0, instr, pc);
    regfile     rf(clk, instr[19:15], instr[24:20], instr[11:7], aluout, regwrite, srca, writedata);
    mux2    #(32)   rfmux(writedata, {20'b0, instr[31:20]}, funcout, srcb);
    
    alu         alu(srca, srcb, alucontrol, aluout, aluoutin);
    */
    /*
    i input logic [3:0]optype,
    input logic [2:0]func3,
    input logic [6:0]func7,
    output logic pcjr, srcbr, writedatasrc,
    output logic [4:0]alucontrol
    */
    
    initial begin
        clk = 1'b0;
        forever begin
        #5; clk = ~clk;
        end
    end
    
    initial begin
        reset = 1'b1;
        #12;
        reset = 1'b0;
    end
    /*
    initial begin
        instr <= {12'b10, 5'b0, 3'b000, 5'b1, 7'b0010011};  //x[1] <= 2
        #25;
        instr <= {7'b0, 5'b01, 5'b01, 3'b000, 5'b10, 7'b0110011};   //x[2] = x[1] + x[1]
        #10;
        instr <= {7'b0100000, 5'b01, 5'b01, 3'b000, 5'b011, 7'b0110011};                       //x[3] = x[1] - x[1]
        #10;
        instr <= {12'b0, 5'b0, 3'b0, 5'b111, 7'b1100111};           //x[7] = pc + 4  pc = x[0] + 0
        #10;
    end
    */
    
endmodule
