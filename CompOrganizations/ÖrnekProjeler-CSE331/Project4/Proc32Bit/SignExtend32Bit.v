`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    20:47:55 12/30/2013
// Design Name:
// Module Name:    SignExtend32Bit
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
module SignExtend32Bit(
	input [15:0] in,
	output [31:0] out
    );

	 wire [31:0]tmp;

	 assign tmp[15:0] = in[15:0];

	 assign tmp[16] = {1&in[15]};
	 assign tmp[17] = {1&in[15]};
	 assign tmp[18] = {1&in[15]};
	 assign tmp[19] = {1&in[15]};
	 assign tmp[20] = {1&in[15]};
	 assign tmp[21] = {1&in[15]};
	 assign tmp[22] = {1&in[15]};
	 assign tmp[23] = {1&in[15]};
	 assign tmp[24] = {1&in[15]};
	 assign tmp[25] = {1&in[15]};
	 assign tmp[26] = {1&in[15]};
	 assign tmp[27] = {1&in[15]};
	 assign tmp[28] = {1&in[15]};
	 assign tmp[29] = {1&in[15]};
	 assign tmp[30] = {1&in[15]};
	 assign tmp[31] = {1&in[15]};

	 assign out = tmp;


endmodule
