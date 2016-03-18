`timescale 1ns/1ps

module f_accumulator(Y,carryb,Clk,nReset,a,b,mode,cin);
	input Clk,nReset;
	output carryb;
	output [3:0]Y;
	input [3:0]a;
	input [3:0]b;
	input [3:0]mode;
	input cin;
	wire [3:0]r;
	wire overflow;
	
	alushifter UUT1(r,overflow,a,b,cin,mode);
	accumulator UUT2(Y,carryb,{overflow,r},Clk,nReset);
	
endmodule