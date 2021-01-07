`timescale 1 ns/1 ns


 module Code_Detector(Start, Red, Green, Blue, Clk, Rst, U);
 	input Start, Red, Green, Blue;
	output reg U; 
        input Clk, Rst;

	parameter s_wait = 0, s_start = 1,
		  s_red1 = 2, s_blue = 3,
		  s_green = 4, s_red2 = 5;

	reg [2:0] State, StateNext;

	always @(posedge Clk) begin
		if(Rst == 1)
			State <= s_wait;
		else
			State <= StateNext;
	end

	always @(State, Start, Red, Green, Blue) begin
		case(State)
			s_wait: begin
				U <= 0;
				if(Start == 0)
					StateNext <= s_wait;
				else
					StateNext <= s_start;
			end	
			s_start: begin
				U <= 0;
				if(Red == 1 && Green == 0 && Blue == 0)
					StateNext <= s_red1;
				else if(Red == 0 && Green == 0 && Blue == 0)
					StateNext <= s_start;
				else
					StateNext <= s_wait;
			end
			s_red1: begin
				U <= 0;
				if(Red == 0 && Green == 0 && Blue == 1)
					StateNext <= s_blue;
				else if(Red == 0 && Green == 0 && Blue == 0)
					StateNext <= s_red1;
				else
					StateNext <= s_wait;

			end
			s_blue: begin
				U <= 0;
				if(Red == 0 && Green == 1 && Blue == 0)
					StateNext <= s_green;
				else if(Red == 0 && Green == 0 && Blue == 0)
					StateNext <= s_blue;
				else
					StateNext <= s_wait;
		
			end
			s_green: begin
				U <= 0;
				if(Red == 1 && Green == 0 && Blue == 0)
					StateNext <= s_red2;
				else if(Red == 0 && Green == 0 && Blue == 0)
					StateNext <= s_green;
				else
					StateNext <= s_wait;
	
			end
			s_red2: begin 
				U <= 1;
				StateNext <= s_wait;
			end
		endcase
	end

endmodule


