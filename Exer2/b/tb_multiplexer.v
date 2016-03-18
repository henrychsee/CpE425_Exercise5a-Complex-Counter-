/*
	Name: Matidios, Henry
	Date: 12/9/2015
	Description: Test Bench Multiplexer
*/
`timescale 1ns/1ps

module tb_multiplexer;
	reg [3:0]a;
	reg [3:0]b;
	reg [3:0]c;
	reg [3:0]d;
	reg [1:0]s;
	wire [3:0]y;
	
	
	multiplexer UUT1(y,a,b,c,d,s);
	
	initial
	begin
	$dumpfile("multiplexer.vpd");
	$dumpvars;

	a=4'd1;
	b=4'd2;
	c=4'd3;
	d=4'd4;
	s=2'd0;
	#10
	
	
	a=4'd1;
	b=4'd2;
	c=4'd3;
	d=4'd4;
	s=2'd1;
	#10

	
	a=4'd1;
	b=4'd2;
	c=4'd3;
	d=4'd4;
	s=2'd2;
	#10

	
	a=4'd1;
	b=4'd2;
	c=4'd3;
	d=4'd4;
	s=2'd3;
	#10

	
	a=4'd5;
	b=4'd6;
	c=4'd7;
	d=4'd8;
	s=2'd3;
	#10

	
	a=4'd5;
	b=4'd6;
	c=4'd7;
	d=4'd8;
	s=2'd2;
	#10

	
	a=4'd5;
	b=4'd6;
	c=4'd7;
	d=4'd8;
	s=2'd1;
	#10

	
	a=4'd5;
	b=4'd6;
	c=4'd7;
	d=4'd8;
	s=2'd0;
	#10

	
	a=4'd9;
	b=4'd12;
	c=4'd13;
	d=4'd14;
	s=2'd0;
	#10

	
	a=4'd9;
	b=4'd12;
	c=4'd13;
	d=4'd14;
	s=2'd2;
	#10

	
	
	$finish;
	end
endmodule