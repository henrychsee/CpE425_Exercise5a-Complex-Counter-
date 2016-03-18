/*
	Name: Matidios, Henry
	Date: 12/9/2015
	Description: test bench Comparator
*/

`timescale 1ns/1ps

module tb_comparator;
	reg [3:0]a;
	reg [3:0]b;
	wire [3:0]r;
	
	
	comparator UUT1(r,a,b);
	
	initial
	begin
	$dumpfile("comparator.vpd");
	$dumpvars;
	
	a=4'b0001;
	b=4'b0010;
	#10
	
	
	a=4'b0010;
	b=4'b0001;
	#10

	
	a=4'b0011;
	b=4'b0011;
	#10
	
	
	a=4'b1111;
	b=4'b1001;
	#10
	
	
	a=4'b1010;
	b=4'b0101;
	#10
	
	
	a=4'b0110;
	b=4'b0001;
	#10
	
	a=4'b0001;
	b=4'b0010;
	#10
	
	
	a=4'b0010;
	b=4'b0010;
	#10

	
	a=4'b1101;
	b=4'b1110;
	#10

	
	a=4'b1110;
	b=4'b0111;
	#10

	
	
	$finish;
	end
	
	
endmodule