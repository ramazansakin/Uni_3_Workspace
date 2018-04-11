`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:00:47 11/18/2013 
// Design Name: 
// Module Name:    Mux4to1 
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
module Mux4to1(
	input [3:0]in,
	input [1:0]sel, // select
	output out);
	
	wire w[1:0];
	
	Mux2to1 m1(in[0], in[1], sel[0], w[0]);
	Mux2to1 m2(in[2], in[3], sel[0], w[1]);
	Mux2to1 m3(w[0], w[1], sel[1], out);

endmodule
