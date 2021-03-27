module ALU(
input [31:0]op1,
input [31:0]op2,
input [3:0]selector,
output reg[31:0]salida,
output reg zf

);

always@(*)
	begin
		zf = (op1 == op2) ? 1'b1 : 1'b0;
		case (selector)
		//NOP
		4'b0101: salida = 32'd0;
		//SUMA
		4'b0010: salida = op1 + op2;
		//RESTA
		4'b0110: salida = op1 - op2;
		//DIVISIÓN
		4'b0100: salida = op1 / op2;
		//MULTIPLICACION
		4'b0011: salida = op1 * op2;
		//AND
		4'b0000: salida = op1 & op2;
		//OR
		4'b0001: salida = op1 | op2;
		//SLT
		4'b0111: salida = (op1<op2) ? 32'b1: 32'b0;
		//BEQ
		4'b1000: salida = 32'bx;
		//NOR
		4'b0101: salida = ~(op1 | op2);
		//XOR
		4'b1001: salida = op1 ^ op2;
		//NAND
		4'b1010: salida = ~(op1 & op2);
		endcase
	end
	
endmodule
