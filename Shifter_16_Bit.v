`timescale 1 ns/1 ns

module Shifter_16_Bit(SH_DIR, AMT_n, INPUT, OUTPUT, neg);
   input SH_DIR;
   input AMT_n;
   input neg;
   input [31:0] INPUT;
   output reg [31:0] OUTPUT;

   always @* begin
   	if(AMT_n == 1)begin 	
		if(SH_DIR == 1) begin         
			OUTPUT <= INPUT / (2**16);    
			if(neg == 1) OUTPUT[31:16] <= 16'b1111111111111111;  
			else OUTPUT[31:16] <= 16'b0000000000000000;           
		end
		else begin                  
			OUTPUT <= INPUT * (2**16);    
			OUTPUT[15:0] <= 16'b0000000000000000;          
		end
   	end
	else begin
		OUTPUT <= INPUT;
	end
   end
   
endmodule 