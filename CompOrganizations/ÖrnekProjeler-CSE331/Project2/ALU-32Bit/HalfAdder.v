`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 		 Mehmet Akif TAŞOVA
// 
// Create Date:    20:35:06 11/17/2013 
// Design Name: 
// Module Name:    HalfAdder 
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
module HalfAdder(
	input in1,
	input in2, 
	output cOut, 
	output sum);
	
	and(cOut, in1, in2);
	xor(sum, in1, in2);
	//assign cOut = in1 & in2;
	//assign sum = in1 ^ in2;

endmodule
