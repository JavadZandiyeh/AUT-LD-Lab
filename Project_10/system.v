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
---  Module Name: Sequential System
---  Description: Lab 10 Part 3
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module system (
	input        rst ,
	input        clk ,
	input        confirm,
	input  [3:0] pass_data ,
	output [3:0] dout_left ,
	output [3:0] dout_right,
	output [2:0] state
);

	wire en_left;
	wire en_right;
	wire [3:0] dout;
	fsm my_fsm(rst, clk, confirm, pass_data, en_left, en_right, dout, state);
	
	register left_reg(rst, clk, en_left, dout, dout_left);
	register right_reg(rst, clk, en_right, dout, dout_right);	
endmodule

