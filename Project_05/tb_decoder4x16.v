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
---  Module Name: Decoder Testbench
---  Description: Lab 05 Part 1 Testbench
-----------------------------------------------------------*/
`timescale 1 ns/1 ns


module tb_decoder4x16;

wire [15:0] dout;
reg [3:0] in;
reg en;


	decoder4x16 test_decoder4x16 (.dout(dout), .in(in), .en(en));


	initial 
		begin
		en <= 1'b0;
		
		in <= 4'b0000;
		# 10 ;
		in <= 4'b0001;
		# 10 ;
		in <= 4'b0010;
		# 10 ;
		in <= 4'b0011;
		# 20 ;

		en <= 1'b1;
		
		in <= 4'b0000;
		# 10 ;
		in <= 4'b0001;
		# 10 ;
		in <= 4'b0010;
		# 10 ;
		in <= 4'b0011;
		# 20 ;	$finish;		
	end

endmodule


