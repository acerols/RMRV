`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/02/2020 02:20:52 AM
// Design Name: 
// Module Name: riscv
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
module riscv(
    input logic clk, reset,
    output logic [31:0] pcF,
    input logic [31:0] instrF,
    output logic memWriteE,
    output logic [31:0] aluResult, WriteData,
    input logic [31:0] readData
    );
    
    /*Fetch Stage*/
    logic [31:0]instrBuf;
    logic stallBuf;
    logic [31:0] pcPlus4F;

    /*Decode Stage*/
    logic stall, flush;
    logic memValidD;
    logic pcSrc;
    logic [31:0] instrD, instrDBuf;
    logic [6:0] opcodeD;
    logic [2:0] funct3D;
    logic [6:0] funct7D;
    logic [4:0] rs1D, rs2D, rdD;
    logic [31:0] rs1Data, rs2Data, selectDataD;
    logic [31:0] rs1ForwardD, rs2ForwardD, immD;
    logic memToRegD, memWriteD, memReadD, alusrcD;
    logic [3:0] alucontrolD;
    logic [31:0] pcNext, pcPlus4D, pcBranch;
    logic BranchEn;
    logic flushD;

    /* Exec Stage */
    logic [31:0] instrE;
    logic [6:0] opcodeE;
    logic [2:0] funct3E;
    logic [31:0] rs1ForwardE, rs2ForwardE, immE, selectDataE;
    logic memToRegE, memReadE, alusrcE, regWriteE;
    logic [3:0] alucontrolE;
    logic [4:0] rdE;
    logic [31:0] rdData;
    logic [31:0] resultE;
    logic memValidE;
    logic flushE;

    /*writeback stage */
    logic flushW;


    always_comb begin
        if (reset) stall = 0;
        //else if(memValidE == 1 | BranchEn == 1) stall = 1;
        else stall = 0;
    end

    always @* begin
        stallBuf <= stall;
        if((stall & ~ stallBuf) | flush)
            instrBuf <= instrF;
    end

    
    always @(posedge clk) begin
        if(flush & ~ flushE) instrDBuf = 32'bx;
        else instrDBuf = instrF;
            
    end

    always @* begin
        if (reset) pcNext <= 0;
        else if(~stall)begin
            if(BranchEn) pcNext <= pcBranch;
            else pcNext <= pcPlus4F;
        end
    end

    always @(posedge clk) begin
        if(reset)
            pcF <= 0;
        else if (~stall)
            pcF <= pcNext;
    end
    assign pcPlus4F = pcF + 32'd4;
    
    always @* begin
        instrD = instrDBuf;
    end

    /*
    always @(posedge clk)begin
        if(reset) instrDBuf <= 0;
        else if (~stall) instrDBuf <= instrF;
    end 
    */

    always @(posedge clk)begin
        pcPlus4D <= pcPlus4F;
    end

    assign opcodeD = instrD[0+:7];
    assign funct3D = instrD[12+:3];
    assign funct7D = instrD[25+:6];
    assign rs1D = instrD[15+:4];
    assign rs2D = instrD[20+:4];
    assign rdD = instrD[7+:4];
    controller  c(clk, reset,
                  opcodeD,
                  funct3D,
                  funct7D,
                  flush,
                  memToRegD, memWriteD, memReadD,
                  memValidD,
                  branch,
                  alusrcD, regWriteD,
                  alucontrolD);
    
    regfile rf(clk, reset, regWriteE, rs1D, rs2D, rdE, resultE, rs1Data, rs2Data);
    immgen igen(instrD, immD);
    assign pcBranch = pcPlus4D + immD;

    branchcomp brcm(branch, rs1ForwardD, rs2ForwardD, funct3D, BranchEn);

    assign flushD = BranchEn;

    always @* begin
        if(alusrcD) selectDataD <= immD;
        else selectDataD <= rs2Data;
    end

    

    always @(posedge clk)begin
        if (flush) begin
            {memToRegE, memWriteE, memReadE, alucontrolE, alusrcE, regWriteE} = 32'bx;
            {instrE, rs1ForwardE, rs2ForwardE} = 96'bx;
            {rdE, flushE} = 0;
        end
        {memToRegE, memWriteE, memReadE, alucontrolE, alusrcE, regWriteE} = {memToRegD, memWriteD, memReadD, alucontrolD, alusrcD, regWriteD};
        {instrE, rs1ForwardE, rs2ForwardE, selectDataE} = {instrD, rs1ForwardD, rs2ForwardD, selectDataD};
        {memValidE, rdE, flushE} = {memValidD, rdD, flushD};
    end

    alu alu(alucontrolE, rs1ForwardE, selectDataE, aluResult, zero);
    assign writeData = rs2ForwardE;
    Mux2 #(32) selectResult(aluResult, readData, memToRegE, resultE);

    assign flush = flushE | flushD;

    logic flushWP;
    always @* begin
        flushW = flushWP;
    end
    always @(posedge clk)begin
        flushWP = flushE;
    end

    always @* begin
        if(flushW) flush = 0;
    end

    forward fd(clk, reset, stall,
               rdE,
               resultE,
               regWriteE,
               rs1D, rs2D,
               rs1Data, rs2Data,
               rs1ForwardD, rs2ForwardD);

endmodule
