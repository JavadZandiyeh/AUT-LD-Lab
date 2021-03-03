`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:24:06 02/07/2021
// Design Name:   MemoryUnit
// Module Name:   C:/Users/Javad/Downloads/FinalProject/tb_m6.v
// Project Name:  FinalProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MemoryUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_m6;

	// Inputs
	reg arst;
	reg clk;
	reg wren;
	reg [34:0] din;

	// Outputs
	wire [34:0] dout;

	// Instantiate the Unit Under Test (UUT)
	MemoryUnit uut (
		.arst(arst), 
		.clk(clk), 
		.wren(wren), 
		.din(din), 
		.dout(dout)
	);

	initial begin
		clk = 1'b1;
		#100;
		$finish;
	end
	always 
		#10 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		wren = 1'b0;
		din = 35'b00000011100010000000100000000000001;
		arst = 1'b0;
		#1
		arst = 1'b1;
		#1
		arst = 1'b0;
		#5
		#30;
		wren = 1'b1;
	end
      
endmodule

