`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    20:04:17 12/30/2013
// Design Name:
// Module Name:    Core32Bit
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module Core32Bit(
	input clk, //clock
	input rst //reset
   );

	// wires for register block
	wire regs_clk; //clock
	wire regs_reset; //reset signal
	wire [4:0]regs_readReg1;
	wire [4:0]regs_readReg2;
	wire [4:0]regs_writeReg;
	wire regs_writeEn; //write enable
	wire [31:0]regs_writeData;
	wire [31:0]regs_outReg1;
	wire [31:0]regs_outReg2;

	//ALU wires
	wire [3:0]alu_opCode; //ALU opcode
	wire [31:0] alu_in1;
	wire [31:0] alu_in2;
	wire [4:0]alu_shAmt;
	wire [31:0] alu_out;

	//Control Unit wires
	wire [5:0] cu_opCode;
	wire cu_regWrite;
	wire cu_aluSrc;
	wire cu_regDest;
	wire cu_memToReg;
	wire cu_memRead;
	wire cu_memWrite;
	wire cu_branch;
	wire [1:0] cu_aluOp;

	//Instruction memory wires
	wire [27:0]imem_address;
	wire imem_readEn;
	wire [31:0]imem_data;

	//generic wires
	wire [4:0] registerWrite;
	wire [4:0] registerA;
	wire [4:0] registerB;
	wire [4:0] Rd;
	wire [4:0] Rt;
	wire [5:0] func; //function field
	wire [15:0] immediate;

	assign regs_clk = clk;
	assign regs_reset = rst;


	assign Rd = imem_data[15:11];
	assign Rt = imem_data[20:16];

	assign registerA = imem_data[25:21];
	assign registerB = Rt;

	assign func = imem_data[5:0];

	assign immediate = imem_data[15:0];

    Mux2To1Generic regSel(Rt, Rd, cu_regDest, registerWrite);

	// Registers
	RegisterBlock32Bit registers(.CLK(regs_clk), .reset(regs_reset), .readReg1(regs_readReg1), .readReg2(regs_readReg2),
								 .writeReg(regs_writeReg), .writeEn(regs_writeEn), .writeData(regs_writeData),
								 .outReg1(regs_outReg1), .outReg2(regs_outReg2));

	// Arithmetic Logic unit
	ALU32 alu(.opCode(alu_opCode), .in1(alu_in1), .in2(alu_in2), .shAmt(alu_shAmt), .out(alu_out));

	// control unit
	ControlUnit control(.opCode(cu_opCode), .regWrite(cu_regWrite), .aluSrc(cu_aluSrc), .regDest(cu_regDest),
						.memToReg(cu_memToReg),  .memRead(cu_memRead), .memWrite(cu_memWrite), .branch(cu_branch), .aluOp(cu_aluOp));

	// instruction memory
	Mem32Bit insMem(.address(imem_address), .readEn(imem_readEn), .data(imem_data)); //instruction memory


	wire [31:0]extendedImm; //sign extendes version of immediate field
	SignExtend32Bit signEx(.in(immediate), .out(extendedImm));

	assign alu_in1 = regs_outReg1;

	//decide and select input B of ALU
	wire [31:0] alu_input2;
	Mux2To1Generic aluSel(regs_outReg2, extendedImm, cu_aluSrc, alu_input2);
	assign alu_in2 = alu_input2;

	assign regs_writeEn = cu_regWrite;
	assign imem_readEn = cu_memRead;

endmodule