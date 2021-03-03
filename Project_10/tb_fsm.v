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
---  Module Name: System Testbench
---  Description: Lab 10 Part 4
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module tb_fsm ();

reg        rst ;
reg        clk ;
reg 		  confirm;
reg  [3:0] pass_data ;
wire en_left;
wire en_right;
wire [3:0] dout;
wire [2:0] state;

	fsm unit_under_test_1(
		.rst(rst),
		.clk(clk),
		.confirm(confirm),
		.pass_data(pass_data),
		.en_left(en_left),
		.en_right(en_right),
		.dout(dout),
		.state(state)
	);
	
	
	initial begin
		confirm = 1'b0;
		pass_data = 4'b1010;
		clk = 1'b0;
		
		rst = 1'b0;
		#1
		rst = 1'b1;
		#5
		rst = 1'b0;
		#10
		
		clk = 1'b0;
		repeat(2)
		#10 clk = ~clk;
		confirm = 1'b1;
		
		repeat(2)
		#10 clk = ~clk;
		
		repeat(2)
		#10 clk = ~clk;
		
		repeat(2)
		#10 clk = ~clk;
		
		repeat(2)
		#10 clk = ~clk;
		#50
		
		pass_data = 4'b0100;
		#10
		repeat(2)
		#10 clk = ~clk;
		#30
		$finish;
	end
endmodule

