`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    20:36:17 12/30/2013
// Design Name:
// Module Name:    Mux2ToGeneric
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
module Mux2To1Generic(
    input in0, // input 0
    input in1, //input 1
    input sel, //select
    output out //output
    );

    assign out = ((sel == 0) ? in0 : in1);

endmodule
