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
---  Module Name: Power Mode (Conting Ones)
---  Description: Module3: 
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module ModePower (
	input  [7:0] chs_conf  , // degree [temprature] 
	output [3:0] chs_power , // power  [cooler/heater] 
	output       chs_mode    // model  [heat=1/cool=0]
);
	reg [3:0] num_ones;	
	integer counter;
	
	always @(chs_conf) begin
	num_ones = 4'b0000;
		for(counter = 0; counter < 8; counter = counter + 1)
			num_ones = num_ones + chs_conf[counter];
	end
	
	assign chs_power = num_ones;
	assign chs_mode = num_ones[0];
	
endmodule
