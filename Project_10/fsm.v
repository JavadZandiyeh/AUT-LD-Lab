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
---  Module Name: FSM
---  Description: Lab 10 Part 2
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

//implementing moore machine
module fsm (
	input        rst ,
	input        clk ,
	input        confirm ,
	input  [3:0] pass_data ,
	output reg en_left,
	output reg en_right,
	output reg [3:0] dout,
	output reg [2:0] state
);

	parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b111, s3 = 3'b101, s4 = 3'b110;	
	parameter t0 = 3'b010, t1 = 3'b011 , t2 = 3'b100;
	
	always @ (posedge clk or posedge rst)
		if(rst) begin
			state = s0;
			en_left = 1'b0;
			en_right = 1'b0;
			dout = 4'b0000;
		end
		else if(~rst) begin
			case (state)
				//state 0
				s0: state = s1;
				
				//state 1
				s1: begin
					if(confirm) begin
						if(~pass_data[0])
							state = t0;
						else
							state = s2;
					end
				end
				
				//state t0
				t0: begin
					if(confirm) begin
						if(pass_data[1])
							state = t1;
						else
							state = s2;
					end
				end
				
				//state t1
				t1: begin
					if(confirm) begin
						if(~pass_data[2])
							state = t2;
						else
							state = s2;
					end
				end
			
				//state t2
				t2: begin
					if(confirm) begin
						if(pass_data[3])
							state = s3;
						else
							state = s2;
					end
				end
				
				//state 2
				s2: state = s2;
				
				//state 3
				s3: begin
					if(confirm) begin
						if(~pass_data[0]) begin
							//registering the even digits into the right register and vice versa
							en_right = 1'b1;
							en_left = 1'b0;
						end
						else begin
							en_right = 1'b0;
							en_left = 1'b1;
						end
						dout = pass_data;
						state = s4;
					end
				end
				
				//state 4
				s4: state = s1; 
			endcase
		end
endmodule 
