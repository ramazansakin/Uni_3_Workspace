`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 		Mehmet Akif TAŞOVA
// 
// Create Date:    15:08:35 12/05/2013 
// Design Name: 
// Module Name:    Mem32Bit 
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
module Mem32Bit(
	input [27:0]address,
	input readEn,
	output [31:0]data	
   );
	 
	//reg [31:0] memory [0:33554432]; //real memory length for 512MB
	reg [31:0] memory [0:127]; //for testing purposes reduced to current size
	
	assign data = ((readEn) ? memory[address] : 32'b0);
	 
	initial begin
	$readmemb("memory32.mem", memory);
	end
	
endmodule
