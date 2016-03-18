//Name:Matidios,Henry
//Description:Fulladder
//Date:11/18/2015

`timescale 1ns/1ps

module fulladder(Cout,S,A,B,Cin);
	input A;
	input B;
	input Cin;
	output S;
	output Cout;
	wire w1;
	wire w2;
	wire w3;

	xor gate1 (S,A,B,Cin);
	or gate2 (w1,A,B);
	and gate3 (w2,A,B);
	and gate4 (w3,Cin,w1);
	or gate5 (Cout,w2,w3);
	
endmodule