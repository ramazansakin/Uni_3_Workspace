`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:52:18 12/05/2013
// Design Name:   Mux4to1
// Module Name:   /home/makiftasova/cse331-computer-organisation/Project3/Rom-Register/Mux4to1Test.v
// Project Name:  Rom-Register
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mux4to1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Mux4to1Test;

	// Inputs
	reg [31:0] in0;
	reg [31:0] in1;
	reg [31:0] in2;
	reg [31:0] in3;
	reg [1:0] sel;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	Mux4to1 uut (
		.in0(in0), 
		.in1(in1), 
		.in2(in2), 
		.in3(in3), 
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
		
		sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		for(i=0; i<4; i=i+1) begin
			#10;
			sel = i;
			#10;
		end

	end
	
	initial begin
		$monitor("sel:%d, out:%d", sel, out);
	end
      
endmodule

