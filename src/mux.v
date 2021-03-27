module mux(
	input selector,
	input [31:0]e0,
	input [31:0]e1,
	output reg [31:0] salida
);

always@(*)
begin
	case (selector)
		1'bx: salida = e0;
		1'b0: salida = e0;
		1'b1: salida = e1;
	endcase
end

endmodule // mux