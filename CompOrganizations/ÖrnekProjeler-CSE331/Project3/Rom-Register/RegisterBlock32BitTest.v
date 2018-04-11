`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:		Mehmet Akif TASOVA
//
// Create Date:   15:44:13 12/06/2013
// Design Name:   RegisterBlock32Bit
// Module Name:   C:/cygwin/home/makiftasova/cse331 - computer organisation/Project3/Rom-Register/RegisterBlock32BitTest.v
// Project Name:  Rom-Register
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RegisterBlock32Bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RegisterBlock32BitTest;

	// Inputs
	reg CLK;
	reg reset;
	reg [4:0] readReg1;
	reg [4:0] readReg2;
	reg [4:0] writeReg;
	reg writeEn;
	reg [31:0] writeData;

	// Outputs
	wire [31:0] outReg1;
	wire [31:0] outReg2;

	// Instantiate the Unit Under Test (UUT)
	RegisterBlock32Bit uut (
		.CLK(CLK), 
		.reset(reset), 
		.readReg1(readReg1), 
		.readReg2(readReg2), 
		.writeReg(writeReg), 
		.writeEn(writeEn), 
		.writeData(writeData), 
		.outReg1(outReg1), 
		.outReg2(outReg2)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		reset = 0;
		readReg1 = 0;
		readReg2 = 0;
		writeReg = 0;
		writeEn = 0;
		writeData = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		// reset all register to zero
		#50;
		CLK = 1;
		reset = 1;
		
		#50;
		CLK = 0;
		writeEn = 0;
		reset = 0;
		
		#50;
		CLK = 1;
		writeEn = 1;
		writeReg = 1;
		writeData = 15;
		
		#50;
		CLK = 0;
		writeEn = 0;
		
		#50;
		CLK = 1;
		writeEn = 1;
		writeReg = 2;
		writeData = 30;
		
		#50;
		CLK = 0;
		writeEn = 0;
		
		#50;
		CLK = 1;
		writeEn = 1;
		writeReg = 31;
		writeData = 32'b10010101101;
		
		#50;
		CLK = 0;
		writeEn = 0;
		
		#50;
		CLK = 1;
		readReg1 = 1;
		readReg2 = 2;		
		
		#50;
		CLK = 0;
		writeEn = 0;
		
		#50;
		CLK = 1;
		readReg1 = 31;
		
		#50;
		CLK = 0;
		writeEn = 0;
		
		#50;
		CLK = 1;
		reset = 1;

	end
	
	initial begin
		$monitor("wd:%d, read1:%d, read2:%d, reg1:%d, reg2:%d", writeData, outReg1, outReg2, readReg1, readReg2);
	end
      
endmodule

