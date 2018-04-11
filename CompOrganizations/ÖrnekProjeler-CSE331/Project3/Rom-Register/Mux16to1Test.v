`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:00:52 12/06/2013
// Design Name:   Mux16to1
// Module Name:   /home/makiftasova/cse331-computer-organisation/Project3/Rom-Register/Mux16to1Test.v
// Project Name:  Rom-Register
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mux16to1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Mux16to1Test;

	// Inputs
	reg [31:0] in0;
	reg [31:0] in1;
	reg [31:0] in2;
	reg [31:0] in3;
	reg [31:0] in4;
	reg [31:0] in5;
	reg [31:0] in6;
	reg [31:0] in7;
	reg [31:0] in8;
	reg [31:0] in9;
	reg [31:0] in10;
	reg [31:0] in11;
	reg [31:0] in12;
	reg [31:0] in13;
	reg [31:0] in14;
	reg [31:0] in15;
	reg [3:0] sel;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	Mux16to1 uut (
		.in0(in0), 
		.in1(in1), 
		.in2(in2), 
		.in3(in3), 
		.in4(in4), 
		.in5(in5), 
		.in6(in6), 
		.in7(in7), 
		.in8(in8), 
		.in9(in9), 
		.in10(in10), 
		.in11(in11), 
		.in12(in12), 
		.in13(in13), 
		.in14(in14), 
		.in15(in15), 
		.sel(sel), 
		.out(out)
	);

	integer i;

	initial begin
		// Initialize Inputs
		in0 = 0;
		in1 = 1;
		in2 = 2;
		in3 = 3;
		in4 = 4;
		in5 = 5;
		in6 = 6;
		in7 = 7;
		in8 = 8;
		in9 = 9;
		in10 = 10;
		in11 = 11;
		in12 = 12;
		in13 = 13;
		in14 = 14;
		in15 = 15;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		for(i=0; i<16; i=i+1) begin
			#10;
			sel = i;
			#10;
		end

	end
	
	initial begin
		$monitor("sel:%d, out:%d", sel, out);
	end
      
endmodule

