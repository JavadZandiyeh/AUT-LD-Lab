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
---  Module Name: Fan Speed (PWM)
---  Description: Module3: 
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module FanSpeed (
	input        arst     , // reset posedge[asynch]  
	input        clk      , // clock [posedge] 
	input  [7:0] speed    , // speed [duty-cycle]  
	output       pwm_data   // data  [output]
);
	reg [8:0] count = 9'b000000000;
	reg out;
	always @ (posedge arst or posedge clk) begin
		if(arst) count = 9'b000000000;
		else begin
			out = (count <= {1'b0, speed});
			count = count + 9'b000000001;
			count = (count == 9'b100000001) ? 9'b000000000 : count;
		end
	end
	assign pwm_data = out;
	
endmodule
