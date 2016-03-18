
/*
	Name: Matidios, Henry
	Date: 1/20/2016
	Description: Program Counter
*/
`timescale 1ns/1ps

module progcount(Y,Clk,A,nReset,CountEn,Load);
	input [7:0]A;
	input Clk, nReset, CountEn, Load;
	output reg [7:0]Y;
	
	
	always @(negedge Clk, nReset,Load)
		begin
			if(nReset==0)
				Y<=0;
			else
			begin
				if(Load)
					Y<=A;
				else 
					if(CountEn)
					Y<=Y+8'd1;
			end
		end

	always @(A or posedge nReset)
		begin
			if(nReset==0) Y<=0;
			else if(Load==1) Y<=A;
		end
endmodule