`timescale 1ns/1ps

module alu(r,overflow,a,b,cin,m);
	input [3:0]a;
	input [3:0]b;
	input cin;
	input [2:0]m;
	output [3:0]r;
	output overflow;
	wire [3:0]w1;
	wire [3:0]w2;
	wire [3:0]w3;
	wire w4,w5,w6,w7,w8,w9,w10;
	
	adder4bit u1(w1,w9,a,b);
	subtract4bit u2(w2,w10,a,b);
	comparator u3(w3,a,b);
	
	assign overflow=(m==3'd0)?w9:(m==3'd1)?w10:1'bz;
	
	assign r=(m==3'd0)?w1:(m==3'd1)?w2:(m==3'd2)?w3:(m==3'd3)?a&b:
	(m==3'd4)?a|b:(m==3'd5)?~a:(m==3'd6)?a+4'd1:(m==3'd7)?a-4'd1:0;

endmodule

module adder4bit(s,cout,a,b);
	input [3:0]a;
	input [3:0]b;
	input cin;
	output [3:0]s;
	output cout;
	wire w1,w2,w3;

	adder u1(s[0],w1,0,a[0],b[0]);
	adder u2(s[1],w2,w1,a[1],b[1]);
	adder u3(s[2],w3,w2,a[2],b[2]);
	adder u4(s[3],cout,w3,a[3],b[3]);
endmodule

module subtract4bit(s,cout,a,b);
	input [3:0]a;
	input [3:0]b;
	output [3:0]s;
	output cout;
	wire w1,w2,w3,w4;
	
	subtract u1(s[0],w1,1,a[0],b[0]);
	subtract u2(s[1],w2,w1,a[1],b[1]);
	subtract u3(s[2],w3,w2,a[2],b[2]);
	subtract u4(s[3],cout,w3,a[3],b[3]);
endmodule

module adder(s,cout,cin,a,b);
	input a;
	input b;
	input cin;
	output s;
	output cout;
	wire w1,w2,w3,w4;
	
	xor(w1,b,cin);
	xor(s,a,w1);
	or(w2,b,cin);
	and(w3,a,w2);
	and(w4,b,cin);
	or(cout,w3,w4);	
endmodule

module subtract(s,cout,cin,a,b);
	input a;
	input b;
	input cin;
	output s;
	output cout;
	wire w1,w2,w3,w4;
	
	not(w5,b);
	xor(w1,w5,cin);
	xor(s,a,w1);
	or(w2,w5,cin);
	and(w3,a,w2);
	and(w4,w5,cin);
	or(cout,w3,w4);
endmodule

module comparator(r,a,b);
	input [3:0]a;
	input [3:0]b;
	output [3:0]r;
	
	assign r[0]=(a<b)?1:0;
	assign r[1]=(a==b)?1:0;
	assign r[2]=(a>b)?1:0;
	assign r[3]=Z;
endmodule