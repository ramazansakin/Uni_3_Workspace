`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 		 Mehmet Akif TASOVA
// 
// Create Date:    13:03:11 11/18/2013 
// Design Name: 
// Module Name:    CarryLookAheadAdder32 
// Project Name: 	 32 Bit ALU
// Target Devices: 
// Tool versions: 
// Description: 
//				32 Bit Carry look Ahead Adder
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CarryLookAheadAdder32(
   input [31:0]in1,
	input [31:0]in2,
	input cIn, // carry in
	output cOut, // caryy out
	output GG, // generate sign
	output PG, // generate because propagete sign
	output [31:0]sum);
	
	wire tmpCarry;
	wire [1:0] tmpGG, tmpPG;
	
	CarryLookAheadAdder16 cla1(in1[15:0], in2[15:0], cIn, tmpCarry, tmpGG[0], tmpPG[0], sum[15:0]);
	CarryLookAheadAdder16 cla2(in1[31:16], in2[31:16], tmpCarry, cOut, tmpGG[1], tmpPG[1], sum[31:16]);
	
	//assign GG = tmpGG[1] & tmpGG[0];
	//assign PG = tmpPG[1] | tmpPG[0];
	and(GG, tmpGG[1], tmpGG[0]);
	or(PG, tmpPG[1], tmpPG[0]);


endmodule
