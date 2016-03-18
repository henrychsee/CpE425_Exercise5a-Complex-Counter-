/*
	Name: Matidios, Henry
	Date: 1/6/2016
	Description: 4-bit Shifter
				clock(negative-edged)
				nreset(synchronous active low)
				M(mode control)
*/
`timescale 1ns/1ps

module complexCounter(count,mode,clock,nreset);

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
			cstate<=3'b000;
		else
			cstate<=nstate;
			
	//next state and output assignment
	always@(cstate)
		case(cstate)
			A:if(!mode)begin nstate<=B;count<=A;end else begin nstate<=A;count<=A;end
			B:if(!mode)begin nstate<=C;count<=B;end else begin nstate<=B;count<=B;end
			C:if(!mode)begin nstate<=D;count<=C;end else begin nstate<=G;count<=C;end
			D:if(!mode)begin nstate<=E;count<=D;end else begin nstate<=D;count<=D;end
			E:if(!mode)begin nstate<=F;count<=E;end else begin nstate<=E;count<=E;end
			F:if(!mode)begin nstate<=G;count<=F;end else begin nstate<=F;count<=F;end
			G:if(!mode)begin nstate<=H;count<=G;end else begin nstate<=H;count<=G;end
			H:if(!mode)begin nstate<=A;count<=H;end else begin nstate<=F;count<=H;end
		endcase			
endmodule