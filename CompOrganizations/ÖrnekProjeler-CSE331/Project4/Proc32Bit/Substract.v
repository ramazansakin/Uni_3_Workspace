`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:12:40 11/22/2013 
// Design Name: 
// Module Name:    Substract 
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
module Substract(
	input [31:0] in1,
	input [31:0] in2,
	output [31:0] out);
	
	wire [31:0]tmp, pure;
	wire cOut, PG, GG;
	wire cIn;
	
	assign pure[0] = 1;
	assign pure[1] = 1;
	assign pure[2] = 1;
	assign pure[3] = 1;
	assign pure[4] = 1;
	assign pure[5] = 1;
	assign pure[6] = 1;
	assign pure[7] = 1;
	assign pure[8] = 1;
	assign pure[9] = 1;
	assign pure[10] = 1;
	assign pure[11] = 1;
	assign pure[12] = 1;
	assign pure[13] = 1;
	assign pure[14] = 1;
	assign pure[15] = 1;
	assign pure[16] = 1;
	assign pure[17] = 1;
	assign pure[18] = 1;
	assign pure[19] = 1;
	assign pure[20] = 1;
	assign pure[21] = 1;
	assign pure[22] = 1;
	assign pure[23] = 1;
	assign pure[24] = 1;
	assign pure[25] = 1;
	assign pure[26] = 1;
	assign pure[27] = 1;
	assign pure[28] = 1;
	assign pure[29] = 1;
	assign pure[30] = 1;
	assign pure[31] = 1;
	
	Xor32 xor1(in2, pure, tmp);
	assign cIn = 1;
	
	CarryLookAheadAdder32 cla(in1, tmp, cIn, cOut, PG, GG, out);

endmodule
