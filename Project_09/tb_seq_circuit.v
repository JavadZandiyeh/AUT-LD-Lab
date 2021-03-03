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
---  Module Name: Sequential Circuit Testbench
---  Description: Lab 09 Part 1 Testbench
-----------------------------------------------------------*/
`timescale 1 ns/1 ns


module tb_seq_circuit ();

reg clk;
reg rst;
reg a;
reg b;

wire y;
wire z;

	seq_circuit test_seq_cicuit(.clk(clk), .rst(rst), .a(a), .b(b), .y(y), .z(z));

	initial begin
		rst = 1'b1;
		clk = 1'b0;
		repeat(18)
		begin
			#40
			clk = ~clk;
		end
	end
	
	initial begin	
		rst = 1'b0;
		a = 1'b0;
		b = 1'b0;
		#80;
		b = 1'b1;
		#40;
		a = 1'b1;
		#80;
		a = 1'b0;
		#80;
		b = 1'b0;
		#40;
		a = 1'b1;
		#120;
		b = 1'b1;
		#40;
		a = 1'b0;
		b = 1'b0;
		#120;
		b = 1'b1;
		#40;
		a = 1'b1;
		#80;
		$finish;
		
	end
endmodule

