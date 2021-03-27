module memory(
	input clk,
	input [2:0] M,
	input [2:0] WB,
	input [31:0] Alu_result,
	input [31:0] Dato2,
	input [4:0] Direccion,
	input [31:0] jump_address,
	
	output [31:0] Read_data,
	output [31:0] Alu_result_out,
	output [2:0] WB_out,
	output [4:0] Direccion_out,
	output [31:0] jump_address_out

);
wire [31:0] READ_DATA;

dataMemory DATA_MEMORY(
	.addr(Alu_result),      
   .write_data(Dato2),		
   .memwrite(M[1]),
	.memread(M[0]),
	.read_data(READ_DATA)
);

Buffer_4 B4(
	.clk(clk),
	.Read_data(READ_DATA),
	.Alu_result(Alu_result),
	.WB(WB),
	.direccion(Direccion),
	.jump_address(jump_address),
	
	.Read_data_out(Read_data),
	.Alu_result_out(Alu_result_out),
	.WB_out(WB_out),
	.direccion_out(Direccion_out),
	.jump_address_out(jump_address_out)
);

endmodule
