`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:16:58 11/22/2013 
// Design Name: 
// Module Name:    Add 
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
module Add(
   input [31:0] in1,
	input [31:0] in2,
	output [31:0] out);
	
	wire cOut, PG, GG;
	wire cIn;
	assign cIn = 0;
	
	CarryLookAheadAdder32 cla(in1, in2, cIn, cOut, PG, GG, out);


endmodule
