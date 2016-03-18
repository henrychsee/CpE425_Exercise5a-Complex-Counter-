/*
	Name: Matidios, Henry
	Date: 1/20/2016
	Description: Program Counter
*/
`timescale 1ns/1ps

module tb_progcount;
	reg [7:0]A;
	reg Clk;
	reg nReset;
	reg CountEn;
	reg Load;
	wire [7:0]Y;

	progcount UUT1(Y,Clk,A,nReset,CountEn,Load);
	
	initial
	begin
	$dumpfile("progcount.vpd");
	$dumpvars;

		Clk=0;
		
		nReset=0;	Load=0;	CountEn=1; 	A=8'd1;
		#7	
		nReset= 1; 	Load=1;	CountEn=0;	A=8'd1; 
		#10	
		nReset= 1; 	Load=0;	CountEn=0;	A=8'd3; 
		#10 
		Load=0;	CountEn=1;	A=8'd0; 
		#10 
		Load=1;	CountEn=1;	A=8'd254; 
		#10 
		Load=0;	CountEn=1;	A=8'd0; 
		#10 
		Load=0;	CountEn=1;	A=8'd0; 
		#10 
		Load=0;	CountEn=1;	A=8'd0; 
		#10 
		Load=0;	CountEn=1;	A=8'd0; 
		#10 
		Load=0;	CountEn=1;	A=8'd0; 

		
		$finish;
	end
	always
		#5 Clk=~Clk;
	/*always @(*)
	$monitor("\nCLK = %b input: %8b output: %8b", Clk,A,Y);*/

endmodule