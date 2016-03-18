/*
	Name: Matidios, Henry
	Date: 12/9/2015
	Description: Test Bench ALU
*/
`timescale 1ns/1ps

module tb_alu;
	reg [3:0]a;
	reg [3:0]b;
	reg cin;
	reg [3:0]m;
	wire [3:0]r;
	wire overflow;
	
	
//  adder4bit UUT1(r,overflow,cin,a,b);
	alu UUT1(r,overflow,a,b,cin,m);
// subtract4bit UUT1(r,overflow,cin,a,b);
	
	initial
		begin
			$dumpfile("alu.vpd");
			$dumpvars;
			
			a=4'd2;
			b=4'd1;
			cin = 1'b0;
			m=4'd0;
			#10
			
			a=4'd5;
			b=4'd2;
			m=4'd0;
			#10

			a=4'd10;
			b=4'd2;
			m=4'd0;
			#10
			
			
			
			a=4'd2;
			b=4'd1;
			m=4'd1;
			#10

			a=4'd5;
			b=4'd2;
			m=4'd1;
			#10

			a=4'd14;
			b=4'd2;
			m=4'd1;
			#10

			
			a=4'd2;
			b=4'd1;
			m=4'd2;
			#10

			a=4'd5;
			b=4'd5;
			m=4'd2;
			#10

			a=4'd1;
			b=4'd3;
			m=4'd2;
			#10

			
			a=4'd2;
			b=4'd1;
			m=4'd3;
			#10

			a=4'd5;
			b=4'd2;
			m=4'd3;
			#10

			a=4'd14;
			b=4'd2;
			m=4'd3;
			#10

			
			a=4'd2;
			b=4'd1;
			m=4'd4;
			#10

			a=4'd5;
			b=4'd2;
			m=4'd4;
			#10

			a=4'd14;
			b=4'd2;
			m=4'd4;
			#10

			
			a=4'd2;
			b=4'd1;
			m=4'd5;
			#10

			a=4'd5;
			b=4'd2;
			m=4'd5;
			#10

			a=4'd14;
			b=4'd2;
			m=4'd5;
			#10

			
			a=4'd2;
			b=4'd1;
			m=4'd6;
			#10

			a=4'd5;
			b=4'd2;
			m=4'd6;
			#10

			a=4'd14;
			b=4'd2;
			m=4'd6;
			#10

			
			a=4'd2;
			b=4'd1;
			m=4'd7;
			#10

			a=4'd5;
			b=4'd2;
			m=4'd7;
			#10

			a=4'd14;
			b=4'd2;
			m=4'd7;
			#10

			//shifter
			//shift left input = 0

			a=4'b0001;
			m=4'b1000;
			#10;

			a=4'b1001;
			m=4'b1000;
			#10;

			a=4'b1110;
			m=4'b1000;
			#10;
			
			//shift left input = 1
			a=4'b0000;
			m=4'b1001;
			#10;

			a=4'b1001;
			m=4'b1001;
			#10;

			a=4'b1110;
			m=4'b1001;
			#10;

			//shift right input = 0
			a=4'b0001;
			m=4'b1010;
			#10;

			a=4'b1001;
			m=4'b1010;
			#10;

			a=4'b1110;
			m=4'b1010;
			#10;

			//shift right input=1
			a=4'b0010;
			m=4'b1011;
			#10;

			a=4'b0111;
			m=4'b1011;
			#10;

			//shift left arithmetic
			a=4'b0011;
			m=4'b1100;
			#10;

			a=4'b1001;
			m=4'b1100;
			#10;

			a=4'b1110;
			m=4'b1100;
			#10;

			//shift right arithmetic
			a=4'b0100;
			m=4'b1101;
			#10;

			a=4'b1001;
			m=4'b1101;
			#10;

			a=4'b1110;
			m=4'b1101;
			#10;

			//rotate left
			a=4'b0101;
			m=4'b1110;
			#10;

			a=4'b1001;
			m=4'b1110;
			#10;

			a=4'b1110;
			m=4'b1110;
			#10;

			//rotate right
			a=4'b0110;
			m=4'b1111;
			#10;

			a=4'b1000;
			m=4'b1111;
			#10;

			a=4'b1110;
			m=4'b1111;
			#10;

		$finish;
	end
endmodule