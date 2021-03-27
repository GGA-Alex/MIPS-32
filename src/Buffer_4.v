module Buffer_4 (
	input clk,
	input [31:0]Read_data,
	input [31:0]Alu_result,
	input [2:0]WB,
	input [4:0]direccion,
	input [31:0] jump_address,
	
	output reg [31:0] Read_data_out,
	output reg [31:0] Alu_result_out,
	output reg [2:0] WB_out,
	output reg [4:0] direccion_out,
	output reg [31:0] jump_address_out
);

always@(posedge clk)
begin
	Read_data_out <= Read_data;
	Alu_result_out <= Alu_result;
	WB_out <= WB;
	direccion_out <= direccion;
	jump_address_out <= jump_address;
	
end

endmodule
