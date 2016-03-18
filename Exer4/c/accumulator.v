/*
	Name: Matidios, Henry
	Date: 1/20/2016
	Description: Accumulator
*/
`timescale 1ns/1ps

module accumulator(Y,carryb,A,clk,nReset);
	input clk,nReset;
	input [4:0]A;
	output reg carryb;
	output reg [3:0]Y;
	
	always @(negedge clk or negedge nReset)
	if(nReset==0)
		begin
			Y <= 3'd0;
			carryb <= 1'd0;
		end
	else
		begin
			Y <= A[3:0];
			carryb <= A[4];
		end
endmodule