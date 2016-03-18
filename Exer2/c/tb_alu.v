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
	reg [2:0]m;
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
	m=3'd0;
	#10
	
	a=4'd5;
	b=4'd2;
	m=3'd0;
	#10

	a=4'd10;
	b=4'd2;
	m=3'd0;
	#10
	
	
	
	a=4'd2;
	b=4'd1;
	m=3'd1;
	#10

	a=4'd5;
	b=4'd2;
	m=3'd1;
	#10

	a=4'd14;
	b=4'd2;
	m=3'd1;
	#10

	
	a=4'd2;
	b=4'd1;
	m=3'd2;
	#10

	a=4'd5;
	b=4'd5;
	m=3'd2;
	#10

	a=4'd1;
	b=4'd3;
	m=3'd2;
	#10

	
	a=4'd2;
	b=4'd1;
	m=3'd3;
	#10

	a=4'd5;
	b=4'd2;
	m=3'd3;
	#10

	a=4'd14;
	b=4'd2;
	m=3'd3;
	#10

	
	a=4'd2;
	b=4'd1;
	m=3'd4;
	#10

	a=4'd5;
	b=4'd2;
	m=3'd4;
	#10

	a=4'd14;
	b=4'd2;
	m=3'd4;
	#10

	
	a=4'd2;
	b=4'd1;
	m=3'd5;
	#10

	a=4'd5;
	b=4'd2;
	m=3'd5;
	#10

	a=4'd14;
	b=4'd2;
	m=3'd5;
	#10

	
	a=4'd2;
	b=4'd1;
	m=3'd6;
	#10

	a=4'd5;
	b=4'd2;
	m=3'd6;
	#10

	a=4'd14;
	b=4'd2;
	m=3'd6;
	#10

	
	a=4'd2;
	b=4'd1;
	m=3'd7;
	#10

	a=4'd5;
	b=4'd2;
	m=3'd7;
	#10

	a=4'd14;
	b=4'd2;
	m=3'd7;
	#10
	

	$finish;
	end
endmodule