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
---  Module Name: Sequential Circuit
---  Description: Lab 09 Part 2
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module seq_circuit (
	input rst ,
	input clk ,
	input a ,
	input b ,
	output y ,
	output z
);
	
	wire S;
   wire R;
	wire D_1;
	wire D_2;
	wire Qbar_1;
	wire Qbar_2;
	wire Q_2;
	
	assign #10 S = b & Qbar_2;
	assign #10 R = b & Qbar_2;
	assign #10 z = Qbar_1 | R;	
	assign #10 D_1 = a | S;
	assign #10 D_2 = ~(D_1 | Qbar_1);
	dflop_negedge dff_1(rst, clk, D_1, y, Qbar_1);
	dflop_negedge dff_2(rst, clk, D_2, Q_2, Qbar_2);

endmodule 
