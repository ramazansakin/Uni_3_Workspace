`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:47:12 12/30/2013 
// Design Name: 
// Module Name:    ControlUnit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//			MIPS control unit from slides of lecture 7: Single cycle control, slide#21
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ControlUnit(
	input [5:0] opCode,
	output regWrite,
	output aluSrc,
	output regDest,
	output memToReg,
	output memRead,
	output memWrite,
	output branch,
   output [1:0] aluOp
	);
	
	
	wire Rtype, loadW, storeW, beq;
	
	assign Rtype = ((~opCode[5]) & (~opCode[4]) & (~opCode[3]) & (~opCode[2]) & (~opCode[1]) & (~opCode[0]));
	
	assign loadW = (opCode[5] & (~opCode[4]) & (~opCode[3]) & (~opCode[2]) & opCode[1] & opCode[0]);
	
	assign storeW = (opCode[5] & (~opCode[4]) & opCode[3] & (~opCode[2]) & opCode[1] & opCode[0]);
	
	assign beq = ((~opCode[5]) & (~opCode[4]) & (~opCode[3]) & opCode[2] & (~opCode[1]) & (~opCode[0]));
	
	assign regWrite = Rtype | loadW;
	
	assign aluSrc = loadW | storeW;
	
	assign regDest = Rtype;
	
	assign memToReg = loadW;
	
	assign memRead = loadW;
	
	assign memWrite = storeW;
	
	assign branch = beq;
	
	assign aluOp[1] = Rtype;
	assign aluOp[0] = beq;
	

endmodule
