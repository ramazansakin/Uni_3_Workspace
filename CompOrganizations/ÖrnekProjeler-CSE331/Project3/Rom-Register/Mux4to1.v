`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:48:26 12/05/2013 
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
	input [31:0]in0,
	input [31:0]in1,
	input [31:0]in2,
	input [31:0]in3,
	input [1:0]sel, //select
	output [31:0]out
    );
	 
	 wire [31:0] w0, w1; //temp wires
	 
	 Mux2to1 m1(in0, in1, sel[0], w0);
	 Mux2to1 m2(in2, in3, sel[0], w1);
	 
	 Mux2to1 m3(w0, w1, sel[1], out); 


endmodule
