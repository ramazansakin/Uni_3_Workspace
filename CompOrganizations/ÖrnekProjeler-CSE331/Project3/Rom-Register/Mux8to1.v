`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:54:48 12/05/2013 
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
	input [31:0]in0,
	input [31:0]in1,
	input [31:0]in2,
	input [31:0]in3,
	input [31:0]in4,
	input [31:0]in5,
	input [31:0]in6,
	input [31:0]in7,
	input [2:0]sel, //select
	output [31:0]out
    );
	 
	 wire [31:0] w0, w1;
	 
	 Mux4to1 m1(in0, in1, in2, in3, sel[1:0], w0);
	 Mux4to1 m2(in4, in5, in6, in7, sel[1:0], w1);
	 
	 Mux2to1 m3(w0, w1, sel[2], out);

endmodule
