`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:43:47 11/22/2013 
// Design Name: 
// Module Name:    GenericShift32 
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
module GenericShift32(
	input [31:0]in,
	input [4:0]shAmt, //shift amount
	input direction, //0 for right shift, 1 for left shift
	input LorA, // 0 for logic, 1 for arithmetic shift
	output [31:0]out);
	 
	wire [31:0]sll, srl, sra;
	
	// sll
	Shifter32 shift_sll(in, shAmt, 0, sll);
	
	// right shift
	wire [31:0] reverse;
	Reverser32 rev(in, reverse);
	
	//srl
	wire [31:0]tmp1;
	Shifter32 shift_srl(reverse, shAmt, 0, tmp1);
	Reverser32 rev_srl(tmp1, srl);
	
	//sra
	wire [31:0]tmp2;
	wire shBit;
	assign shBit = in[31];
	Shifter32 shift_sra(reverse, shAmt, shBit, tmp2);
	Reverser32 rev_sra(tmp2, sra); 
	
	// logic or atithmetic
	wire [31:0]tmp3;
	Mux2to1_32 mux1(srl, sra, LorA, tmp3);
	
	//left or right
	Mux2to1_32 mux2(tmp3, sll, direction, out);
	
endmodule
