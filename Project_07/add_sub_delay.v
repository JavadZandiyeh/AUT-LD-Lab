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
---  Module Name: Single Bit Adder/Subtractor with delay
---  Description: Lab 07 Part 1
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module add_sub_delay (
	input a ,
	input b ,
	input cin ,
	input sel ,
	output sum ,
	output cout
);
	
	wire xor_out_1;
	xor #10 xor_1(xor_out_1, b, sel);
	full_adder_delay FAD(a, xor_out_1, cin, sum, cout); 

endmodule
