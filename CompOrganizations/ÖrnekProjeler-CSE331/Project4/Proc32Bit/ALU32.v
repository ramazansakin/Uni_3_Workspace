`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 		 Mehmet Akif TASOVA
// 
// Create Date:    13:02:58 11/22/2013 
// Design Name: 
// Module Name:    ALU32 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//			32 Bit ALU
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU32(
	input [3:0]opCode, //ALU opcode
	input [31:0] in1,
	input [31:0] in2,
	input [4:0]shAmt,
	output [31:0] out);
	
	wire [31:0]sum, subs, shifted, And, Or, Xor, Nor;
	
	//sum
	Add add(in1, in2, sum);
	
	//substract
	Substract sub(in1, in2, subs);
	
	//shift
	wire LorA, direction;
	assign LorA = opCode[0]; //logic or arithmetic
	assign direction = opCode[1];
	GenericShift32 shift(in1, shAmt, direction, LorA, shifted);
	
	//and
	And32 and1(in1, in2, And);
	
	//or
	Or32 or1(in1, in2, Or);
	
	//Xor
	Xor32 xor1(in1, in2, Xor);
	
	//Nor
	Nor32 nor1(in1, in2, Nor);
	
	wire [31:0] andOr, xorNor, addSub;
	
	Mux2to1_32 m1(And, Or, opCode[1], andOr);
	Mux2to1_32 m2(Nor, Xor, opCode[1], xorNor);
	Mux2to1_32 m3(sum, subs, opCode[1], addSub);
	
	wire [1:0]lastSel;
	assign lastSel[0] = opCode[2];
	assign lastSel[1] = opCode[3];
	
	Mux4to1_32 m4(shifted, andOr, xorNor, addSub, lastSel, out);

endmodule
