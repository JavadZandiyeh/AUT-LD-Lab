/*--  *******************************************************
--  Computer Architecture Course, Laboratory Sources 
--  Amirkabir University of Technology (Tehran Polytechnic)
--  Department of Computer Engineering (CE-AUT)
--  https://ce[dot]aut[dot]ac[dot]ir
--  *******************************************************
--  All Rights reserved (C) 2019-2020
--  *******************************************************
--  Student ID  : 
--  Student Name: 
--  Student Mail: 
--  *******************************************************
--  Additional Comments:
--
--*/

/*-----------------------------------------------------------
---  Module Name: 8 Bits Comparator
---  Description: Lab 06 Part 3
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module comparator8 (
	input [7:0] A ,
	input [7:0] B ,
	input 		l ,
	input 		e ,
	input 		g ,
	output 		lt ,
	output 		et ,
	output 		gt
);

	//comparator of A[1:0] and B[1:0]
	wire [2:0] in_01;
	wire [2:0] in_02;
	assign in_01 = {A[1], A[1], A[0]};
	assign in_02 = {B[1], B[1], B[0]};	
	
	wire out_lt_0, out_et_0, out_gt_0;
	comparator3 comp_0(in_01, in_02, l, e, g, out_lt_0, out_et_0, out_gt_0);
	
	//comparator of A[3:2] and B[3:2]
	wire [2:0] in_11;
	wire [2:0] in_12;
	assign in_11 = {A[3], A[3], A[2]};
	assign in_12 = {B[3], B[3], B[2]};
	
	wire out_lt_1, out_et_1, out_gt_1;
	comparator3 comp_1(in_11, in_12, out_lt_0, out_et_0, out_gt_0, out_lt_1, out_et_1, out_gt_1);
	
	//comparator of A[5:4] and B[5:4]
	wire [2:0] in_21;
	wire [2:0] in_22;
	assign in_21 = {A[5], A[5], A[4]};
	assign in_22 = {B[5], B[5], B[4]};
	
	wire out_lt_2, out_et_2, out_gt_2;
	comparator3 comp_2(in_21, in_22, out_lt_1, out_et_1, out_gt_1, out_lt_2, out_et_2, out_gt_2);
	
	//comparator of A[5:4] and B[5:4]
	wire [2:0] in_31;
	wire [2:0] in_32;
	assign in_31 = {A[7], A[7], A[6]};
	assign in_32 = {B[7], B[7], B[6]};
	
	comparator3 comp_3(in_31, in_32, out_lt_2, out_et_2, out_gt_2, lt, et, gt);
	
endmodule
