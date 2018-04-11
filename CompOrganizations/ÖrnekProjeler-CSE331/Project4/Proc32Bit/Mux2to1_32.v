`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:55:07 11/22/2013 
// Design Name: 
// Module Name:    Mux2to1_32 
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
module Mux2to1_32(
	input [31:0]in1,
	input [31:0]in2,
	input sel,
	output [31:0]out);
	
	Mux2to1 m00(in1[0], in2[0], sel, out[0]);
	Mux2to1 m01(in1[1], in2[1], sel, out[1]);
	Mux2to1 m02(in1[2], in2[2], sel, out[2]);
	Mux2to1 m03(in1[3], in2[3], sel, out[3]);
	Mux2to1 m04(in1[4], in2[4], sel, out[4]);
	Mux2to1 m05(in1[5], in2[5], sel, out[5]);
	Mux2to1 m06(in1[6], in2[6], sel, out[6]);
	Mux2to1 m07(in1[7], in2[7], sel, out[7]);
	Mux2to1 m08(in1[8], in2[8], sel, out[8]);
	Mux2to1 m09(in1[9], in2[9], sel, out[9]);
	Mux2to1 m10(in1[10], in2[10], sel, out[10]);
	Mux2to1 m11(in1[11], in2[11], sel, out[11]);
	Mux2to1 m12(in1[12], in2[12], sel, out[12]);
	Mux2to1 m13(in1[13], in2[13], sel, out[13]);
	Mux2to1 m14(in1[14], in2[14], sel, out[14]);
	Mux2to1 m15(in1[15], in2[15], sel, out[15]);
	Mux2to1 m16(in1[16], in2[16], sel, out[16]);
	Mux2to1 m17(in1[17], in2[17], sel, out[17]);
	Mux2to1 m18(in1[18], in2[18], sel, out[18]);
	Mux2to1 m19(in1[19], in2[19], sel, out[19]);
	Mux2to1 m20(in1[20], in2[20], sel, out[20]);
	Mux2to1 m21(in1[21], in2[21], sel, out[21]);
	Mux2to1 m22(in1[22], in2[22], sel, out[22]);
	Mux2to1 m23(in1[23], in2[23], sel, out[23]);
	Mux2to1 m24(in1[24], in2[24], sel, out[24]);
	Mux2to1 m25(in1[25], in2[25], sel, out[25]);
	Mux2to1 m26(in1[26], in2[26], sel, out[26]);
	Mux2to1 m27(in1[27], in2[27], sel, out[27]);
	Mux2to1 m28(in1[28], in2[28], sel, out[28]);
	Mux2to1 m29(in1[29], in2[29], sel, out[29]);
	Mux2to1 m30(in1[30], in2[30], sel, out[30]);
	Mux2to1 m31(in1[31], in2[31], sel, out[31]);


endmodule
