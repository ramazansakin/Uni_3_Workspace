`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 		 Mehmet Akif TASOVA
// 
// Create Date:    13:56:25 11/18/2013 
// Design Name: 
// Module Name:    Reverser16 
// Project Name: 	 32 Bit ALU
// Target Devices: 
// Tool versions: 
// Description: 
//		16 Bit Reverser
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Reverser16(
	input [15:0]in,
	output [15:0]out);
	
	Reverser8 r1(in[7:0], out[15:8]);
	Reverser8 r2(in[15:8], out[7:0]);

endmodule
