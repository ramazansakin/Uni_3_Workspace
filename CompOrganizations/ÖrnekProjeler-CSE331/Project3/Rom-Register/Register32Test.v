`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:21:35 12/06/2013
// Design Name:   Register32
// Module Name:   C:/cygwin/home/makiftasova/cse331 - computer organisation/Project3/Rom-Register/Register32Test.v
// Project Name:  Rom-Register
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Register32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Register32Test;

	// Inputs
	reg CLK;
	reg reset;
	reg writeEn;
	reg [31:0] IN;

	// Outputs
	wire [31:0] OUT;

	// Instantiate the Unit Under Test (UUT)
	Register32 uut (
		.CLK(CLK), 
		.reset(reset), 
		.writeEn(writeEn),
		.IN(IN), 
		.OUT(OUT)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		reset = 0;
		IN = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		CLK = 1;
		IN = 32'b11111;
		reset = 0;
		writeEn = 0;
		
		
		#50;		
		CLK = 0;
		
		#50;		
		CLK = 1;
		writeEn = 1;
		IN = 32'b10101;
		reset = 0;
		
		#50;		
		CLK = 0;
		IN = 32'b1;
		
		#50;		
		CLK = 1;
		writeEn = 0;
		IN = 32'b111101010100001;
		reset = 0;
		
		#50;		
		CLK = 0;
		
		#50;		
		CLK = 1;
		writeEn = 1;
		IN = 32'b110001010100011;
		reset = 0;
		
		#50;		
		CLK = 0;
		
		#50;		
		CLK = 1;
		writeEn = 0;
		IN = 32'b0;
		reset = 1;
		
		#50;		
		CLK = 0;
		
		#50;		
		CLK = 1;
		writeEn = 1;
		IN = 32'b1111;
		reset = 1;

	end
	
	initial begin
		$monitor("CLK:%b, reset:%b, writeEn:%b, in:%d, out:%d", CLK, reset, writeEn, IN, OUT);
	end
      
endmodule

