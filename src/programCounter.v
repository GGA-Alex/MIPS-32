module programCounter (
	input clk,
	input [31:0] entrada1,
	output reg [31:0] salida_PC
);

initial
begin
	salida_PC <= -4;
end

always@(posedge clk) 
begin
   salida_PC <= entrada1;
end

endmodule
