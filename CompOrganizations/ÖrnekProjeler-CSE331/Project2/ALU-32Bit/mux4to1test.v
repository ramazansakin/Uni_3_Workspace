`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:04:22 11/18/2013
// Design Name:   Mux4to1
// Module Name:   C:/Users/makiftasova/Xilinx-Projects/ALU-32Bit/mux4to1test.v
// Project Name:  ALU-32Bit
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

module mux4to1test;

	// Inputs
	reg [3:0] in;
	reg [1:0] sel;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	Mux4to1 uut (
		.in(in), 
		.sel(sel), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		sel = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		in[0] = 0;
		in[1] = 1;
		in[2] = 0;
		in[3] = 0;

	end
	
	initial begin
		$monitor("$time=",$time,,"in1=%b, in2=%b, in3=%b, in4=%b, sel=%b, out=%b", in[0], in[1], in[2], in[3], sel, out);
   end 
      
endmodule

