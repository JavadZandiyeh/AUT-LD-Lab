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
---  Module Name: Active Lights
---  Description: Module4: 
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module ActiveLamps (
	input  [3:0] tcode  , // time code    [table2 time code   ]
	input  [3:0] ulight , // user light   [light degree mode  ]
    input  [3:0] lenght     , // room length  [square room lenght ]
	output [3:0] active_lights  // number of active light
);

	reg [3:0] actives;
	reg [3:0] nothing;
	always @(tcode or ulight or lenght) begin
		actives = 4'b0000;
		if(tcode == 4'b0100) begin
			actives = {2'b00, lenght[3:2]}; //2 bits right shift for finding |_length/4_| means mode of it 
		end
		else if(tcode == 4'b1000) begin
			actives = ulight;
		end
	end
	
	assign active_lights = actives;

endmodule
