module fetch(
	input clk,
	input PCSrc,
	input [31:0]EX_MEM,
	input [31:0] jump_address,
	input jump,
	
	output [31:0]Adder,
	output [31:0]Instruccion
);

wire [31:0] SALIDA_MUX1;
wire [31:0] SALIDA_MUX2;
wire [31:0] SALIDA_PC;
wire [31:0] SALIDA_ADDER;
wire [31:0] SALIDA_INSTRUCCION;

mux MUX1(
	.selector(PCSrc),
	.e0(SALIDA_ADDER),
	.e1(EX_MEM),
	.salida(SALIDA_MUX1)
);

mux MUX2(
	.selector(jump),
	.e0(SALIDA_MUX1),
	.e1(jump_address),
	.salida(SALIDA_MUX2)
);

programCounter PROGRAM_COUNTER(
	.clk(clk),
	.entrada1(SALIDA_MUX2),
	.salida_PC(SALIDA_PC)
);

adder ADDER(
	.entrada1(SALIDA_PC),
	.salida(SALIDA_ADDER)
);

instructionMemory INSTRUCTION_MEMORY(
	.pc_entrada(SALIDA_PC),
	.instruccion(SALIDA_INSTRUCCION)
);

Buffer_1 IF_ID(
	.clk(clk),
	.Instruccion(SALIDA_INSTRUCCION),
	.Adder_in(SALIDA_ADDER),
	
	.Instruccion_out(Instruccion),
	.Adder_out(Adder)
);

endmodule
