`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:53:48 05/26/2017 
// Design Name: 
// Module Name:    simple_verilog 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module simple_verilog(
    input A,
    input B,
    input C,
    output F_structural,
    output F_functional,
    output reg F_behavioral
    );
	// Structural implementation
	wire B_n;
	wire A_and_B_n;
	wire B_and_C;
	
	not (B_n, B);
	and (A_and_B_n, A, B_n);
	and (B_and_C, B, C);
	or (F_structural, A_and_B_n, B_and_C);
	
	// Functional implementation
	assign F_functional = (A & (~B)) | (B & C);
	
	// Behavioral implementation
	always@(*)
		F_behavioral = (A & (~B)) | (B & C);

endmodule
