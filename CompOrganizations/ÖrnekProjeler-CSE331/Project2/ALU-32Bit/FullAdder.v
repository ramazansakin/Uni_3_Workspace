`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 		 Mehmet Akif TAŞOVA
// 
// Create Date:    20:36:05 11/17/2013 
// Design Name: 
// Module Name:    FullAdder 
// Project Name: 	 32 Bit ALU
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
module FullAdder(
	input in1, 
	input in2, 
	input cIn, 
	output cOut, 
	output sum);
	
	wire halfSum, carry1, carry2;
	
	HalfAdder ha1(in1, in2, carry1, halfSum);
	HalfAdder ha2(halfSum, cIn, carry2, sum);
	
	//assign cOut = carry1 | carry2;
	or(cOut, carry1, carry2);


endmodule
