`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:05:51 11/17/2013 
// Design Name: 
// Module Name:    FullAdder32 
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
module FullAdder32(
	input [31:0]in1,
	input [31:0]in2, 
	input cIn, 
	output cOut, 
	output [31:0] sum);
	
	wire tmpCarry; //inside carry
	
	FullAdder16 fa1(in1[15:0], in2[15:0], cIn, tmpCarry, sum[15:0]);
	FullAdder16 fa2(in1[31:16], in2[31:16], tmpCarry, cOut, sum[31:16]);


endmodule
