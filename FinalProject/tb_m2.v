`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:17:31 02/07/2021
// Design Name:   GasDetectorSensor
// Module Name:   C:/Users/Javad/Downloads/FinalProject/tb_m2.v
// Project Name:  FinalProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: GasDetectorSensor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_m2;

	// Inputs
	reg arst;
	reg clk;
	reg din;

	// Outputs
	wire [2:0] dout;

	// Instantiate the Unit Under Test (UUT)
	GasDetectorSensor uut (
		.arst(arst), 
		.clk(clk), 
		.din(din), 
		.dout(dout)
	);

	initial begin 
		clk = 1'b0;
		#1000
		$finish;
	end

	always
		#10 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		din = 1'b0;
		arst = 1'b0;
		#5
		arst = 1'b1;
		#5
		arst = 1'b0;
		
		
		#20
		din = 1'b1;
		#20
		din = 1'b0;
		#20
		din = 1'b1;
		#20
		din = 1'b1;
		#20
		din = 1'b1;
		#20
		din = 1'b0;
		#20
		din = 1'b1;
		#20
		din = 1'b0;
		#20
		din = 1'b1;
		#20
		din = 1'b0;
		#20;
		din = 1'b0;
		#20;
		din = 1'b1;
		#20;
		din = 1'b0;
		#20;
		din = 1'b0;
		#20;
		din = 1'b1;
		#20;
		din = 1'b1;
		#20;
		
		$finish;
	end
      
endmodule

