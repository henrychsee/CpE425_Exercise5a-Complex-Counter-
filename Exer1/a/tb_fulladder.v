//Name:Matidios,Henry
//Description:Fulladder testbench
//Date:11/18/2015

`timescale 1ns/1ps

module tb_fulladder;

	reg A;
	reg B;
	reg Cin;
	wire S;
	wire Cout;

	fulladder UUT(Cout,S,A,B,Cin);

	initial
	begin

		$dumpfile("fulladder.vpd");
		$dumpvars;

		//0
		A=0;
		B=0;
		Cin=0;
		#10

		//1
		A=0;
		B=0;
		Cin=1;
		#10

		//2
		A=0;
		B=1;
		Cin=0;
		#10

		//3
		A=0;
		B=1;
		Cin=1;
		#10

		//4
		A=1;
		B=0;
		Cin=0;
		#10

		//5
		A=1;
		B=0;
		Cin=1;
		#10

		//6
		A=1;
		B=1;
		Cin=0;
		#10

		//7
		A=1;
		B=1;
		Cin=1;
		#10

	$finish;
	end
endmodule