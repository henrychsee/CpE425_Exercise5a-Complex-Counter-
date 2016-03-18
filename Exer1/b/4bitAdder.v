//Name:Matidios,Henry
//Description:4-bit Adder
//Date:11/18/2015

`timescale 1ns/1ps

module fourbitAdder(S,Cout,A,B,Cin);

	input [3:0]A;
	input [3:0]B;
	input Cin;

	output [3:0]S;
	output Cout;

	wire w1;
	wire w2;
	wire w3;

	fulladder FA1 (w1,S[0],A[0],B[0],Cin);
	fulladder FA2 (w2,S[1],A[1],B[1],w1);
	fulladder FA3 (w3,S[2],A[2],B[2],w2);
	fulladder FA4 (Cout,S[3],A[3],B[3],w3);

endmodule