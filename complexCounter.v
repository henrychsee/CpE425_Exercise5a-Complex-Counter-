/*
	Name: Matidios, Henry
	Date: 1/6/2016
	Description: 4-bit Shifter
				clock(negative-edged)
				nreset(synchronous active low)
				M(mode control)
				
*/
`timescale 1ns/1ps

module complexCounter();

	input mode;
	input clock;
	input nreset;
	output [2:0]count;
	reg [2:0]cstate;
	reg [2:0]nstate;
	
	//state encoding
	parameter A=3'b000;
	parameter B=3'b001;
	parameter C=3'b010;
	parameter D=3'b011;
	parameter E=3'b100;
	parameter F=3'b101;
	parameter G=3'b110;
	parameter H=3'b111;
	
	//state transitions
	always@(negedge clock or negedge nreset)
		if(nreset)
			
	//next state assignment
	always@(cstate)
		case(cstate)
			A:if(!mode)begin nstate<=B;count<=;end else nstate<=A;
			B:if(!mode)nstate<=C;else nstate<=B;
			C:if(!mode)nstate<=D;else nstate<=G;
			D:if(!mode)nstate<=E;else nstate<=D;
			E:if(!mode)nstate<=F;else nstate<=E;
			F:if(!mode)nstate<=G;else nstate<=F;
			G:if(!mode)nstate<=H;else nstate<=H;
			H:if(!mode)nstate<=A;else nstate<=F;
		endcase
	
	always@(cstate)
		case(cstate)
			A:if();else;
			B:if();else;
			C:if();else;
			D:if();else;
			E:if();else;
			F:if();else;
			G:if();else;
			H:if();else;
		endcase
			
endmodule