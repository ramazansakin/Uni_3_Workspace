`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:50:43 12/30/2013
// Design Name:   SignExtend32Bit
// Module Name:   C:/cygwin/home/makiftasova/cse331 - computer organisation/Project4/Proc32Bit/setest.v
// Project Name:  Proc32Bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SignExtend32Bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module setest;

	// Inputs
	reg [15:0] in;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	SignExtend32Bit uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 16'b1111111111111111;

		// Wait 100 ns for global reset to finish
		#100;
		
		in = 16'b0111111111111111;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	initial begin
	$monitor("in:%b, out = %b", in, out);
	end
	
      
endmodule

