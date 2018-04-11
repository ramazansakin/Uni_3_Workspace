`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:26:03 12/05/2013 
// Design Name: 
// Module Name:    Mux2to1 
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
module Mux2to1(
	input [31:0]in0, // input 0
	input [31:0]in1, //input 1
	input sel, //select
	output [31:0]out //output	
    );
	 
	 assign out = ((sel == 0) ? in0 : in1);

endmodule
