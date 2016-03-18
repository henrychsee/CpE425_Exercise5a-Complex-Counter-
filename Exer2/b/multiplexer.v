/*
	Name: Matidios, Henry
	Date: 12/9/2015
	Description: Multiplexer
*/
`timescale 1ns/1ps

module multiplexer(y,a,b,c,d,s);
	input [3:0]a;
	input [3:0]b;
	input [3:0]c;
	input [3:0]d;
	input [1:0]s;
	output [3:0]y;
	
	assign y=(s==2'b00)?a:(s==2'b01)?b:(s==2'b10)?c:(s==2'b11)?d:0;

endmodule