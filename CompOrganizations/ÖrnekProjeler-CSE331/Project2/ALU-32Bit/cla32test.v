`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:06:17 11/18/2013
// Design Name:   CarryLookAheadAdder32
// Module Name:   C:/Users/makiftasova/Xilinx-Projects/ALU-32Bit/cla32test.v
// Project Name:  ALU-32Bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CarryLookAheadAdder32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cla32test;

	// Inputs
	reg [31:0] in1;
	reg [31:0] in2;
	reg cIn;

	// Outputs
	wire cOut;
	wire GG;
	wire PG;
	wire [31:0] sum;

	// Instantiate the Unit Under Test (UUT)
	CarryLookAheadAdder32 uut (
		.in1(in1), 
		.in2(in2), 
		.cIn(cIn), 
		.cOut(cOut), 
		.GG(GG), 
		.PG(PG), 
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
		    in1=10; in2=8; cIn=1'b0;
		#10 in1=23; in2=5; cIn=1'b0;
		#10 in1=123; in2=70; cIn=1'b1;
		#10 in1=11; in2=22; cIn=1'b0;
		#10 in1=8; in2=1; cIn=1'b0;	

	end
   
	initial begin
		$monitor("time=",$time,, "in1:=%d in2:=%d Cin:=%d : Sum:=%d Cout:=%b PG:=%b GG:=%b\n",in1,in2,cIn,sum,cOut,PG,GG);
	end
      
endmodule

