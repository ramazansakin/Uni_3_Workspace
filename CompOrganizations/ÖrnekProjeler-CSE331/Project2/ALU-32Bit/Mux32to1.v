`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:14:57 11/18/2013 
// Design Name: 
// Module Name:    Mux32to1 
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
module Mux32to1(
	input [31:0]in,
	input [4:0]sel, // select
	output out );
	
	wire [1:0]w;
	
	Mux16to1 m1(in[15:0], sel[3:0], w[0]);
	Mux16to1 m2(in[31:16], sel[3:0], w[1]);
	Mux2to1 m3(w[0], w[1], sel[4], out);	
	
endmodule
