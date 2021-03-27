module Buffer_3(
	input clk,
	input [2:0] M,
	input [2:0] WB,
	input [31:0]Add_result,
	input zero,
	input [31:0] Alu_result,
	input [31:0] Dato2,
	input [4:0] Direccion,
	input [31:0] jump_address,
	
	output reg [2:0] M_out,
	output reg [2:0] WB_out,
	output reg [31:0]Add_result_out,
	output reg zero_out,
	output reg [31:0] Alu_result_out,
	output reg [31:0] Dato2_out,
	output reg [4:0] Direccion_out,
	output reg [31:0] jump_address_out
);


always@(posedge clk)
begin
	M_out <= M;
	WB_out <= WB;
	Add_result_out <= Add_result;
	zero_out <= zero;
	Alu_result_out <= Alu_result;
	Dato2_out <= Dato2;
	Direccion_out <= Direccion;
	jump_address_out <= jump_address;
end

endmodule
