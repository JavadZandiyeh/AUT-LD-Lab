`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:21:56 12/30/2020
// Design Name:   system
// Module Name:   C:/Users/Javad/Desktop/FILES/Logic Circuit/LAB/Project_10_2/tb_system.v
// Project Name:  Project_10_2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: system
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_system;

	// Inputs
	reg rst;
	reg clk;
	reg confirm;
	reg [3:0] pass_data;

	// Outputs
	wire [3:0] dout_left;
	wire [3:0] dout_right;
	wire [2:0] state;

	// Instantiate the Unit Under Test (UUT)
	system uut_system_1 (
		.rst(rst), 
		.clk(clk), 
		.confirm(confirm), 
		.pass_data(pass_data), 
		.dout_left(dout_left), 
		.dout_right(dout_right), 
		.state(state)
	);
	
	always
		#5 clk = ~clk;

	initial begin
		confirm = 1'b0;
		pass_data = 4'b1010;
		clk = 1'b0;
		
		rst = 1'b0;
		#1
		rst = 1'b1;
		#5
		rst = 1'b0;
		#20
		
		confirm = 1'b1;
		#40
		
		pass_data = 4'b0100;
		#50
		$finish;
	end
      
endmodule

