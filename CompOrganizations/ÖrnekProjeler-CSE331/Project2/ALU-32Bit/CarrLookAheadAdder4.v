`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 		 Mehmet Akif TASOVA
// 
// Create Date:    12:50:52 11/18/2013 
// Design Name: 
// Module Name:    CarrLookAheadAdder4 
// Project Name:   32 Bit ALU
// Target Devices: 
// Tool versions: 
// Description: 
//			4 Bit Carry Look Ahead Adder
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CarryLookAheadAdder4(
	input [3:0]in1,
	input [3:0]in2,
	input cIn, // carry in
	output cOut, // caryy out
	output GG, // group generate
	output PG, // group propagete
	output [3:0]sum);
	
	wire [3:0]P, G, C; // propagete, generate, internal carry
	
	//assign G = in1 & in2;
	//assign P = in1 ^ in2;
	and(G[0], in1[0], in2[0]);
	and(G[1], in1[1], in2[1]);
	and(G[2], in1[2], in2[2]);
	and(G[3], in1[3], in2[3]);
	
	xor(P[0], in1[0], in2[0]);
	xor(P[1], in1[1], in2[1]);
	xor(P[2], in1[2], in2[2]);
	xor(P[3], in1[3], in2[3]);
	
	assign C[0] = cIn;
	
	
	//assign C[1] = G[0] | (P[0] & C[0]);
	wire w1;
	and(w1, P[0], C[0]);
	or(C[1], G[0], w1);
	
	//assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
	wire w2, w3;
	and(w2, P[1], G[0]);
	and(w3, P[1], P[0], C[0]);
	or(C[2], G[1], w2, w3);
	
	//assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
	wire w4, w5, w6;
	and(w4, P[2], G[1]);
	and(w5, P[2], P[1], G[0]);
	and(w6, P[2], P[1], P[0], C[0]);
	or(C[3], G[2], w4, w5, w6);
	
	//assign cOut = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) |(P[3] & P[2] & P[1] & P[0] & C[0]);
	wire w7, w8, w9, w10;
	and(w7, P[3], G[2]);
	and(w8, P[3], P[2], G[1]);
	and(w9, P[3], P[2], P[1], G[0]);
	and(w10, P[3], P[2], P[1], P[0], C[0]);
	or(cOut, G[3], w7, w8, w9, w10);
	
	//assign sum = P ^ C;
	xor(sum[0], P[0], C[0]);
	xor(sum[1], P[1], C[1]);
	xor(sum[2], P[2], C[2]);
	xor(sum[3], P[3], C[3]);
	
	//assign PG = (P[3] & P[2] & P[1] & P[0]);
	and(PG, P[3], P[2], P[1], P[0]);
	
	//assign GG = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);
	wire w11, w12, w13;
	and(w11, P[3], G[2]);
	and(w12, P[3], P[2], G[1]);
	and(w13, P[3], P[2], P[1], G[0]);
	or(GG, G[3], w11, w12, w13);

endmodule
