`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 		 Mehmet Akif TASOVA
// 
// Create Date:    13:17:52 11/18/2013 
// Design Name: 
// Module Name:    BarrelShifter8 
// Project Name: 	 32 Bit ALU
// Target Devices: 
// Tool versions: 
// Description: 
//			8 Bit Left Shifter
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Shifter8(
	input [7:0]in, // data
	input [2:0]shAmt, // Shift Amaount
	input shBit, // add this bit in to data when shifting
	output [7:0]out ); //shifted data

	// cross stage wires
	wire [7:0]s1, s2;
	
	// mux stage 1
	Mux2to1 m11(in[0], shBit, shAmt[0], s1[0]);
	Mux2to1 m12(in[1], in[0], shAmt[0], s1[1]);
	Mux2to1 m13(in[2], in[1], shAmt[0], s1[2]);
	Mux2to1 m14(in[3], in[2], shAmt[0], s1[3]);
	Mux2to1 m15(in[4], in[3], shAmt[0], s1[4]);
	Mux2to1 m16(in[5], in[4], shAmt[0], s1[5]);
	Mux2to1 m17(in[6], in[5], shAmt[0], s1[6]);
	Mux2to1 m18(in[7], in[6], shAmt[0], s1[7]);
	
	// mux stage 2
	
	Mux2to1 m21(s1[0], shBit, shAmt[1], s2[0]);
	Mux2to1 m22(s1[1], shBit, shAmt[1], s2[1]);
	Mux2to1 m23(s1[2], s1[0], shAmt[1], s2[2]);
	Mux2to1 m24(s1[3], s1[1], shAmt[1], s2[3]);
	Mux2to1 m25(s1[4], s1[2], shAmt[1], s2[4]);
	Mux2to1 m26(s1[5], s1[3], shAmt[1], s2[5]);
	Mux2to1 m27(s1[6], s1[4], shAmt[1], s2[6]);
	Mux2to1 m28(s1[7], s1[5], shAmt[1], s2[7]);
	
	// mux stage 3
	Mux2to1 m31(s2[0], shBit, shAmt[2], out[0]);
	Mux2to1 m32(s2[1], shBit, shAmt[2], out[1]);
	Mux2to1 m33(s2[2], shBit, shAmt[2], out[2]);
	Mux2to1 m34(s2[3], shBit, shAmt[2], out[3]);
	Mux2to1 m35(s2[4], s2[0], shAmt[2], out[4]);
	Mux2to1 m36(s2[5], s2[1], shAmt[2], out[5]);
	Mux2to1 m37(s2[6], s2[2], shAmt[2], out[6]);
	Mux2to1 m38(s2[7], s2[3], shAmt[2], out[7]);

endmodule
