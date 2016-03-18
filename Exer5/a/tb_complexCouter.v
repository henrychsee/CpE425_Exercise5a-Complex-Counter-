/*
	Name: Matidios, Henry
	Date: 3/18/2016
	Description: Testbench for 4-bit Shifter
				clock(negative-edged)
				nreset(synchronous active low)
				M(mode control)
*/

`timescale 1ns/1ps

module tb_complexCounter;

	reg mode;
	reg clock;
	reg nreset;
	wire [2:0]count;
	
	complexCounter UUT(count,mode,clock,nreset);
	
	initial
	begin
	$dumpfile("complexCounter.vpd");
		$dumpvars;
	
		$finish;
	end
	
	always
		#60 clock<=~clock;
endmodule