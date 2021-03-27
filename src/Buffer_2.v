module Buffer_2(
	input clk,
	input [1:0] EX,
	input [2:0] M,
	input [2:0] WB,
	input [3:0] ALUop,
	input [31:0]data_read1,
	input [31:0]data_read2,
	input [31:0] Adder_in,
	input [31:0] Immediate,
	input [4:0] Rt,
	input [4:0] Rd,
	input [5:0] funct,
	input [31:0] jump_Address,
	
	output reg [31:0]data_read1_out,
	output reg [31:0]data_read2_out,
	output reg [1:0] EX_out,
	output reg [2:0] M_out,
	output reg [2:0] WB_out,
	output reg [3:0] ALUop_out,
	output reg [31:0] Adder_out,
	output reg [31:0] Immediate_out,
	output reg [4:0]Rt_out,
	output reg [4:0]Rd_out,
	output reg [5:0]funct_out,
	output reg [31:0] jump_Address_out
);

always@(posedge clk)
begin
	data_read1_out <= data_read1;
	data_read2_out <= data_read2;
	EX_out <= EX;
	M_out <= M;
	WB_out <= WB;
	ALUop_out <= ALUop;
	Adder_out <= Adder_in;
	Immediate_out <= Immediate;
	Rt_out <= Rt;
	Rd_out <= Rd;
	funct_out <= funct;
	jump_Address_out <= jump_Address;
end

endmodule
