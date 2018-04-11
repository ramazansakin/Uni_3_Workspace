`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 		 Mehmet Akif TAŞOVA
// 
// Create Date:    20:42:30 11/17/2013 
// Design Name: 
// Module Name:    FullAdder4 
// Project Name: 	 32 Bit ALU
// Target Devices: 
// Tool versions: 
// Description: 
//			4 Bir FullAdder
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FullAdder4(
	input [3:0]in1,
	input [3:0]in2, 
	input cIn, 
	output cOut, 
	output [3:0] sum);
	
	wire tmpCarry; //inside carry
	
	FullAdder2 fa1(in1[1:0], in2[1:0], cIn, tmpCarry, sum[1:0]);
	FullAdder2 fa2(in1[3:2], in2[3:2], tmpCarry, cOut, sum[3:2]);


endmodule
