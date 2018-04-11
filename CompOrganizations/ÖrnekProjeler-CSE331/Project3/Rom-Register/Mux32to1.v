`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:01:58 12/06/2013 
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
	input [31:0]in16,
	input [31:0]in17,
	input [31:0]in18,
	input [31:0]in19,
	input [31:0]in20,
	input [31:0]in21,
	input [31:0]in22,
	input [31:0]in23,
	input [31:0]in24,
	input [31:0]in25,
	input [31:0]in26,
	input [31:0]in27,
	input [31:0]in28,
	input [31:0]in29,
	input [31:0]in30,
	input [31:0]in31,
	input [4:0]sel, //select
	output [31:0]out
   );
	 
	wire[31:0] w0, w1;
	 
	Mux16to1 m1(in0, in1, in2, in3, in4, in5, in6, in7, in8,
							in9, in10, in11, in12, in13, in14, in15, sel[3:0], w0);
	
	Mux16to1 m2(in16, in17, in18, in19, in20, in21, in22, in23, in24,
							in25, in26, in27, in28, in29, in30, in31, sel[3:0], w1);
							
	Mux2to1 m3(w0, w1, sel[4], out);
							
							


endmodule
