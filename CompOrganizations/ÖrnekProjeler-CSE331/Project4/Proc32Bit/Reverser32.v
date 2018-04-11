`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:59:56 11/18/2013 
// Design Name: 
// Module Name:    Reverser32 
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
module Reverser32(
	input [31:0]in,
	output [31:0]out);
	
	Reverser16 r1(in[15:0], out[31:16]);
	Reverser16 r2(in[31:16], out[15:0]);

endmodule
