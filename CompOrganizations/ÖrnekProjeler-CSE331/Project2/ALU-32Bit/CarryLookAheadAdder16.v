`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 		 Mehmet Akif TASOVA
// 
// Create Date:    13:00:09 11/18/2013 
// Design Name: 
// Module Name:    CarryLookAheadAdder16 
// Project Name: 	 32 Bit ALU
// Target Devices: 
// Tool versions: 
// Description: 
//			16 Bit Carry Look Ahead Adder
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CarryLookAheadAdder16(
   input [15:0]in1,
	input [15:0]in2,
	input cIn, // carry in
	output cOut, // caryy out
	output GG, // generate sign
	output PG, // generate because propagete sign
	output [15:0]sum);
	
	wire tmpCarry;
	wire [1:0] tmpGG, tmpPG;
	
	CarryLookAheadAdder8 cla1(in1[7:0], in2[7:0], cIn, tmpCarry, tmpGG[0], tmpPG[0], sum[7:0]);
	CarryLookAheadAdder8 cla2(in1[15:8], in2[15:8], tmpCarry, cOut, tmpGG[1], tmpPG[1], sum[15:8]);
	
	//assign GG = tmpGG[1] & tmpGG[0];
	//assign PG = tmpPG[1] | tmpPG[0];
	and(GG, tmpGG[1], tmpGG[0]);
	or(PG, tmpPG[1], tmpPG[0]);


endmodule
