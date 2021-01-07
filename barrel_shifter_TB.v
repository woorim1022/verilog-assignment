`timescale 1 ns/1 ns

module Testbench();
	reg Direction;
        reg [4:0] Amount; 
        reg [31:0] INPUT;
	wire[31:0] OUTPUT;
	reg [5:0] Index;
	
	Barrel_Shifter CompToTest(Direction, Amount, INPUT, OUTPUT);
	
	
	initial begin 
		$display("# 1.Shift-Right Operation Test with Negative Value!");
		for(Index = 6'b000000; Index < 6'b100000; Index = Index + 1) begin
			Direction <= 1;
			Amount <= Index[4:0];
			INPUT <= {1'b1,31'b0};
			#5;
			$display("# shift-right with amount %d is %32b", Index, OUTPUT);   /////////////////////////////////////////////
		end 

		$display("# 2.Shift-Right Operation Test with Positive Value!");
		for(Index = 6'b000000; Index < 6'b100000; Index = Index + 1) begin
			Direction <= 1;
			Amount <= Index[4:0];
			INPUT <= {1'b0,1'b1,30'b0};
			#5;
			$display("# shift-right with amount %d is %32b", Index, OUTPUT);
		end 

		$display("# 3.Shift-Left Operation Test with Number 1!");
		for(Index = 6'b000000; Index < 6'b100000; Index = Index + 1) begin
			Direction <= 0;
			Amount <= Index[4:0];
			INPUT <= {31'b0,1'b1};
			#5;
			$display("# shift-left with amount %d is %32b", Index, OUTPUT);
		end 
	end



endmodule
	