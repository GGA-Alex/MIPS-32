module Add (
	input [31:0] Adder_in,
	input [31:0] Immediate,
	
	output [31:0] salida
);

assign salida = Adder_in + Immediate;

endmodule
