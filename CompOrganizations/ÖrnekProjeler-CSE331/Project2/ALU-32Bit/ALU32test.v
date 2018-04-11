`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:59:55 11/22/2013
// Design Name:   ALU32
// Module Name:   C:/Users/makiftasova/Xilinx-Projects/ALU-32Bit/ALU32test.v
// Project Name:  ALU-32Bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU32test;

	// Inputs
	reg [3:0] opCode;
	reg [31:0] in1;
	reg [31:0] in2;
	reg [4:0] shAmt;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	ALU32 uut (
		.opCode(opCode), 
		.in1(in1), 
		.in2(in2), 
		.shAmt(shAmt), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		opCode = 0;
		in1 = 0;
		in2 = 0;
		shAmt = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		//add
		opCode = 4'b1100;
		in1 = 110;
		in2 = 10;
		shAmt = 0;
		#100;
		
		//substranct
		opCode = 4'b1110;
		in1 = 110;
		in2 = 10;
		shAmt = 0;
		#100;
		
		//and
		opCode = 4'b0100;
		in1 = 110;
		in2 = 10;
		shAmt = 0;
		#100;
		
		//or
		opCode = 4'b0110;
		in1 = 110;
		in2 = 10;
		shAmt = 0;
		#100;				
		
		//nor
		opCode = 4'b1000;
		in1 = 110;
		in2 = 10;
		shAmt = 0;
		#100;				
		
		//xor
		opCode = 4'b1010;
		in1 = 110;
		in2 = 10;
		shAmt = 0;
		#100;
		
		//sll
		opCode = 4'b0010;
		in1 = 32'b001110;
		in2 = 10;
		shAmt = 2;
		#100;
		
		//srl
		opCode = 4'b0000;
		in1 = 32'b0011000;
		in2 = 10;
		shAmt = 2;
		#100;
		
		//sra
		opCode = 4'b0001;
		in1 = 32'b1111000;
		in2 = 10;
		shAmt = 2;
		#100;
		
		//sra
		opCode = 4'b0001;
		in1 = 32'b10000000000000000000000000001100;
		in2 = 10;
		shAmt = 2;
		#100;

	end
	
	initial begin
		$monitor("in1=%b, in2=%b, out=%b, shAmt=%b, opcode=%b\nin1=%d, in2=%d, out=%d, shAmt=%d, opcode=%d\n", in1, in2, out, shAmt, opCode, in1, in2, out, shAmt, opCode);
	end
      
endmodule

