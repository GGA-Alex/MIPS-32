module decode(
	input clk,
	input [31:0] Instruccion,
	input [31:0] Adder_in,
	input RegWrite,
	input [4:0] AddressWrite,
	input [31:0] DataWrite,
	
	output [31:0] Dato1,
	output [31:0] Dato2,
	output [31:0] Adder_out,
	output [31:0] Immediate,
	output [4:0] Rt,
	output [4:0] Rd,
	output [1:0] EX_salida,
	output [2:0] M_salida,
	output [2:0] WB_salida,
	output [3:0] ALUop_salida,
	output [5:0] funct_out,
	output [31:0] jump_address_out
);

wire [1:0] ex;
wire [2:0] m;
wire [2:0] wb;
wire [3:0] aluop;
wire [31:0] DATO1;
wire [31:0] DATO2;
wire [31:0] IMMEDIATE;
wire [27: 0] JA1;
wire [31:0] JA2;

shoftLeft2 SHIFT_LEFT(
	.entrada(Instruccion[25:0]),
	.salida(JA1)
);

assign JA2 = { Adder_in[31:28] , JA1[27:0] };

control CONTROL_UNIT(
	.Opcode(Instruccion[31:26]),
	.EX(ex),
	.M(m),
	.WB(wb),
	.ALUop(aluop)
);

Registers REGISTROS(
	.adress1(Instruccion[25:21]),
	.adress2(Instruccion[20:16]),
	.data_write(DataWrite),
	.address_write(AddressWrite),
	.Regwrite(RegWrite),
	.data_read1(DATO1),
	.data_read2(DATO2)
);

SignExtended SIGN_EXTENDED(
	.entrada(Instruccion[15:0]),
	.salida(IMMEDIATE)
);

Buffer_2 ID_EX(
	.clk(clk),
	.EX(ex),
	.M(m),
	.WB(wb),
	.ALUop(aluop),
	.data_read1(DATO1),
	.data_read2(DATO2),
	.Adder_in(Adder_in),
	.Immediate(IMMEDIATE),
	.Rt(Instruccion[20:16]),
	.Rd(Instruccion[15:11]),
	.funct(Instruccion[5:0]),
	.jump_Address(JA2),
	
	.data_read1_out(Dato1),
	.data_read2_out(Dato2),
	.EX_out(EX_salida),
	.M_out(M_salida),
	.WB_out(WB_salida),
	.ALUop_out(ALUop_salida),
	.Adder_out(Adder_out),
	.Immediate_out(Immediate),
	.Rt_out(Rt),
	.Rd_out(Rd),
	.funct_out(funct_out),
	.jump_Address_out(jump_address_out)
);
endmodule
