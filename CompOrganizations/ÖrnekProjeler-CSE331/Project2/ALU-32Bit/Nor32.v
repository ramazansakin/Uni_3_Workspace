`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:09:44 11/22/2013 
// Design Name: 
// Module Name:    Nor32 
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
module Nor32(
  	input [31:0] in1,
	input [31:0] in2,
	output [31:0] out);

	nor (out[0], in1[0], in2[0]);
	nor (out[1], in1[1], in2[1]);
	nor (out[2], in1[2], in2[2]);
	nor (out[3], in1[3], in2[3]);
	nor (out[4], in1[4], in2[4]);
	nor (out[5], in1[5], in2[5]);
	nor (out[6], in1[6], in2[6]);
	nor (out[7], in1[7], in2[7]);
	nor (out[8], in1[8], in2[8]);
	nor (out[9], in1[9], in2[9]);
	nor (out[10], in1[10], in2[10]);
	nor (out[11], in1[11], in2[11]);
	nor (out[12], in1[12], in2[12]);
	nor (out[13], in1[13], in2[13]);
	nor (out[14], in1[14], in2[14]);
	nor (out[15], in1[15], in2[15]);
	nor (out[16], in1[16], in2[16]);
	nor (out[17], in1[17], in2[17]);
	nor (out[18], in1[18], in2[18]);
	nor (out[19], in1[19], in2[19]);
	nor (out[20], in1[20], in2[20]);
	nor (out[21], in1[21], in2[21]);
	nor (out[22], in1[22], in2[22]);
	nor (out[23], in1[23], in2[23]);
	nor (out[24], in1[24], in2[24]);
	nor (out[25], in1[25], in2[25]);
	nor (out[26], in1[26], in2[26]);
	nor (out[27], in1[27], in2[27]);
	nor (out[28], in1[28], in2[28]);
	nor (out[29], in1[29], in2[29]);
	nor (out[30], in1[30], in2[30]);
	nor (out[31], in1[31], in2[31]);

endmodule
