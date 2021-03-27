`timescale 1ns/1ns

module MIPS_tb();

reg clk=0;
wire [31:0] resultado;


MIPS MIPS32(
	.clk(clk),
	.resultado(resultado)

);
always #1 clk = ~clk;

initial
begin
	@(posedge clk);
end

endmodule