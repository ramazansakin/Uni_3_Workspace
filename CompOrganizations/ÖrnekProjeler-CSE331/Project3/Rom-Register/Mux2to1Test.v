`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:46:56 12/05/2013
// Design Name:   Mux2to1
// Module Name:   /home/makiftasova/cse331-computer-organisation/Project3/Rom-Register/Mux2to1Test.v
// Project Name:  Rom-Register
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mux2to1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Mux2to1Test;

	// Inputs
	reg [31:0] in0;
	reg [31:0] in1;
	reg sel;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	Mux2to1 uut (
		.in0(in0), 
		.in1(in1), 
		.sel(sel), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in0 = 32'b0;
		in1 = 32'b11111111111111111111111111111111;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		sel = 1;
		

	end
	
	initial begin
		$monitor("sel:%d, out:%d", sel, out);
	end
      
endmodule

