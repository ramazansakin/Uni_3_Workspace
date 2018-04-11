`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:20:02 12/05/2013
// Design Name:   Mem32Bit
// Module Name:   /home/makiftasova/cse331-computer-organisation/Project3/Rom-Register/Mem32BitTest.v
// Project Name:  Rom-Register
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mem32Bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Mem32BitTest;

	// Inputs
	reg [27:0] address;
	reg readEn;

	// Outputs
	wire [31:0] data;

	// Instantiate the Unit Under Test (UUT)
	Mem32Bit uut (
		.address(address), 
		.readEn(readEn), 
		.data(data)
	);

integer i;
	
	initial begin
		// Initialize Inputs
		address = 0;
		readEn = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10  //wait
		for (i = 0; i < 128; i = i +1 )begin
		#5  //wait
		readEn = 1;
		address = i;
		#5 //wait
		readEn = 0;
		end
		
		#5 //wait
		readEn = 1;
		address = 24'b1111111; // test for last address
		#5 //wait
		readEn = 0;
		#5 //wait
		readEn = 1;
		address = 24'b0;
		#5 // wait
		readEn = 0;
		
	end
	
	initial begin
		$monitor ("address = %b, data = %b, readE = %b,\naddress = %d, data = %d, readE = %d\n", 
									address, data, readEn, address, data, readEn);
	end
      
endmodule

