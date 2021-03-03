`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:22:49 02/07/2021
// Design Name:   LightDance
// Module Name:   C:/Users/Javad/Downloads/FinalProject/tb_m5.v
// Project Name:  FinalProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LightDance
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_m5;

	// Inputs
	reg arst;
	reg clk;
	reg din;
	reg load;
	reg [7:0] pdata;

	// Outputs
	wire [7:0] qdata;

	// Instantiate the Unit Under Test (UUT)
	LightDance uut (
		.arst(arst), 
		.clk(clk), 
		.din(din), 
		.load(load), 
		.pdata(pdata), 
		.qdata(qdata)
	);

	initial begin
		clk = 1'b1;
		#100;
		$finish;
	end
	always
		#5 clk = ~clk;
	
	
	initial begin
		// Initialize Inputs
		din = 1'b1;
		pdata = 8'b10001101;
		load = 1'b1;

		arst = 1'b0;
		#5;
		arst = 1'b1;
		#5;
		arst = 1'b0;
		
		#20;
		load = 1'b0;
		// Wait 100 ns for global reset to finish
		#100;
       $finish;
		// Add stimulus here

	end
      
endmodule

