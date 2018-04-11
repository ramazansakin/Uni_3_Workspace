`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:35:48 11/18/2013
// Design Name:   Shifter32
// Module Name:   C:/Users/makiftasova/Xilinx-Projects/ALU-32Bit/shifter32test.v
// Project Name:  ALU-32Bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Shifter32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module shifter32test;

	// Inputs
	reg [31:0] in;
	reg [4:0] shAmt;
	reg shBit;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	Shifter32 uut (
		.in(in), 
		.shAmt(shAmt), 
		.shBit(shBit), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		shAmt = 0;
		shBit = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		// Add stimulus here
		in = 32'b1;
		shAmt = 5'b1;
		#10;
		
		shAmt = 5'b11111;
      #10;
		

	end
	
	initial begin
		$monitor ("time:",$time,,"in=%b -- shamt=%b -- out=%b -- shbit = %b", in, shAmt, out, shBit);
	end
	
endmodule
