`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 		 Mehmet Akif TAŞOVA
// 
// Create Date:    22:02:30 11/17/2013 
// Design Name: 
// Module Name:    FullAdder2 
// Project Name: 	 32 Bit ALU
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//			2 Bit FullAdder
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FullAdder2(
	input [1:0]in1,
	input [1:0]in2, 
	input cIn, 
	output cOut, 
	output [1:0] sum);
	
	wire tmpCarry; //inside carry
	
	FullAdder fa1(in1[0], in2[0], cIn, tmpCarry, sum[0]);
	FullAdder fa2(in1[1], in2[1], tmpCarry, cOut, sum[1]);


endmodule
