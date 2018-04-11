`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 		 Mehmet Akif TASOVA
// 
// Create Date:    12:57:53 11/18/2013 
// Design Name: 
// Module Name:    CarrylookAheadAdder8 
// Project Name: 	 32 Bit ALU
// Target Devices: 
// Tool versions: 
// Description: 
//			8 Bit Carry look Ahead Adder
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CarryLookAheadAdder8(
	input [7:0]in1,
	input [7:0]in2,
	input cIn, // carry in
	output cOut, // caryy out
	output GG, // generate sign
	output PG, // generate because propagete sign
	output [7:0]sum);
	
	wire tmpCarry;
	wire [1:0] tmpGG, tmpPG;
	
	CarryLookAheadAdder4 cla1(in1[3:0], in2[3:0], cIn, tmpCarry, tmpGG[0], tmpPG[0], sum[3:0]);
	CarryLookAheadAdder4 cla2(in1[7:4], in2[7:4], tmpCarry, cOut, tmpGG[1], tmpPG[1], sum[7:4]);
	
	//assign GG = tmpGG[1] & tmpGG[0];
	//assign PG = tmpPG[1] | tmpPG[0];
	and(GG, tmpGG[1], tmpGG[0]);
	or(PG, tmpPG[1], tmpPG[0]);

endmodule
