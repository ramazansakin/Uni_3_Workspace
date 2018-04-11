`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 		 Mehmet Akif TASOVA
// 
// Create Date:    13:50:54 11/18/2013 
// Design Name: 
// Module Name:    Reverser8 
// Project Name: 	 32 Bit ALU
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//			8 Bit Reverser
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Reverser8(
	input [7:0]in,
	output [7:0]out);
	
	assign out[7] = in[0];
	assign out[6] = in[1];
	assign out[5] = in[2];
	assign out[4] = in[3];
	assign out[3] = in[4];
	assign out[2] = in[5];
	assign out[1] = in[6];
	assign out[0] = in[7];

endmodule
