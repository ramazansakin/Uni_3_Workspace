`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 		 Mehmet Akif TASOVA
// 
// Create Date:    14:52:42 11/18/2013 
// Design Name: 
// Module Name:    Shifter32 
// Project Name: 	 32 Bit ALU
// Target Devices: 
// Tool versions: 
// Description: 
//			32 Bit Shifter
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Shifter32(
	input [31:0]in,
	input [4:0]shAmt,
	input shBit,
	output [31:0]out);
	
	// internal wires
	wire [31:0] s1, s2, s3, s4;
	
	// mux stage 1
	Mux2to1 m100(in[0], shBit, shAmt[0], s1[0]);
	Mux2to1 m101(in[1], in[0], shAmt[0], s1[1]);
	Mux2to1 m102(in[2], in[1], shAmt[0], s1[2]);
	Mux2to1 m103(in[3], in[2], shAmt[0], s1[3]);
	Mux2to1 m104(in[4], in[3], shAmt[0], s1[4]);
	Mux2to1 m105(in[5], in[4], shAmt[0], s1[5]);
	Mux2to1 m106(in[6], in[5], shAmt[0], s1[6]);
	Mux2to1 m107(in[7], in[6], shAmt[0], s1[7]);
	Mux2to1 m108(in[8], in[7], shAmt[0], s1[8]);
	Mux2to1 m109(in[9], in[8], shAmt[0], s1[9]);
	Mux2to1 m110(in[10], in[9], shAmt[0], s1[10]);
	Mux2to1 m111(in[11], in[10], shAmt[0], s1[11]);
	Mux2to1 m112(in[12], in[11], shAmt[0], s1[12]);
	Mux2to1 m113(in[13], in[12], shAmt[0], s1[13]);
	Mux2to1 m114(in[14], in[13], shAmt[0], s1[14]);
	Mux2to1 m115(in[15], in[14], shAmt[0], s1[15]);
	Mux2to1 m116(in[16], in[15], shAmt[0], s1[16]);
	Mux2to1 m117(in[17], in[16], shAmt[0], s1[17]);
	Mux2to1 m118(in[18], in[17], shAmt[0], s1[18]);
	Mux2to1 m119(in[19], in[18], shAmt[0], s1[19]);
	Mux2to1 m120(in[20], in[19], shAmt[0], s1[20]);
	Mux2to1 m121(in[21], in[20], shAmt[0], s1[21]);
	Mux2to1 m122(in[22], in[21], shAmt[0], s1[22]);
	Mux2to1 m123(in[23], in[22], shAmt[0], s1[23]);
	Mux2to1 m124(in[24], in[23], shAmt[0], s1[24]);
	Mux2to1 m125(in[25], in[24], shAmt[0], s1[25]);
	Mux2to1 m126(in[26], in[25], shAmt[0], s1[26]);
	Mux2to1 m127(in[27], in[26], shAmt[0], s1[27]);
	Mux2to1 m128(in[28], in[27], shAmt[0], s1[28]);
	Mux2to1 m129(in[29], in[28], shAmt[0], s1[29]);
	Mux2to1 m130(in[30], in[29], shAmt[0], s1[30]);
	Mux2to1 m131(in[31], in[30], shAmt[0], s1[31]);
	
	// mux stage 2
	Mux2to1 m200(s1[0], shBit, shAmt[1], s2[0]);
	Mux2to1 m201(s1[1], shBit, shAmt[1], s2[1]);
	Mux2to1 m202(s1[2], s1[0], shAmt[1], s2[2]);
	Mux2to1 m203(s1[3], s1[1], shAmt[1], s2[3]);
	Mux2to1 m204(s1[4], s1[2], shAmt[1], s2[4]);
	Mux2to1 m205(s1[5], s1[3], shAmt[1], s2[5]);
	Mux2to1 m206(s1[6], s1[4], shAmt[1], s2[6]);
	Mux2to1 m207(s1[7], s1[5], shAmt[1], s2[7]);
	Mux2to1 m208(s1[8], s1[6], shAmt[1], s2[8]);
	Mux2to1 m209(s1[9], s1[7], shAmt[1], s2[9]);
	Mux2to1 m210(s1[10], s1[8], shAmt[1], s2[10]);
	Mux2to1 m211(s1[11], s1[9], shAmt[1], s2[11]);
	Mux2to1 m212(s1[12], s1[10], shAmt[1], s2[12]);
	Mux2to1 m213(s1[13], s1[11], shAmt[1], s2[13]);
	Mux2to1 m214(s1[14], s1[12], shAmt[1], s2[14]);
	Mux2to1 m215(s1[15], s1[13], shAmt[1], s2[15]);
	Mux2to1 m216(s1[16], s1[14], shAmt[1], s2[16]);
	Mux2to1 m217(s1[17], s1[15], shAmt[1], s2[17]);
	Mux2to1 m218(s1[18], s1[16], shAmt[1], s2[18]);
	Mux2to1 m219(s1[19], s1[17], shAmt[1], s2[19]);
	Mux2to1 m220(s1[20], s1[18], shAmt[1], s2[20]);
	Mux2to1 m221(s1[21], s1[19], shAmt[1], s2[21]);
	Mux2to1 m222(s1[22], s1[20], shAmt[1], s2[22]);
	Mux2to1 m223(s1[23], s1[21], shAmt[1], s2[23]);
	Mux2to1 m224(s1[24], s1[22], shAmt[1], s2[24]);
	Mux2to1 m225(s1[25], s1[23], shAmt[1], s2[25]);
	Mux2to1 m226(s1[26], s1[24], shAmt[1], s2[26]);
	Mux2to1 m227(s1[27], s1[25], shAmt[1], s2[27]);
	Mux2to1 m228(s1[28], s1[26], shAmt[1], s2[28]);
	Mux2to1 m229(s1[29], s1[27], shAmt[1], s2[29]);
	Mux2to1 m230(s1[30], s1[28], shAmt[1], s2[30]);
	Mux2to1 m231(s1[31], s1[29], shAmt[1], s2[31]);
	
	// mux stage 3
	Mux2to1 m300(s2[0], shBit, shAmt[2], s3[0]);
	Mux2to1 m301(s2[1], shBit, shAmt[2], s3[1]);
	Mux2to1 m302(s2[2], shBit, shAmt[2], s3[2]);
	Mux2to1 m303(s2[3], shBit, shAmt[2], s3[3]);
	Mux2to1 m304(s2[4], s2[0], shAmt[2], s3[4]);
	Mux2to1 m305(s2[5], s2[1], shAmt[2], s3[5]);
	Mux2to1 m306(s2[6], s2[2], shAmt[2], s3[6]);
	Mux2to1 m307(s2[7], s2[3], shAmt[2], s3[7]);
	Mux2to1 m308(s2[8], s2[4], shAmt[2], s3[8]);
	Mux2to1 m309(s2[9], s2[5], shAmt[2], s3[9]);
	Mux2to1 m310(s2[10], s2[6], shAmt[2], s3[10]);
	Mux2to1 m311(s2[11], s2[7], shAmt[2], s3[11]);
	Mux2to1 m312(s2[12], s2[8], shAmt[2], s3[12]);
	Mux2to1 m313(s2[13], s2[9], shAmt[2], s3[13]);
	Mux2to1 m314(s2[14], s2[10], shAmt[2], s3[14]);
	Mux2to1 m315(s2[15], s2[11], shAmt[2], s3[15]);
	Mux2to1 m316(s2[16], s2[12], shAmt[2], s3[16]);
	Mux2to1 m317(s2[17], s2[13], shAmt[2], s3[17]);
	Mux2to1 m318(s2[18], s2[14], shAmt[2], s3[18]);
	Mux2to1 m319(s2[19], s2[15], shAmt[2], s3[19]);
	Mux2to1 m320(s2[20], s2[16], shAmt[2], s3[20]);
	Mux2to1 m321(s2[21], s2[17], shAmt[2], s3[21]);
	Mux2to1 m322(s2[22], s2[18], shAmt[2], s3[22]);
	Mux2to1 m323(s2[23], s2[19], shAmt[2], s3[23]);
	Mux2to1 m324(s2[24], s2[20], shAmt[2], s3[24]);
	Mux2to1 m325(s2[25], s2[21], shAmt[2], s3[25]);
	Mux2to1 m326(s2[26], s2[22], shAmt[2], s3[26]);
	Mux2to1 m327(s2[27], s2[23], shAmt[2], s3[27]);
	Mux2to1 m328(s2[28], s2[24], shAmt[2], s3[28]);
	Mux2to1 m329(s2[29], s2[25], shAmt[2], s3[29]);
	Mux2to1 m330(s2[30], s2[26], shAmt[2], s3[30]);
	Mux2to1 m331(s2[31], s2[27], shAmt[2], s3[31]);
	
	// mux stage 4
	Mux2to1 m400(s3[0], shBit, shAmt[3], s4[0]);
	Mux2to1 m401(s3[1], shBit, shAmt[3], s4[1]);
	Mux2to1 m402(s3[2], shBit, shAmt[3], s4[2]);
	Mux2to1 m403(s3[3], shBit, shAmt[3], s4[3]);
	Mux2to1 m404(s3[4], shBit, shAmt[3], s4[4]);
	Mux2to1 m405(s3[5], shBit, shAmt[3], s4[5]);
	Mux2to1 m406(s3[6], shBit, shAmt[3], s4[6]);
	Mux2to1 m407(s3[7], shBit, shAmt[3], s4[7]);
	Mux2to1 m408(s3[8], s3[0], shAmt[3], s4[8]);
	Mux2to1 m409(s3[9], s3[1], shAmt[3], s4[9]);
	Mux2to1 m410(s3[10], s3[2], shAmt[3], s4[10]);
	Mux2to1 m411(s3[11], s3[3], shAmt[3], s4[11]);
	Mux2to1 m412(s3[12], s3[4], shAmt[3], s4[12]);
	Mux2to1 m413(s3[13], s3[5], shAmt[3], s4[13]);
	Mux2to1 m414(s3[14], s3[6], shAmt[3], s4[14]);
	Mux2to1 m415(s3[15], s3[7], shAmt[3], s4[15]);
	Mux2to1 m416(s3[16], s3[8], shAmt[3], s4[16]);
	Mux2to1 m417(s3[17], s3[9], shAmt[3], s4[17]);
	Mux2to1 m418(s3[18], s3[10], shAmt[3], s4[18]);
	Mux2to1 m419(s3[19], s3[11], shAmt[3], s4[19]);
	Mux2to1 m420(s3[20], s3[12], shAmt[3], s4[20]);
	Mux2to1 m421(s3[21], s3[13], shAmt[3], s4[21]);
	Mux2to1 m422(s3[22], s3[14], shAmt[3], s4[22]);
	Mux2to1 m423(s3[23], s3[15], shAmt[3], s4[23]);
	Mux2to1 m424(s3[24], s3[16], shAmt[3], s4[24]);
	Mux2to1 m425(s3[25], s3[17], shAmt[3], s4[25]);
	Mux2to1 m426(s3[26], s3[18], shAmt[3], s4[26]);
	Mux2to1 m427(s3[27], s3[19], shAmt[3], s4[27]);
	Mux2to1 m428(s3[28], s3[20], shAmt[3], s4[28]);
	Mux2to1 m429(s3[29], s3[21], shAmt[3], s4[29]);
	Mux2to1 m430(s3[30], s3[22], shAmt[3], s4[30]);
	Mux2to1 m431(s3[31], s3[23], shAmt[3], s4[31]);
	
	// mux stage 5 at last :)
	Mux2to1 m500(s4[0], shBit, shAmt[4], out[0]);
	Mux2to1 m501(s4[1], shBit, shAmt[4], out[1]);
	Mux2to1 m502(s4[2], shBit, shAmt[4], out[2]);
	Mux2to1 m503(s4[3], shBit, shAmt[4], out[3]);
	Mux2to1 m504(s4[4], shBit, shAmt[4], out[4]);
	Mux2to1 m505(s4[5], shBit, shAmt[4], out[5]);
	Mux2to1 m506(s4[6], shBit, shAmt[4], out[6]);
	Mux2to1 m507(s4[7], shBit, shAmt[4], out[7]);
	Mux2to1 m508(s4[8], shBit, shAmt[4], out[8]);
	Mux2to1 m509(s4[9], shBit, shAmt[4], out[9]);
	Mux2to1 m510(s4[10], shBit, shAmt[4], out[10]);
	Mux2to1 m511(s4[11], shBit, shAmt[4], out[11]);
	Mux2to1 m512(s4[12], shBit, shAmt[4], out[12]);
	Mux2to1 m513(s4[13], shBit, shAmt[4], out[13]);
	Mux2to1 m514(s4[14], shBit, shAmt[4], out[14]);
	Mux2to1 m515(s4[15], shBit, shAmt[4], out[15]);
	Mux2to1 m516(s4[16], s4[0], shAmt[4], out[16]);
	Mux2to1 m517(s4[17], s4[1], shAmt[4], out[17]);
	Mux2to1 m518(s4[18], s4[2], shAmt[4], out[18]);
	Mux2to1 m519(s4[19], s4[3], shAmt[4], out[19]);
	Mux2to1 m520(s4[20], s4[4], shAmt[4], out[20]);
	Mux2to1 m521(s4[21], s4[5], shAmt[4], out[21]);
	Mux2to1 m522(s4[22], s4[6], shAmt[4], out[22]);
	Mux2to1 m523(s4[23], s4[7], shAmt[4], out[23]);
	Mux2to1 m524(s4[24], s4[8], shAmt[4], out[24]);
	Mux2to1 m525(s4[25], s4[9], shAmt[4], out[25]);
	Mux2to1 m526(s4[26], s4[10], shAmt[4], out[26]);
	Mux2to1 m527(s4[27], s4[11], shAmt[4], out[27]);
	Mux2to1 m528(s4[28], s4[12], shAmt[4], out[28]);
	Mux2to1 m529(s4[29], s4[13], shAmt[4], out[29]);
	Mux2to1 m530(s4[30], s4[14], shAmt[4], out[30]);
	Mux2to1 m531(s4[31], s4[15], shAmt[4], out[31]);
	
endmodule
