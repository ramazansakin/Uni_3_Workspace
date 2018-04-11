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

	// mux stage 1
	wire s11, s12, s13, s14, s15, s16, s17, s18; //wires to use
	
	Mux2to1 m11(in[0], shBit, shAmt[0], s11);
	Mux2to1 m12(in[1], in[0], shAmt[0], s12);
	Mux2to1 m13(in[2], in[1], shAmt[0], s13);
	Mux2to1 m14(in[3], in[2], shAmt[0], s14);
	Mux2to1 m15(in[4], in[3], shAmt[0], s15);
	Mux2to1 m16(in[5], in[4], shAmt[0], s16);
	Mux2to1 m17(in[6], in[5], shAmt[0], s17);
	Mux2to1 m18(in[7], in[6], shAmt[0], s18);
	
	// mux stage 2
	wire s21, s22, s23, s24, s25, s26, s27, s28; //wires to use
	
	Mux2to1 m21(s11, shBit, shAmt[1], s21);
	Mux2to1 m22(s12, shBit, shAmt[1], s22);
	Mux2to1 m23(s13, s11, shAmt[1], s23);
	Mux2to1 m24(s14, s12, shAmt[1], s24);
	Mux2to1 m25(s15, s13, shAmt[1], s25);
	Mux2to1 m26(s16, s14, shAmt[1], s26);
	Mux2to1 m27(s17, s15, shAmt[1], s27);
	Mux2to1 m28(s18, s16, shAmt[1], s28);
	
	// mux stage 3
	Mux2to1 m31(s21, shBit, shAmt[2], out[0]);
	Mux2to1 m32(s22, shBit, shAmt[2], out[1]);
	Mux2to1 m33(s23, shBit, shAmt[2], out[2]);
	Mux2to1 m34(s24, shBit, shAmt[2], out[3]);
	Mux2to1 m35(s25, s21, shAmt[2], out[4]);
	Mux2to1 m36(s26, s22, shAmt[2], out[5]);
	Mux2to1 m37(s27, s23, shAmt[2], out[6]);
	Mux2to1 m38(s28, s24, shAmt[2], out[7]);

endmodule
