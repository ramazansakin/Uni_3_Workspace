`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:58:08 11/18/2013
// Design Name:   Reverser16
// Module Name:   C:/Users/makiftasova/Xilinx-Projects/ALU-32Bit/reverser16test.v
// Project Name:  ALU-32Bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Reverser16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module reverser16test;

	// Inputs
	reg [15:0] in;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	Reverser16 uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 16'b10101010;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	initial begin
		$monitor("time:",$time,, "in=%b, out=%b", in, out);
	end
      
endmodule

