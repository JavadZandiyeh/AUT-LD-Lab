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
---  Module Name: Gas Detector Sensor
---  Description: Module2:
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module GasDetectorSensor (
	input        arst     , // async reset posedge
	input        clk      , // clock posedge
	input        din      , // input data 
	output [2:0] dout       // output data
);
	//output as register
	reg [2:0] out;
	
	//start point for all diagrams
	parameter start = 4'b0000;
	
	//gas present states
	reg [3:0] metan;
	reg [3:0] c_mono;
	reg [3:0] c_dio;

	//state name of diagrams
	//metan states
	parameter m0 = 4'b0001, m1 = 4'b0010, m2 = 4'b0011, m3 = 4'b0100, m4 = 4'b0101; 
	parameter m5 = 4'b0110, m6 = 4'b0111, m7 = 4'b1000, m8 = 4'b1001, m9 = 4'b1010;
	//c_mono states
	parameter cm0 = 4'b0001, cm1 = 4'b0010, cm2 = 4'b0011, cm3 = 4'b0100, cm4 = 4'b0101, cm5 = 4'b0110; 
	parameter cm6 = 4'b0111, cm7 = 4'b1000, cm8 = 4'b1001, cm9 = 4'b1010, cm10 = 4'b1011, cm11 = 4'b1100;
	//c_dio states
	parameter cd0 = 4'b0001, cd1 = 4'b0010, cd2 = 4'b0011, cd3 = 4'b0100, cd4 = 4'b0101; 
	parameter cd5 = 4'b0110, cd6 = 4'b0111, cd7 = 4'b1000, cd8 = 4'b1001;
	
	
	//three moore machine in a block of always
	always @(posedge arst or posedge clk) begin
		if(arst == 1'b1) begin
			metan = start;
			c_mono = start;
			c_dio = start;
			out = 3'b000;
		end
		else begin
			//setting present state of metan gas
			case(metan)
				start: metan = din ? m0 : start;
				m0: metan = din ? m0 : m1;
				m1: metan = din ? m2 : start;
				m2: metan = din ? m3 : m1;
				m3: metan = din ? m4 : m1;
				m4: metan = din ? m0 : m5;
				m5: metan = din ? m6 : start;
				m6: metan = din ? m3 : m7;
				m7: metan = din ? m8 : start;
				m8: metan = din ? m3 : m9;
				m9: metan = din ? m2 : start;
			endcase
			
			if(metan == m9) out[0] = 1'b1;
			else out[0] = 1'b0;
		
			//setting present state of carbon monoxide gas
			case(c_mono)
				start: c_mono = din ? cm0 : start;
				cm0: c_mono = din ? cm0 : cm1;
				cm1: c_mono = din ? cm2 : start;
				cm2: c_mono = din ? cm0 : cm3;
				cm3: c_mono = din ? cm4 : start;
				cm4: c_mono = din ? cm0 : cm5;
				cm5: c_mono = din ? cm4 : cm6;
				cm6: c_mono = din ? cm7 : start;
				cm7: c_mono = din ? cm0 : cm8;
				cm8: c_mono = din ? cm2 : cm9;
				cm9: c_mono = din ? cm10 : start;
				cm10: c_mono = din ? cm11 : cm1;
				cm11: c_mono = din ? cm0 : cm1;
			endcase
			
			if(c_mono == cm11) out[1] = 1'b1;
			else out[1] = 1'b0;
			
			//setting present state of carbon dioxide gas
			case(c_dio)
				start: c_dio = din ? cd0 : start;
				cd0: c_dio = din ? cd0 : cd1;
				cd1: c_dio = din ? cd0 : cd2;
				cd2: c_dio = din ? cd3 : start;
				cd3: c_dio = din ? cd0 : cd4;
				cd4: c_dio = din ? cd0 : cd5;
				cd5: c_dio = din ? cd6 : start;
				cd6: c_dio = din ? cd0 : cd7;
				cd7: c_dio = din ? cd0 : cd8;
				cd8: c_dio = din ? cd6 : start;
			endcase
		
			if(c_dio == cd8) out[2] = 1'b1;
			else out[2] = 1'b0;
			
		end
	end
	
	assign dout = out;
	
endmodule
