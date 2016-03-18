
/*
	Name: Matidios, Henry
	Date: 1/6/2016
	Description: ALU with shifter
*/
`timescale 1ns/1ps

module alu(r,overflow,a,b,cin,m);
	input [3:0]a;
	input [3:0]b;
	input cin;
	input [3:0]m;
	wire [1:0]s;
	wire [1:0]s2;
	output reg [3:0]r; 
	output overflow;
	wire [3:0]w1;
	wire [3:0]w2;
	wire [3:0]w3;
	wire w4,w5,w6,w7,w8,w9,w10;
	wire [3:0]w11;
	wire [3:0]w12;
	wire [3:0]w13;
	wire [2:0]mode;

	assign s={m[1],m[0]};
	assign mode={m[2],m[1],m[0]};
	
	adder4bit u1(w1,w9,a,b);
	subtract4bit u2(w2,w10,a,b);
	comparator u3(w3,a,b);
	shifter u4(w13,a,mode);
	//ALU 
	multiplexer mux1(w11,w1,w2,w3,(a&b),s);
	multiplexer mux2(w12,(a|b),(~a),(a+4'd1),(a-4'd1),s);
	
	
	assign overflow=(m==3'd0)?w9:(m==3'd1)?w10:1'bz;

	always @(*)
		begin
			if(m[3]==0&&m[2]==0) r=w11;	
			else if(m[3]==0&&m[2]==1) r=w12;
			else if(m[3]==1&&m[2]==0||m[3]==1&&m[2]==1) r=w13;
		end		

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

module multiplexer(y,a,b,c,d,s);
	input [3:0]a;
	input [3:0]b;
	input [3:0]c;
	input [3:0]d;
	input [1:0]s;
	output [3:0]y;
	
	assign y=(s==2'b00)?a:(s==2'b01)?b:(s==2'b10)?c:(s==2'b11)?d:0;

endmodule

module shifter(r,a,mode);
	input [3:0] a;
	input [2:0] mode;

	output reg [3:0] r;
	reg w1;

	always @(*)
		case(mode)
			3'b000:
				begin 
					r[3]=a[2];
					r[2]=a[1];
					r[1]=a[0];
					r[0]=0; 
				end
			3'b001:
				begin 
					r[3]=a[2];
					r[2]=a[1];
					r[1]=a[0];
					r[0]=1; 
				end
			3'b010:
				begin
					r[3]=0;
					r[2]=a[3];
					r[1]=a[2];
					r[0]=a[1];
				end
			3'b011:
				begin
					r[3]=1;
					r[2]=a[3];
					r[1]=a[2];
					r[0]=a[1];
				end
			3'b100:
				begin
					r[3]=a[2];
					r[2]=a[1];
					r[1]=a[0];
					r[0]=0;
				end
			3'b101:
				begin
					w1 = a[0];
					r[0]=a[1];
					r[1]=a[2];
					r[2]=a[3];
					r[3] = w1;
				end
			3'b110:
				begin
					w1 = a[3];
					r[3]=a[2];
					r[2]=a[1];
					r[1]=a[0];
					r[0] = w1;
				end
			3'b111:
				begin
					w1 = a[0];
					r[0]=a[1];
					r[1]=a[2];
					r[2]=a[3];
					r[3] = w1;
				end
		endcase	
endmodule