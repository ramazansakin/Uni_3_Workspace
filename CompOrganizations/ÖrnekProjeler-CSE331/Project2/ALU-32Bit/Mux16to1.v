`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:11:53 11/18/2013 
// Design Name: 
// Module Name:    Mux16to1 
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
module Mux16to1(
	input [15:0]in,
	input [3:0]sel, // select
	output out );
	
	wire [1:0]w;
	
	Mux8to1 m1(in[7:0], sel[2:0], w[0]);
	Mux8to1 m2(in[15:8], sel[2:0], w[0]);
	Mux2to1 m3(w[0], w[1], sel[3], out);
	
endmodule
