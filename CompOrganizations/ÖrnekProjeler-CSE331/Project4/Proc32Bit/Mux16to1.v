`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:58:31 12/05/2013 
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
	input [31:0]in0,
	input [31:0]in1,
	input [31:0]in2,
	input [31:0]in3,
	input [31:0]in4,
	input [31:0]in5,
	input [31:0]in6,
	input [31:0]in7,
	input [31:0]in8,
	input [31:0]in9,
	input [31:0]in10,
	input [31:0]in11,
	input [31:0]in12,
	input [31:0]in13,
	input [31:0]in14,
	input [31:0]in15,
	input [3:0]sel, //select
	output [31:0]out
	);
	
	wire[31:0] w0, w1;
	
	Mux8to1 m1(in0, in1, in2, in3, in4, in5, in6, in7, sel[2:0], w0);
	Mux8to1 m2(in8, in9, in10, in11, in12, in13, in14, in15, sel[2:0], w1);
	
	Mux2to1 m3(w0, w1, sel[3], out);

endmodule
