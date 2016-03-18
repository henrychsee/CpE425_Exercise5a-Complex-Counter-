/*
	Name: Matidios, Henry
	Date: 12/9/2015
	Description: Comparator(Behavioral modelling)
*/
`timescale 1ns/1ps

module comparator(r,a,b);
	input [3:0]a;
	input [3:0]b;
	output reg [3:0]r;
	
	always @ (*)
		begin
			if(a<b)
				begin
					r[0]=1;
					r[1]=0;
					r[2]=0;
					r[3]=1'bz;
				end
			else if(a==b)
				begin
					r[0]=0;
					r[1]=1;
					r[2]=0;
					r[3]=1'bz;
				end
			else if(a>b)
				begin
					r[0]=0;
					r[1]=0;
					r[2]=1;
					r[3]=1'bz;
				end
			else
				begin
					r[0]=0;
					r[1]=0;
					r[2]=0;
					r[3]=1'bz;
				end
		end
endmodule