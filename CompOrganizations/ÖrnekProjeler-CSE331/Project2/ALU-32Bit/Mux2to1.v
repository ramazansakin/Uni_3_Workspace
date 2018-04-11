`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 		 Mehmet Akif TASOVA
// 
// Create Date:    13:15:55 11/18/2013 
// Design Name: 
// Module Name:    Mux2to1 
// Project Name: 	 32 Bit ALU
// Target Devices: 
// Tool versions: 
// Description: 
//			2 to 1 Mux
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Mux2to1(
	input in1,
	input in2,
	input sel, // select
	output out);
	
	//assign out = ((sel == 1) ? in2 : in1);
	
	wire w1, w2, w3;
	
	not(w1, sel);
	and(w2, w1, in1);
	and(w3, sel, in2);
	or(out, w2, w3);
	
endmodule
