`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:57:11 12/05/2013
// Design Name:   Mux8to1
// Module Name:   /home/makiftasova/cse331-computer-organisation/Project3/Rom-Register/Mux8to1Test.v
// Project Name:  Rom-Register
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mux8to1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Mux8to1Test;

	// Inputs
	reg [31:0] in0;
	reg [31:0] in1;
	reg [31:0] in2;
	reg [31:0] in3;
	reg [31:0] in4;
	reg [31:0] in5;
	reg [31:0] in6;
	reg [31:0] in7;
	reg [2:0] sel;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	Mux8to1 uut (
		.in0(in0), 
		.in1(in1), 
		.in2(in2), 
		.in3(in3), 
		.in4(in4), 
		.in5(in5), 
		.in6(in6), 
		.in7(in7), 
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
		
		sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		for(i=0; i<8; i=i+1) begin
			#10;
			sel = i;
			#10;
		end

	end
	
	initial begin
		$monitor("sel:%d, out:%d", sel, out);
	end
      
endmodule

