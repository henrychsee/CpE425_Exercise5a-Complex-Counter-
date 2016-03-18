`timescale 1ns/1ps

module alushifter(r,overflow,a,b,cin,mode);
	input [3:0]a;
	input [3:0]b;
	input [3:0]mode;
	input cin;
	output reg [3:0]r;
	output overflow1;
	output reg overflow;
	reg w1;
	wire [3:0]w2;
	wire [3:0]w3;
	
	
	alu UUT1(w2,overflow1,a,b,cin,mode[2:0]);
	shifter UUT2(w3,a,mode[2:0]);
	
	
	always @(*)
		casex (mode)
			4'b0xxx : begin r = w2; overflow = overflow1; end
			4'b1xxx : begin r = w3; overflow = 1'bz; end
		endcase
endmodule