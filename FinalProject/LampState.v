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

module LampState (
	input  [ 3:0] active_lights , // number of active light
	output [15:0] lights_state    // state of lights is on
);
	//behavioral model
	//integer count;
	//integer active_lights_int;
	//reg [15:0] states;
	//always @ (active_lights) begin
	//	active_lights_int = (active_lights[0]) + (2 * active_lights[1]) + (2 * 2 * active_lights[2]) + (2 * 2 * 2 * active_lights[3]);
	//	states = 16'b0000000000000000;
	//	for(count = 0; count < active_lights_int; count = count + 1) begin
	//		if(count < 16)
	//			states[count] = 1'b1;
	//	end
	//end
	//assign lights_state = states;
	
	
	//gate level model
	reg [15:0] lights_state_int;
	always @ (active_lights) begin
		lights_state_int[0] = active_lights[3] | active_lights[2] | active_lights[1] | active_lights[0];
		lights_state_int[1] = active_lights[3] | active_lights[2] | active_lights[1];
		lights_state_int[2] = active_lights[3] | active_lights[2] | (active_lights[1] & active_lights[0]);
		lights_state_int[3] = active_lights[3] | active_lights[2];
		lights_state_int[4] = active_lights[3] | (active_lights[2] & active_lights[1]) | (active_lights[2] & active_lights[0]);
		lights_state_int[5] = active_lights[3] | (active_lights[2] & active_lights[1]);
		lights_state_int[6] = active_lights[3] | (active_lights[2] & active_lights[1] & active_lights[0]);
		lights_state_int[7] = active_lights[3];
		lights_state_int[8] = active_lights[3] & (active_lights[2] | active_lights[1] | active_lights[0]);
		lights_state_int[9] = active_lights[3] & (active_lights[2] | active_lights[1]);
		lights_state_int[10] = active_lights[3] & (active_lights[2] | (active_lights[1] & active_lights[0]));
		lights_state_int[11] = active_lights[3] & active_lights[2];
		lights_state_int[12] = (active_lights[3] & active_lights[2]) & (active_lights[1] | active_lights[0]);
		lights_state_int[13] = active_lights[3] & active_lights[2] & active_lights[1];
		lights_state_int[14] = active_lights[3] & active_lights[2] & active_lights[1] & active_lights[0];
		lights_state_int[15] = 1'b0; 
	end
	
	assign lights_state = lights_state_int;
	
endmodule
