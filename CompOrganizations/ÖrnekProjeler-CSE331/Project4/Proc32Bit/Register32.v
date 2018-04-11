`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:		Mehmet Akif TASOVA
//
// Create Date:    15:18:29 12/06/2013
// Design Name:
// Module Name:    Register32
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
module Register32(
	input CLK, // clock
	input reset, //register reset
	input writeEn, //write enable
	input [31:0]IN, //input
	output [31:0] OUT //output
   );

	reg [31:0] OUT;

    always @(posedge CLK ) begin
        if(reset)
            OUT = 0;
        else if(writeEn)
            OUT = IN;
   end

endmodule
