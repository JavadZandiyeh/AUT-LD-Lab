`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:44:05 12/30/2020
// Design Name:   register
// Module Name:   C:/Users/Javad/Desktop/FILES/Logic Circuit/LAB/Project_10_2/tb_register.v
// Project Name:  Project_10_2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: register
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_register;

	// Inputs
	reg rst;
	reg clk;
	reg en;
	reg [3:0] din;

	// Outputs
	wire [3:0] qout;

	// Instantiate the Unit Under Test (UUT)
	register uut (
		.rst(rst), 
		.clk(clk), 
		.en(en), 
		.din(din), 
		.qout(qout)
	);

	
	initial begin
		// Initialize Inputs
		din = 4'b0111;

		rst = 1'b0;
		#1
		rst = 1'b1;
		#1
		rst = 1'b0;
		
		
		
		clk = 1'b0;
		en = 1'b0;
		#10
		clk = 1'b1;
		#10
		clk = 1'b0;
		
		
		
		#10
		en = 1'b1;
		clk = 1'b1;
		#10
		clk = 1'b0;
		
		#10;
		rst = 1'b1;
		#1
		rst = 1'b0;
		#10
		$finish;
	end
      
endmodule

