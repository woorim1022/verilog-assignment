`timescale 1 ns/1 ns

module Shifter_1_Bit(SH_DIR, AMT_n, INPUT, OUTPUT, neg);

   input SH_DIR;
   input AMT_n;
   input neg;
   input [31:0] INPUT;
   output reg [31:0] OUTPUT;

   always @* begin
   	if(AMT_n == 1)begin 	
		if(SH_DIR == 1) begin       
			OUTPUT <= INPUT / (2**1);    
			if(neg == 1) OUTPUT[31] <= 1;  
			else OUTPUT[31] <= 0;          
		end
		else begin                   
			OUTPUT <= INPUT * (2**1);    
			OUTPUT[0] <= 0;        
		end
   	end
	else begin
		OUTPUT <= INPUT;
	end
   end
   
endmodule 