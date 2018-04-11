`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:05:00 11/17/2013 
// Design Name: 
// Module Name:    FullAdder16 
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
module FullAdder16(
	input [15:0]in1,
	input [15:0]in2, 
	input cIn, 
	output cOut, 
	output [15:0] sum);
	
	wire tmpCarry; //inside carry
	
	FullAdder8 fa1(in1[7:0], in2[7:0], cIn, tmpCarry, sum[7:0]);
	FullAdder8 fa2(in1[15:8], in2[15:8], tmpCarry, cOut, sum[15:8]);


endmodule
