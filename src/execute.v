module execute (
	input clk, 
	input [31:0] Dato1,
	input [31:0] Dato2,
	input [1:0] EX,
	input [2:0] M,
	input [2:0] WB,
	input [3:0] ALUop,
	input [31:0] Adder_in,
	input [31:0] Immediate,
	input [4:0] Rt,
	input [4:0] Rd,
	input [5:0] funct,
	input [31:0] jump_address,
	
	output [31:0] Alu_result,
	output [31:0] Add_result,
	output [2:0] M_out,
	output [2:0] WB_out,
	output Zero,
	output [31:0]Dato2_M,
	output [4:0]Direccion,
	output [31:0] jump_address_out
);

wire [4:0] DIRECCION_MUX;
wire [3:0] SELECTOR_ALU;
wire [31:0] DATO_RESULTADO_MUX3;
wire [31:0] RESULTADO_ALU;
wire [31:0] RESULTADO_SHIFT_LEFT;
wire [31:0] RESULTADO_ADD;
wire ZF_SALIDA;

mux2 MUX2(
	.selector(EX[0]),
	.e0(Rt),
	.e1(Rd),
	.salida(DIRECCION_MUX)
);

aluControl ALU_CONTROL(
	.ALUop(ALUop),
	.in(funct),
	.out(SELECTOR_ALU)
);

shiftLeft SHIFT_LEFT(
	.entrada(Immediate),
	.salida(RESULTADO_SHIFT_LEFT)
);

Add ADD(
	.Adder_in(Adder_in),
	.Immediate(RESULTADO_SHIFT_LEFT),
	.salida(RESULTADO_ADD)
);

mux MUX3(
	.selector(EX[1]),
	.e0(Dato2),
	.e1(Immediate),
	.salida(DATO_RESULTADO_MUX3)
);

ALU alu(
	.op1(Dato1),
	.op2(DATO_RESULTADO_MUX3),
	.selector(SELECTOR_ALU),
	.salida(RESULTADO_ALU),
	.zf(ZF_SALIDA)
);

Buffer_3 B3(
	.clk(clk),
	.M(M),
	.WB(WB),
	.Add_result(RESULTADO_ADD),
	.zero(ZF_SALIDA),
	.Alu_result(RESULTADO_ALU),
	.Dato2(Dato2),
	.Direccion(DIRECCION_MUX),
	.jump_address(jump_address),
	
	.M_out(M_out),
	.WB_out(WB_out),
	.Add_result_out(Add_result),
	.zero_out(Zero),
	.Alu_result_out(Alu_result),
	.Dato2_out(Dato2_M),
	.Direccion_out(Direccion),
	.jump_address_out(jump_address_out)
);

endmodule
