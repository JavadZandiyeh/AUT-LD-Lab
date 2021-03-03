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
---  Module Name: D Flip Flop
---  Description: Lab 09 Part 1
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module dflop_negedge (
	input rst ,
	input clk ,
	input din ,
	//instead of initialing f.ex q_out and the assigning qout to q_out
	// we can defind qout like below
	output reg qout ,
	output reg qbout
);
	
//	reg pout = 1'b0;
//	always @(pout, clk, rst, din) begin
//		if(rst == 1'b1) begin
//			qout = 1'b0;
//			qbout = 1'b1;
//			pout = 1'b0;
//		end
//		else begin
//			if(clk == 1'b0)
//				#5
//				pout = din;
//			else begin
//				#5
//				qout = pout;
//				qbout = ~ pout;
//			end
//		end
//	end

	always @ (negedge clk or posedge rst) begin
		if(rst == 1'b1) begin
			qout <= 1'b0;
			qbout <= 1'b1;
		end
		else begin
			#5
			qout <= din;
			qbout <= ~din;
		end
	end

endmodule 
