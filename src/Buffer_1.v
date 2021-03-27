module Buffer_1 (
	input clk,
	input [31:0] Instruccion,
	input [31:0] Adder_in,
	
	output reg [31:0] Instruccion_out,
	output reg [31:0] Adder_out
);

always@(posedge clk)
begin
	Instruccion_out <= Instruccion;
	Adder_out <= Adder_in;
end

endmodule
