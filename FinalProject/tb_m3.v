`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:20:09 02/07/2021
// Design Name:   CoolHeatSystem
// Module Name:   C:/Users/Javad/Downloads/FinalProject/tb_m3.v
// Project Name:  FinalProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CoolHeatSystem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_m3;

	// Inputs
	reg arst;
	reg clk;
	reg [7:0] speed;
	reg [7:0] chs_conf;

	// Outputs
	wire [3:0] chs_power;
	wire chs_mode;
	wire pwm_data;

	// Instantiate the Unit Under Test (UUT)
	CoolHeatSystem uut (
		.arst(arst), 
		.clk(clk), 
		.speed(speed), 
		.chs_conf(chs_conf), 
		.chs_power(chs_power), 
		.chs_mode(chs_mode), 
		.pwm_data(pwm_data)
	);

	initial begin 
		clk = 1'b0;
		#2100;
		$finish;
	end
	
	always 
		#1 clk = ~clk;

	initial begin
		speed = 8'b10110011;
		chs_conf = 7'b0101110;
		arst = 1'b0;
		#1;
		arst = 1'b1;
		#1;
		arst = 1'b0;
		
		#400
		chs_conf = 7'b0001110;
	end
      
endmodule

