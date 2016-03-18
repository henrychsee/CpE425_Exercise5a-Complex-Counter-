/*
	Name: Matidios, Henry
	Date: 1/6/2016
	Description: test bench 4-bit Shifter
*/

module tb_shifter;
	reg [3:0] a;
	reg [2:0] mode;

	wire [3:0] r;

	shifter UUT(r,a,mode);

	initial
		begin
			$dumpfile("shifter.vpd");
			$dumpvars;

			a=4'b1001;
			mode=3'b000;
			#10;

			a=4'b0000;
			mode=3'b001;
			#10;

			a=4'b0001;
			mode=3'b010;
			#10;

			a=4'b0010;
			mode=3'b011;
			#10;

			a=4'b0011;
			mode=3'b100;
			#10;

			a=4'b0100;
			mode=3'b101;
			#10;

			a=4'b1001;
			mode=3'b110;
			#10;

			a=4'b0110;
			mode=3'b111;
			#10;

			a=4'b0111;
			mode=3'b011;
			#10;

			a=4'b1000;
			mode=3'b111;
			#10;

		$finish;
	end
endmodule