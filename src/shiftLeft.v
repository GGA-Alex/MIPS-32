module shiftLeft(
	input [31:0] entrada,
	output [31:0] salida
);

assign salida = entrada << 2;
endmodule
