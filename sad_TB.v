`timescale 1 ns/1 ns
`define A_WIDTH 15
`define D_WIDTH 8


module Testbench();

	reg Go_s;
   	wire [14:0] A_Addr_s, B_Addr_s;
   	wire [7:0] A_Data_s, B_Data_s, A_Di_s, B_Di_s;
	wire [6:0] C_Addr_s;  
	wire [31:0] C_Data_s, C_Di_s;
   	wire I_RW_s, I_En_s, O_RW_s, O_En_s, Done_s; 
   	reg Clk_s, Rst_s, Rst_m;
   	wire [31:0] SAD_Out_s;
	reg i;
	parameter ClkPeriod = 20;

	
	SAD CompToTest(Go_s, A_Addr_s, A_Data_s, B_Addr_s, B_Data_s, C_Addr_s, I_RW_s, I_En_s, O_RW_s, O_En_s, Done_s, SAD_Out_s, Clk_s, Rst_s); 
	Sram_Operand SADMemA(A_Di_s,  A_Data_s, A_Addr_s, I_RW_s, I_En_s, Clk_s, Rst_m);  
	Sram_Operand SADMemB(B_Di_s,  B_Data_s, B_Addr_s, I_RW_s, I_En_s, Clk_s, Rst_m);
	Sram_Result SADMemC(C_Di_s,  C_Data_s, C_Addr_s, O_RW_s, O_En_s, Clk_s, Rst_m); 


	always begin   
		Clk_s <= 0;
		#(ClkPeriod/2);
		Clk_s <= 1;
		#(ClkPeriod/2);
	end 

	initial $readmemh("MemA.txt", SADMemA.Memory);
   	initial $readmemh("MemB.txt", SADMemB.Memory);
	initial $readmemh("sw_result.txt", SADMemC.Memory);



	initial begin
      		Rst_m <= 1'b0; Rst_s <= 1'b1; Go_s <= 1'b0;     
      		@(posedge Clk_s);
      		Rst_s <= 1'b0; Go_s <= 1'b1;
      		@(posedge Clk_s);
      		Go_s <= 1'b0;
      		@(posedge Clk_s);
		while(Done_s != 1'b1) begin
			while(O_En_s != 1'b1)
				@(posedge Clk_s);
			if(O_En_s == 1'b1) begin
				@(posedge Clk_s);
				if(SAD_Out_s != 0) begin
		      			if(SAD_Out_s == C_Data_s) begin
	     					$display("# %d. SAD is %8h from HW -- It is equal to %8h form SW", C_Addr_s, SAD_Out_s, C_Data_s);
					end
					
				end
			end
		end
      		$stop; 	
	end
endmodule
	

	

	
