/*
	Name: Matidios, Henry
	Date: 12/9/2015
	Description: Comparator
*/

`timescale 1ns/1ps

module comparator(r,a,b);
	input [3:0]a;
	input [3:0]b;
	output [3:0]r;
	
	
	assign r[0]=(a<b)?1:0;
	assign r[1]=(a==b)?1:0;
	assign r[2]=(a>b)?1:0;
	assign r[3]=1'bz;

endmodule