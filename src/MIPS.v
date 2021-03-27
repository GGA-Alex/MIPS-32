module MIPS (
	input clk,
	output [31:0]resultado
);

//FETCH
wire [31:0] INSTRUCCION;
wire [31:0] SALIDA_ADDER_FETCH;

//DECODE

wire [31:0] SALIDA_DATO1_DECODE;
wire [31:0] SALIDA_DATO2_DECODE;
wire [4:0] SALIDA_RT_DECODE;
wire [4:0] SALIDA_RD_DECODE;
wire [31:0] SALIDA_ADDER_DECODE;
wire [31:0] SALIDA_IMMEDIATE_DECODE;
wire [1:0] SALIDA_EX_DECODE;
wire [2:0] SALIDA_M_DECODE;
wire [2:0] SALIDA_WB_DECODE;
wire [3:0] SALIDA_ALUOP_DECODE;
wire [5:0] SALIDA_FUNCTION_DECODE;
wire [31:0] SALIDA_JUMP_DECODE;

//EXECUTE
wire [31:0] SALIDA_Alu_result_EXECUTE;
wire [31:0] SALIDA_Add_result_EXECUTE;
wire [2:0] SALIDA_M_out_EXECUTE;
wire [2:0] SALIDA_WB_out_EXECUTE;
wire SALIDA_Zero_EXECUTE;
wire [31:0] SALIDA_Dato2_M_EXECUTE;
wire [4:0] SALIDA_Direccion_EXECUTE;
wire [31:0] SALIDA_JUMP_EXECUTE;

//MEMORY
wire [31:0] Read_data_memory;
wire [31:0] Alu_result_out_memory;
wire [2:0] WB_out_memory;
wire [4:0] Direccion_out_memory;
wire [31:0] SALIDA_JUMP_MEMORY;

fetch FETCH(
	//INPUT
	.clk(clk),
	.PCSrc(SALIDA_Zero_EXECUTE & SALIDA_M_out_EXECUTE[2]),
	.EX_MEM(SALIDA_Add_result_EXECUTE),
	.jump_address(SALIDA_JUMP_MEMORY),
	.jump(WB_out_memory[2]),
	
	//OUTPUT
	.Adder(SALIDA_ADDER_FETCH),
	.Instruccion(INSTRUCCION)
);

decode DECODE(
	//INPUT
	.clk(clk),
	.Instruccion(INSTRUCCION),
	.Adder_in(SALIDA_ADDER_FETCH),
	.RegWrite(WB_out_memory[1]),
	.AddressWrite(Direccion_out_memory),
	.DataWrite(resultado),
	
	//OUTPUT
	.Dato1(SALIDA_DATO1_DECODE),
	.Dato2(SALIDA_DATO2_DECODE),
	.Adder_out(SALIDA_ADDER_DECODE),
	.Immediate(SALIDA_IMMEDIATE_DECODE),
	.Rt(SALIDA_RT_DECODE),
	.Rd(SALIDA_RD_DECODE),
	.EX_salida(SALIDA_EX_DECODE),
	.M_salida(SALIDA_M_DECODE),
	.WB_salida(SALIDA_WB_DECODE),
	.ALUop_salida(SALIDA_ALUOP_DECODE),
	.funct_out(SALIDA_FUNCTION_DECODE),
	.jump_address_out(SALIDA_JUMP_DECODE)
);


execute EXECUTE(
	//INPUT
	.clk(clk), 
	.Dato1(SALIDA_DATO1_DECODE),
	.Dato2(SALIDA_DATO2_DECODE),
	.EX(SALIDA_EX_DECODE),
	.M(SALIDA_M_DECODE),
	.WB(SALIDA_WB_DECODE),
	.ALUop(SALIDA_ALUOP_DECODE),
	.Adder_in(SALIDA_ADDER_DECODE),
	.Immediate(SALIDA_IMMEDIATE_DECODE),
	.Rt(SALIDA_RT_DECODE),
	.Rd(SALIDA_RD_DECODE),
	.funct(SALIDA_FUNCTION_DECODE),
	.jump_address(SALIDA_JUMP_DECODE),
	
	//OUTPUT
	.Alu_result(SALIDA_Alu_result_EXECUTE),
	.Add_result(SALIDA_Add_result_EXECUTE),
	.M_out(SALIDA_M_out_EXECUTE),
	.WB_out(SALIDA_WB_out_EXECUTE),
	.Zero(SALIDA_Zero_EXECUTE),
	.Dato2_M(SALIDA_Dato2_M_EXECUTE),
	.Direccion(SALIDA_Direccion_EXECUTE),
	.jump_address_out(SALIDA_JUMP_EXECUTE)
);

memory MEMORY(
	//INPUT
	.clk(clk),
	.M(SALIDA_M_out_EXECUTE),
	.WB(SALIDA_WB_out_EXECUTE),
	.Alu_result(SALIDA_Alu_result_EXECUTE),
	.Dato2(SALIDA_Dato2_M_EXECUTE),
	.Direccion(SALIDA_Direccion_EXECUTE),
	.jump_address(SALIDA_JUMP_EXECUTE),
	
	//OUTPUT
	.Read_data(Read_data_memory),
	.Alu_result_out(Alu_result_out_memory),
	.WB_out(WB_out_memory),
	.Direccion_out(Direccion_out_memory),
	.jump_address_out(SALIDA_JUMP_MEMORY)
);

mux MUX1(
	.selector(WB_out_memory[0]),
	.e0(Alu_result_out_memory),
	.e1(Read_data_memory),
	.salida(resultado)
);

endmodule
