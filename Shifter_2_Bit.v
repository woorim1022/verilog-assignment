`timescale 1 ns/1 ns

module Shifter_2_Bit(SH_DIR, AMT_n, INPUT, OUTPUT, neg);

   input SH_DIR;
   input AMT_n;
   input neg;
   input [31:0] INPUT;
   output reg [31:0] OUTPUT;

   always @* begin
   	if(AMT_n == 1)begin 	
		if(SH_DIR == 1) begin         
			OUTPUT <= INPUT / (2**2);   
			if(neg == 1) OUTPUT[31:30] <= 2'b11;  
			else OUTPUT[31:30] <= 2'b00;        
		end
		else begin                 
			OUTPUT <= INPUT * (2**2);  
			OUTPUT[1:0] <= 2'b00;         
		end
   	end
	else begin
		OUTPUT <= INPUT;
	end
   end
   
endmodule 