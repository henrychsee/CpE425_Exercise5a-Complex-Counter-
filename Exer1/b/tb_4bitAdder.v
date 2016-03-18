//Name:Matidios,Henry
//Description:4-bit Adder
//Date:11/18/2015
`timescale 1ns/1ps

module tb_4bitAdder;

	reg [3:0]A;
	reg [3:0]B;
	reg Cin;

	wire [3:0]S;
	wire Cout;

	fourbitAdder UUT(S,Cout,A,B,Cin);

	initial
		begin
			$dumpfile("4bitAdder.vpd");
			$dumpvars;

			A=4'b0001;	//1
			B=4'b0101;	//5
			Cin=0;
			#10

			A=4'b0110;	//6
			B=4'b1001;	//9
			Cin=0;
			#10

			A=4'b0011;	//3
			B=4'b0010;	//2
			Cin=0;
			#10

			A=4'b0001;	//1
			B=4'b0001;	//1
			Cin=0;
			#10

			A=4'b0010;	//2
			B=4'b1000;	//8
			Cin=0;

			A=4'b0101;	//5
			B=4'b0101;	//5
			Cin=0;
			#10

			A=4'b0100;	//4
			B=4'b0101;	//5
			Cin=1;
			#10

			A=4'b0011;	//3
			B=4'b0011;	//3
			Cin=1;
			#10

			A=4'b0010;	//2
			B=4'b0010;	//2
			Cin=1;
			#10

			A=4'b1011;	//11
			B=4'b0010;	//3
			Cin=1;
			#10

		$finish;
	end
endmodule