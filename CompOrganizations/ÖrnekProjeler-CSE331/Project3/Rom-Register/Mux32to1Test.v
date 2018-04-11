`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:05:14 12/06/2013
// Design Name:   Mux32to1
// Module Name:   /home/makiftasova/cse331-computer-organisation/Project3/Rom-Register/Mux32to1Test.v
// Project Name:  Rom-Register
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mux32to1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Mux32to1Test;

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
	reg [31:0] in16;
	reg [31:0] in17;
	reg [31:0] in18;
	reg [31:0] in19;
	reg [31:0] in20;
	reg [31:0] in21;
	reg [31:0] in22;
	reg [31:0] in23;
	reg [31:0] in24;
	reg [31:0] in25;
	reg [31:0] in26;
	reg [31:0] in27;
	reg [31:0] in28;
	reg [31:0] in29;
	reg [31:0] in30;
	reg [31:0] in31;
	reg [4:0] sel;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	Mux32to1 uut (
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
		.in16(in16), 
		.in17(in17), 
		.in18(in18), 
		.in19(in19), 
		.in20(in20), 
		.in21(in21), 
		.in22(in22), 
		.in23(in23), 
		.in24(in24), 
		.in25(in25), 
		.in26(in26), 
		.in27(in27), 
		.in28(in28), 
		.in29(in29), 
		.in30(in30), 
		.in31(in31), 
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
		in16 = 16;
		in17 = 17;
		in18 = 18;
		in19 = 19;
		in20 = 20;
		in21 = 21;
		in22 = 22;
		in23 = 23;
		in24 = 24;
		in25 = 25;
		in26 = 26;
		in27 = 27;
		in28 = 28;
		in29 = 29;
		in30 = 30;
		in31 = 31;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		for(i=0; i<32; i=i+1) begin
			#10;
			sel = i;
			#10;
		end

	end
	
	initial begin
		$monitor("sel:%d, out:%d", sel, out);
	end
      
endmodule

