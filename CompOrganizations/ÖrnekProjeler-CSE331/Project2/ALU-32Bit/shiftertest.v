`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:47:40 11/18/2013
// Design Name:   BarrelShifter8
// Module Name:   C:/Users/makiftasova/Xilinx-Projects/ALU-32Bit/shiftertest.v
// Project Name:  ALU-32Bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BarrelShifter8
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module shiftertest;

	// Inputs
	reg [7:0] in;
	reg [2:0] shAmt;
	reg shBit;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	Shifter8 uut (
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
		
		in = 8'b00001111;
		shAmt = 3'b011;
        
		// Add stimulus here

	end
	
	initial begin
		$monitor("$time=",$time,,"in=%b, shamt=%b, out=%b, shbit=%b", in, shAmt, out, shBit);
   end
      
endmodule

