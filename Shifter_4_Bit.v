`timescale 1 ns/1 ns

module Shifter_4_Bit(SH_DIR, AMT_n, INPUT, OUTPUT, neg);

   input SH_DIR;
   input AMT_n;
   input neg;
   input [31:0] INPUT;
   output reg [31:0] OUTPUT;

   always @* begin
   	if(AMT_n == 1)begin 	
		if(SH_DIR == 1) begin        
			OUTPUT <= INPUT / (2**4);   
			if(neg == 1) OUTPUT[31:28] <= 4'b1111;  
			else OUTPUT[31:28] <= 4'b0000;         
		end
		else begin                    
			OUTPUT <= INPUT * (2**4);    
			OUTPUT[3:0] <= 4'b0000;          
		end
   	end
	else begin
		OUTPUT <= INPUT;
	end
   end
   
endmodule 