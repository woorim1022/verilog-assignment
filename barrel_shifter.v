`timescale 1 ns/1 ns


module Barrel_Shifter(SH_DIR, SH_AMT, D_IN, D_OUT);
                   input SH_DIR;
                   input [4:0] SH_AMT; 
                   input [31:0] D_IN;
                   output [31:0] D_OUT;
		   reg sign;
		   wire [31:0] OUT_4, OUT_3, OUT_2, OUT_1;

	 always @(D_IN) begin
		sign <= 0;
		if(D_IN[31] == 1) begin          
			sign <= 1;
		end
	end


        Shifter_16_Bit Shifter_16_Bit (SH_DIR, SH_AMT[4], D_IN, OUT_4, sign);
	
	Shifter_8_Bit Shifter_8_Bit (SH_DIR, SH_AMT[3], OUT_4, OUT_3, sign);
	
	Shifter_4_Bit Shifter_4_Bit (SH_DIR, SH_AMT[2], OUT_3, OUT_2, sign);
	
	Shifter_2_Bit Shifter_2_Bit (SH_DIR, SH_AMT[1], OUT_2, OUT_1, sign);
	
	Shifter_1_Bit Shifter_1_Bit (SH_DIR, SH_AMT[0], OUT_1, D_OUT, sign);


endmodule

