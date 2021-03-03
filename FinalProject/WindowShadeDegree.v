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
---  Module Name: Window Shade Degree
---  Description: Module4: 
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module WindowShadeDegree (
	input  [3:0] tcode  , // time code    [table2 time code   ]
	input  [3:0] ulight , // user light   [light degree mode  ]
	output [3:0] wshade   // shade level  [window shade level ]
);
	
	reg [3:0] wshade_reg;
	always @ (tcode or ulight) begin
		wshade_reg = 4'b0000;
		if(tcode == 4'b0001)	wshade_reg = 4'b1111;
		else if(tcode == 4'b0010) wshade_reg = 4'b1100;
		else if(tcode == 4'b0100) wshade_reg = ulight;
	end
	
	assign wshade = wshade_reg;

endmodule
