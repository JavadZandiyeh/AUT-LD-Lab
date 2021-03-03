`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:25:22 02/07/2021
// Design Name:   ControlUnit
// Module Name:   C:/Users/Javad/Downloads/FinalProject/tb_m7.v
// Project Name:  FinalProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ControlUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_m7;

	// Inputs
	reg arst;
	reg clk;
	reg request;
	reg confirm;
	reg [1:0] password;
	reg [1:0] syskey;
	reg [34:0] configin;

	// Outputs
	wire [34:0] configout;
	wire write_en;
	wire [2:0] dbg_state;

	// Instantiate the Unit Under Test (UUT)
	ControlUnit uut (
		.arst(arst), 
		.clk(clk), 
		.request(request), 
		.confirm(confirm), 
		.password(password), 
		.syskey(syskey), 
		.configin(configin), 
		.configout(configout), 
		.write_en(write_en), 
		.dbg_state(dbg_state)
	);

	initial begin
		clk = 1'b1;
		#300;
		$finish;
	end

	always 
		#10 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		password = 2'b00;
		syskey = 2'b10;
		request = 1'b1;
		confirm = 1'b0;
		configin = 35'b00000000000000000000000000000000011;
		
		arst = 1'b0;
		#1
		arst = 1'b1;
		#1
		arst = 1'b0;		
		
		#50
		confirm = 1'b1;
		
		#100
		
		request = 1'b0;
		#1
		request = 1'b1;
		#5
		
		password = 2'b10;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

