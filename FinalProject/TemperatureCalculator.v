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
---  Module Name: Temperature Calculator
---  Description: Module1: 
-----------------------------------------------------------*/
`timescale 1 ns/1 ns 

module TemperatureCalculator (
	input  [31:0] tc_base  , // base [environment degree ]
	input  [ 7:0] tc_ref   , // ref  [system work voltage]
	input  [15:0] adc_data , // adc  [sensor digital data]
	output [31:0] tempc      // temp [temperature celsius]
);
	
	wire [7:0] tc_ref_unsigned;
	assign tc_ref_unsigned = tc_ref[7] ? {tc_ref[7], ((~tc_ref[6:0]) + 7'b0000001)} : tc_ref;
	
	wire [15:0] p2ref;
	Multiplier8x8 gate_1({1'b0, tc_ref_unsigned[6:0]}, {1'b0, tc_ref_unsigned[6:0]}, p2ref);
	
	wire [15:0] p_adc_data;
	assign p_adc_data = {1'b0, adc_data[14:0]};
	wire mode = adc_data[15];

	wire [31:0] sorat;
	Multiplier16x16 gate_2(p2ref, p_adc_data, sorat);
	
	wire [31:0] rast;
	assign rast = {6'b000000, sorat[31:6]};
	
	AdderSubtractor32x32 gate_3(tc_base, rast, mode, tempc);
	
endmodule
