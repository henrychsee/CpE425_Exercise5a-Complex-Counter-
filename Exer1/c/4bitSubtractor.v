//Name:Matidios,Henry
//Description:4-bit Subtractor
//Date:12/2/2015

`timescale 1ns/1ps

module fourbitSubtractor(D,Bout,A,B,Cin);

	input [3:0]A;
	input [3:0]B;
	input Cin;

	output [3:0]D;
	output Bout;

	wire w1;
	wire w2;
	wire w3;
	wire nw0;
	wire nw1;
	wire nw2;
	wire nw3;

	not n1(nw0,B[0]);
	fulladder UNIT1 (w1,D[0],A[0],nw0,Cin);
	not n2(nw1,B[1]);
	fulladder UNIT2 (w2,D[1],A[1],nw1,w1);
	not n3(nw2,B[2]);
	fulladder UNIT3 (w3,D[2],A[2],nw2,w2);
	not n4(nw3,B[3]);
	fulladder UNIT4 (Bout,D[3],A[3],nw3,w3);


endmodule