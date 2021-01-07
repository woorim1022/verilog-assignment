`timescale 1 ns/1 ns

module  Mux_4x1_2bit_gate(A1, A0,
	       B1, B0,
	       C1, C0,
	       D1, D0,
 	       S1, S0,
	       Out1, Out0);

	input A1, A0;
	input B1, B0;
	input C1, C0;
	input D1, D0;
	input S1, S0;
	output Out1, Out0;

       	Mux_4x1_1bit_gate Mux_4x1_1bit_gate_1(A1, B1, C1, D1, S1, S0, Out1);
	Mux_4x1_1bit_gate Mux_4x1_1bit_gate_2(A0, B0, C0, D0, S1, S0, Out0);

endmodule
