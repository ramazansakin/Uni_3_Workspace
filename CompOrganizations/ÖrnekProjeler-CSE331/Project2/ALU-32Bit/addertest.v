`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:55:48 11/18/2013
// Design Name:   FullAdder
// Module Name:   C:/Users/makiftasova/Xilinx-Projects/ALU-32Bit/addertest.v
// Project Name:  ALU-32Bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FullAdder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module addertest;

	// Inputs
	reg in1;
	reg in2;
	reg cIn;

	// Outputs
	wire cOut;
	wire sum;

	// Instantiate the Unit Under Test (UUT)
	FullAdder uut (
		.in1(in1), 
		.in2(in2), 
		.cIn(cIn), 
		.cOut(cOut), 
		.sum(sum)
	);

	initial begin
		// Initialize Inputs
		in1 = 0;
		in2 = 0;
		cIn = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		in1 = 1;
		in2 = 0;
		
		#100;
		
		in1 = 0;
		in2 = 1;
		
		#100;
		
		in1 = 1;
		in2 = 1;
		
		#100;
		
		cIn = 1;
		in1 = 0;
		in2 = 0;
		#100
		
		in1 = 1;
		in2 = 0;
		
		#100;
		
		in1 = 0;
		in2 = 1;
		
		#100;
		
		in1 = 1;
		in2 = 1;
		

	end
	
	initial begin
		$monitor("time=",$time,, "in1:=%b in2:=%b Cin:=%b : Sum:=%b Cout:=%b ",in1,in2,cIn,sum,cOut);
	end

      
endmodule

