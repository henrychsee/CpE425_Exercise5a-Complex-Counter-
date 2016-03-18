`timescale 1ns/1ps

module tb_accumulator;
	reg Clk,nReset;
	wire carryb;
	wire [3:0]Y;
	reg [3:0]a;
	reg [3:0]b;
	reg [3:0]mode;
	reg cin;
	wire [3:0]r;
	wire overflow;

	f_accumulator UUT3(Y,carryb,Clk,nReset,a,b,mode,cin);
	
	initial
	begin
	$dumpfile("accumulator.vpd");
	$dumpvars;
		Clk=1;
		nReset=1;
		
		a=4'd2;
		b=4'd1;
		cin = 1'b0;
		mode=4'b0000;
		#7
	
		a=4'd5;
		b=4'd5;
		mode=4'b0000;
		#10
		
		
		a=4'd3;
		b=4'd9;
		mode=4'b0000;
		#10
		
		//sub
		nReset=0;
		a=4'd2;
		b=4'd1;
		cin = 1'b0;
		mode=4'b0001;
		#10
		
		a=4'd12;
		b=4'd5;
		mode=4'b0001;
		#10
		
		nReset=1;
		a=4'd7;
		b=4'd2;
		mode=4'b0001;
		#10
		
		//comp
	
		a=4'd2;
		b=4'd1;
		mode=4'b0010;
		#10
		
		a=4'd1;
		b=4'd4;
		mode=4'b0010;
		#10
		
		a=4'd6;
		b=4'd6;
		mode=4'b0010;
		#10
		
		//bitwise and
	
		a=4'd2;
		b=4'd1;
		mode=4'b0011;
		#10
		
		a=4'd4;
		b=4'd4;
		mode=4'b0011;
		#10
		
		a=4'd7;
		b=4'd8;
		mode=4'b0011;
		#10
		
		//bitwise or
	
		a=4'd2;
		b=4'd1;
		mode=4'b0100;
		#10
		
		a=4'd9;
		b=4'd9;
		mode=4'b0100;
		#10
		
		a=4'd3;
		b=4'd6;
		mode=4'b0100;
		#10
		
		//complement a
	
		a=4'd2;
		b=4'd1;
		mode=4'b0101;
		#10
		
		a=4'd7;
		b=4'd1;
		mode=4'b0101;
		#10
		
		a=4'd11;
		b=4'd1;
		mode=4'b0101;
		#10
		
		//increment a
		
		a=4'd2;
		b=4'd1;
		mode=4'b0110;
		#10
		
		a=4'd7;
		b=4'd1;
		mode=4'b0110;
		#10
		
		a=4'd6;
		b=4'd1;
		mode=4'b0110;
		#10
		
		//decrement a
		
		a=4'd2;
		b=4'd1;
		mode=4'b0111;
		#10
		
		a=4'd13;
		b=4'd1;
		mode=4'b0111;
		#10
		
		a=4'd10;
		b=4'd1;
		mode=4'b0111;
		#10
		
		//shift left 0
		
		a = 4'b1001;
		mode=4'b1000;
		#10
		
		a = 4'b1011;
		mode=4'b1000;
		#10
		
		a = 4'b1100;
		mode=4'b1000;
		#10
		
		//shift left 1
		
		a = 4'b0001;
		mode=4'b1001;
		#10
		
		a = 4'b1011;
		mode=4'b1001;
		#10
		
		a = 4'b1100;
		mode=4'b1001;
		#10
		
		//shift right 0
		
		a = 4'b1000;
		mode=4'b1010;
		#10
		
		a = 4'b1011;
		mode=4'b1010;
		#10
		
		a = 4'b1100;
		mode=4'b1010;
		#10

		//shift right 1
		
		a = 4'b1000;
		mode=4'b1011;
		#10
		
		a = 4'b1011;
		mode=4'b1011;
		#10
		
		a = 4'b1001;
		mode=4'b1011;
		#10
		
		//shift left arithmetic
		
		a = 4'b0010;
		mode=4'b1100;
		#10
		
		a = 4'b0011;
		mode=4'b1100;
		#10
		
		a = 4'b1010;
		mode=4'b1100;
		#10
		
		//shift right arithmetic
		a = 4'b0011;
		mode=4'b1101;
		#10
		
		a = 4'b1011;
		mode=4'b1101;
		#10
		
		a = 4'b0001;
		mode=4'b1101;
		#10
		
		
		//rotate left
		
		a = 4'b0101;
		mode=4'b1110;
		#10
		
		a = 4'b1001;
		mode=4'b1110;
		#10
		
		a = 4'b1101;
		mode=4'b1110;
		#10
		
		//rotate right
		
		a = 4'b1010;
		mode=4'b1111;
		#10
		
		a = 4'b1110;
		mode=4'b1111;
		#10
		
		a = 4'b1100;
		mode=4'b1111;
		#10
	
	$finish;
	end
	always
		#5 Clk=~Clk;
	
endmodule