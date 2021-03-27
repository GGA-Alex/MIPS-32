module adder(
	input [31:0] entrada1,
	output reg [31:0] salida
); 


always@(*) 
begin
	salida = entrada1 + 4;
end

endmodule
