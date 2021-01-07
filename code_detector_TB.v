`timescale 1 ns/1 ns

module Testbench();
	reg Clk_s, Start_s, Red_s, Green_s, Blue_s, Rst_s;
	wire U_s;
	reg [12:0] Index, c_Index;
	reg [2:0] fth, thd, snd, fst, c_fth, c_thd, c_snd, c_fst;
	
	Code_Detector CompToTest(Start_s, Red_s, Green_s, Blue_s, Clk_s, Rst_s, U_s);
	


	always begin   
		Clk_s <= 0;
		#10;
		Clk_s <= 1;
		#10;
	end 
	
	
	
	initial begin 
		Rst_s <= 1;
		Start_s <= 0;
		@(posedge Clk_s);
		#5 Rst_s <= 0;
		for(Index = 13'b0000000000000; Index < 13'b1000000000000; Index = Index + 1) begin
			@(posedge Clk_s);
			#5;
			Start_s <= 1; 
			Red_s <= 0;
			Green_s <= 0;
			Blue_s <= 0;
			fst <= Index[2:0];
			snd <= Index[5:3];
			thd <= Index[8:6];
			fth <= Index[11:9];
			@(posedge Clk_s);
			#5;
			Red_s <= Index[2];
			Green_s <= Index[1];
			Blue_s <= Index[0];
			@(posedge Clk_s);
			#5;
			Red_s <= Index[5];
			Green_s <= Index[4];
			Blue_s <= Index[3];
			@(posedge Clk_s);
			#5;
			Red_s <= Index[8];
			Green_s <= Index[7];
			Blue_s <= Index[6];
			@(posedge Clk_s);
			#5;
			Red_s <= Index[11];
			Green_s <= Index[10];
			Blue_s <= Index[9];
			@(posedge Clk_s);
			#5;
			if(U_s == 1) begin
				$display("# %d : %3b_%3b_%3b_%3b is correct!", Index, fth, thd, snd, fst);
				c_fth <= fth; c_thd <= thd; c_snd <= snd; c_fst <= fst; c_Index <= Index;
			end
			else
				$display("# %d : %3b_%3b_%3b_%3b is incorrect!", Index, fth, thd, snd, fst);
			@(posedge Clk_s);
			#5;
			Start_s <= 0;
		end
		$display("# %d : %3b_%3b_%3b_%3b is correct!", c_Index, c_fth, c_thd, c_snd, c_fst);
		$stop;
	end



endmodule
	
