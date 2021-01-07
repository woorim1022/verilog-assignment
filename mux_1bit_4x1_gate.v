`timescale 1 ns/1 ns

module Mux_4x1_1bit_gate(A, B, C, D,
 	       		S1, S0,
	       		Out);

	input A, B, C, D;
	input S1, S0;
	output Out;
	reg Out;

	always @* 
	begin
       		if (S1==0 && S0==0)
         		Out <= A;
      		else if (S1==0 && S0==1)
         		Out <= B;
      		else if (S1==1 && S0==0)
         		Out <= C;
      		else
         		Out <= D;

   	end
endmodule
