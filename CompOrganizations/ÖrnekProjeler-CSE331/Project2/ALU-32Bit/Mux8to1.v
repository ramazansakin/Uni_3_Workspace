`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:08:36 11/18/2013 
// Design Name: 
// Module Name:    Mux8to1 
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
module Mux8to1(
	input [7:0]in,
	input [2:0]sel, // select
	output out );
	
	wire [1:0]w;
	
	Mux4to1 m1(in[3:0], sel[1:0], w[0]);
	Mux4to1 m2(in[7:4], sel[1:0], w[1]);
	Mux2to1 m3(w[0], w[1], sel[2], out);

endmodule
