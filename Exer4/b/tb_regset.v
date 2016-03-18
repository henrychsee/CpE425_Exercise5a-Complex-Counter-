/*
	Name: Matidios, Henry
	Date: 1/20/2016
	Description: tb 4-bit Register set
*/
`timescale 1ns/1ps

module tb_regset;
	reg [3:0]Data_in;
	reg [2:0]Address;
	reg Clk, RW;
	wire [3:0]Data_out;
	
	regset UUT1(Data_out,Clk,Data_in,Address,RW);
	
	initial
	begin
	$dumpfile("regset.vpd");
	$dumpvars;

		Clk=0;Data_in=4'd0; Address=3'd0; RW=1;
		#7 Data_in=4'd1; Address=3'd1; RW=1;
		#10 Data_in=4'd2; Address=3'd2; RW=1;
		#10 Data_in=4'd3; Address=3'd3; RW=1;
		#10 Data_in=4'd4; Address=3'd4; RW=1;
		#10 Data_in=4'd5; Address=3'd5; RW=1;
		#10 Data_in=4'd6; Address=3'd6; RW=1;
		#10 Data_in=4'd7; Address=3'd7; RW=1;
		#10 Address=3'd7; RW=0;
		#10 Address=3'd6; RW=0;
		#10 Address=3'd5; RW=0;
		#10 Address=3'd4; RW=0;
		#10 Address=3'd3; RW=0;
		#10 Address=3'd2; RW=0;
		#10 Address=3'd1; RW=0;
		#10 Address=3'd0; RW=0;
		#10 $finish;
	end
	
	always
		#5 Clk=~Clk;
	
endmodule