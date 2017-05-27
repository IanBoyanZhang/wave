`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:21:57 05/26/2017
// Design Name:   simple_verilog
// Module Name:   C:/Users/Ian/Desktop/FPGA2/draft/test_bench.v
// Project Name:  draft
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: simple_verilog
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_bench;

	// Inputs
	reg A;
	reg B;
	reg C;

	// Outputs
	wire F_structural;
	wire F_functional;
	wire F_behavioral;

	// Instantiate the Unit Under Test (UUT)
	simple_verilog uut (
		.A(A), 
		.B(B), 
		.C(C), 
		.F_structural(F_structural), 
		.F_functional(F_functional), 
		.F_behavioral(F_behavioral)
	);

	initial begin
		$display("The simple_verilog module simulation is starting ...");
		// Initialize Inputs
		A = 0;
		B = 0;
		C = 0;

		// Wait 100 ns for global reset to finish
		#100;
      $display("ABC = %b%b%b, F_structural = %b, F_functional = %b, F_behavioral = %b", A, B, C, F_structural, F_functional, F_behavioral);
s		  
		// Add stimulus here
		A = 0; B = 0; C = 1; // 001
		#50;
      $display("ABC = %b%b%b, F_structural = %b, F_functional = %b, F_behavioral = %b", A, B, C, F_structural, F_functional, F_behavioral);
		
		A = 0; B = 1; C = 0; // 010
		#50;
      $display("ABC = %b%b%b, F_structural = %b, F_functional = %b, F_behavioral = %b", A, B, C, F_structural, F_functional, F_behavioral);
		
		A = 0; B = 1; C = 1; // 011
		#50;
      $display("ABC = %b%b%b, F_structural = %b, F_functional = %b, F_behavioral = %b", A, B, C, F_structural, F_functional, F_behavioral);
		
		A = 1; B = 0; C = 0; // 100
		#50;
      $display("ABC = %b%b%b, F_structural = %b, F_functional = %b, F_behavioral = %b", A, B, C, F_structural, F_functional, F_behavioral);
		
		A = 1; B = 0; C = 1; // 101
		#50;
      $display("ABC = %b%b%b, F_structural = %b, F_functional = %b, F_behavioral = %b", A, B, C, F_structural, F_functional, F_behavioral);
		
		A = 1; B = 1; C = 0; // 110
		#50;
      $display("ABC = %b%b%b, F_structural = %b, F_functional = %b, F_behavioral = %b", A, B, C, F_structural, F_functional, F_behavioral);
		
		A = 1; B = 1; C = 1; // 111
		#50;
      $display("ABC = %b%b%b, F_structural = %b, F_functional = %b, F_behavioral = %b", A, B, C, F_structural, F_functional, F_behavioral);
		
		$display("The simple_verilog module simulation has ended ...");
	end
      
endmodule

