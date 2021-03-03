`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:21:24 02/07/2021
// Design Name:   LightingSystem
// Module Name:   C:/Users/Javad/Downloads/FinalProject/tb_m4.v
// Project Name:  FinalProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LightingSystem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_m4;

	// Inputs
	reg [3:0] tcode;
	reg [3:0] ulight;
	reg [3:0] lenght;

	// Outputs
	wire [3:0] wshade;
	wire [3:0] lightnum;
	wire [15:0] lightstate;

	// Instantiate the Unit Under Test (UUT)
	LightingSystem uut (
		.tcode(tcode), 
		.ulight(ulight), 
		.lenght(lenght), 
		.wshade(wshade), 
		.lightnum(lightnum), 
		.lightstate(lightstate)
	);

	initial begin
		tcode = 4'b0001;
		ulight = 4'b1101;
		lenght = 4'b1001;
		#50;
		tcode = 4'b0010;
		#50;
		tcode = 4'b0100;
		#50;
		tcode = 4'b1000;
		#50
		ulight = 4'b1001;
		#50;
		tcode = 4'b0000;
		// Wait 100 ns for global reset to finish
		#50;
		$finish;
	end
      
endmodule

