module mux2(
	input selector,
	input [4:0]e0,
	input [4:0]e1,
	output reg [4:0] salida
);

always@(*)
begin
	case (selector)
		1'b0: salida = e0;
		1'b1: salida = e1;
	endcase
end

endmodule
