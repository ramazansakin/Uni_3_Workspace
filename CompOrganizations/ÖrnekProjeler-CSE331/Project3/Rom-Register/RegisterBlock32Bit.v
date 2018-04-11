`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:		Mehmet Akif TASOVA
// 
// Create Date:    15:04:21 12/06/2013 
// Design Name: 
// Module Name:    RegisterBlock32Bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module RegisterBlock32Bit(
	input CLK, //clock
	input reset, //reset signal
	input [4:0]readReg1,
	input [4:0]readReg2,
	input [4:0]writeReg,
	input writeEn, //write enable
	input [31:0]writeData,
	output [31:0]outReg1,
	output [31:0]outReg2
	);
	
	reg [31:0]registers[31:0];	
	
	assign outReg1 = registers[readReg1]; //out reg1
	assign outReg2 = registers[readReg2]; //out reg2
	
	integer i;
	
	always @(CLK) begin
		if (reset)begin //if reset
			for(i=0; i<32; i=i+1) begin
				registers[i] <= 0;
			end
		end else begin //if not reset
			if (writeEn) begin
				registers[writeReg] <= writeData;
			end
		end //end if not reset
	end
	
	// //get reg1 to out
	// Mux32to1 read1(registers[0], registers[1], registers[2], registers[3], registers[4], registers[5],
	// 					registers[6], registers[7], registers[8], registers[9], registers[10], registers[11],
	// 					registers[12], registers[13], registers[14], registers[15], registers[16], registers[17],
	// 					registers[18], registers[19], registers[20], registers[21], registers[22], registers[23],
	// 					registers[24], registers[25], registers[26], registers[27], registers[28], registers[29],
	// 					registers[30], registers[31], readReg1, outReg1);
	// //get reg2 to out					
	// Mux32to1 read2(registers[0], registers[1], registers[2], registers[3], registers[4], registers[5],
	// 					registers[6], registers[7], registers[8], registers[9], registers[10], registers[11],
	// 					registers[12], registers[13], registers[14], registers[15], registers[16], registers[17],
	// 					registers[18], registers[19], registers[20], registers[21], registers[22], registers[23],
	// 					registers[24], registers[25], registers[26], registers[27], registers[28], registers[29],
	// 					registers[30], registers[31], readReg2, outReg2);
						
	//assign registers[writeReg] = ((writeEn) ? writeData : registers[writeReg]);


endmodule
