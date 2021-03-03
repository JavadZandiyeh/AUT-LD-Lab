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
---  Module Name: Light Dance
---  Description: Module5
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module LightDance (
	input        arst  , // async  reset
	input        clk   , // clock  posedge
	input        din   , // input  data
	input        load  , // load   enable 
	input  [7:0] pdata , // load   data
	output [7:0] qdata   // output data
);
	
	wire q7next;
	wire q6next;
	wire q5next;
	wire q4next;
	wire q3next;
	wire q2next;
	wire q1next;
	wire q0next;
	assign q7next = (din ^ qdata[0]);
	assign q6next = qdata[7];
	assign q5next = (qdata[6] ^ qdata[0]);
	assign q4next = (qdata[5] ^ qdata[0]);
	assign q3next = qdata[4];
	assign q2next = qdata[3];
	assign q1next = (qdata[2] ^ qdata[0]);
	assign q0next = (qdata[1] ^ qdata[0]);
	
	DFlop gate7(arst, clk, (~load) & q7next, load & pdata[7], qdata[7]);
	DFlop gate6(arst, clk, (~load) & q6next, load & pdata[6], qdata[6]);
	DFlop gate5(arst, clk, (~load) & q5next, load & pdata[5], qdata[5]);
	DFlop gate4(arst, clk, (~load) & q4next, load & pdata[4], qdata[4]);
	DFlop gate3(arst, clk, (~load) & q3next, load & pdata[3], qdata[3]);
	DFlop gate2(arst, clk, (~load) & q2next, load & pdata[2], qdata[2]);
	DFlop gate1(arst, clk, (~load) & q1next, load & pdata[1], qdata[1]);
	DFlop gate0(arst, clk, (~load) & q0next, load & pdata[0], qdata[0]);
	
endmodule
