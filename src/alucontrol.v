module aluControl(
	input [3:0] ALUop,
	input [5:0]in,
	output reg[3:0]out
);
always@(*)
begin
	if (ALUop == 4'b0010)begin
		case (in)
		// SUMA
		6'b 100000: out = 4'b 0010;
		// RESTA
		6'b 100010: out = 4'b 0110;
		// MULTIPLICACION
		6'b 000010: out = 4'b 0011;
		// DIVISION
		6'b 011010: out = 4'b 0100;
		//AND
		6'b 100100: out = 4'b 0000;
		//OR
		6'b 100101: out = 4'b 0001;
		//Slt
		6'b 101010: out = 4'b 0111;
		//NOP
		6'b 000000: out = 4'b 0101;
		//NOR
		6'b 100111: out = 4'b 0101;
		//XOR
		6'b 100110: out = 4'b 1001;
		//NAND
		6'b 101100: out = 4'b 1010;
		endcase
	end
	
	if(ALUop == 4'd3)begin
		//Addi
		out = 4'b 0010;
		end
	if(ALUop == 4'd4)begin
		//Andi
		out = 4'b 0000;
		end
	if(ALUop == 4'd5)begin
		//Ori
		out = 4'b 0001;
		end
	if(ALUop == 4'd6) begin
		//Slti
		out = 4'b 0111;
		end
	if(ALUop == 4'd7)begin
		//xori
		out = 4'b 1001;
		end
	if(ALUop == 4'd8)begin
		//multi
		out = 4'b 0011;
		end
	if(ALUop == 4'd9)begin
		//subi
		out = 4'b 0110;
		end	
	if(ALUop == 4'b0000) begin
	   //Sw y Lw
		out = 4'b0010;
	end
	
	if(ALUop == 4'b0001) begin
		//BEQ
		out = 4'b 1000;
	end
	
end
	


endmodule 