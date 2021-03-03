
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
---  Module Name:  Function Testbench
---  Description: Lab 05 Part 4 
-----------------------------------------------------------*/
`timescale 1 ns/1 ns
module tb_function4x1;

reg [3:0] abcd;
reg en;
wire f;

	function4x1 test_function4x1 (.abcd(abcd), .en(en), .f(f));


	initial 
		begin
		en <= 1'b1;
		abcd <= 4'b0000;
		# 10 ;
		abcd <= 4'b0001;
		# 10 ;
		abcd <= 4'b0010;
		# 10 ;
		abcd <= 4'b0011;
		# 10 ;
		abcd <= 4'b0100;
		# 10 ;
		abcd <= 4'b0101;
		# 10 ;
		abcd <= 4'b0110;
		# 10 ;
		abcd <= 4'b0111;
		# 10 ;	
		abcd <= 4'b1000;
		# 10;
		abcd <= 4'b1001;
		# 10 ;
		abcd <= 4'b1010;
		# 10 ;
		abcd <= 4'b1011;
		# 10 ;
		abcd <= 4'b1100;
		# 10 ;
		abcd <= 4'b1101;
		# 10 ;
		abcd <= 4'b1111;
		# 10 ; $finish;		
	end

endmodule
