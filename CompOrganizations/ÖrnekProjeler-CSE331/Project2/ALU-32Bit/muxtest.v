`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:35:55 11/18/2013
// Design Name:   Mux2to1
// Module Name:   C:/Users/makiftasova/Xilinx-Projects/ALU-32Bit/muxtest.v
// Project Name:  ALU-32Bit
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

module muxtest;

	// Inputs
	reg in1;
	reg in2;
	reg sel;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	Mux2to1 uut (
		.in1(in1), 
		.in2(in2), 
		.sel(sel), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in1 = 0;
		in2 = 0;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		in1 = 1;
		in2 = 0;
		
		#10
		sel=1;

	end
	
	initial begin
		$monitor("$time=",$time,,"in1=%b, in2=%b, sel=%b, out=%b", in1, in2, sel, out);
   end 
      
endmodule

