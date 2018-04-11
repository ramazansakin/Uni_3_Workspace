`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 		 Mehmet Akif TAŞOVA
// 
// Create Date:    22:00:39 11/17/2013 
// Design Name: 
// Module Name:    FullAdder8 
// Project Name: 	 32 Bit ALU
// Target Devices: 
// Tool versions: 
// Description: 
//			8 Bit FullAdder
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FullAdder8(
	input [7:0]in1,
	input [7:0]in2, 
	input cIn, 
	output cOut, 
	output [7:0] sum);
	
	wire tmpCarry; //inside carry
	
	FullAdder4(in1[3:0], in2[3:0], cIn, tmpCarry, sum[3:0]);
	FullAdder4(in1[7:4], in2[7:4], tmpCarry, cOut, sum[7:4]);


endmodule
