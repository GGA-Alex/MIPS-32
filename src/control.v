module control(
	input [5:0] Opcode,
	output reg [1:0] EX,
	output reg [2:0]M,
	output reg [2:0]WB,
	output reg [3:0] ALUop
);

always@(*)
begin
	case(Opcode)
		//JUMP
		6'b000010: begin
			EX = 2'b00;
			M = 3'b000;
			WB = 3'b100; 
			ALUop = 4'b0000;
			
		end
		//Instruccion formato R
		6'b000000: begin
			EX = 2'b01;     //EX = [ALUSRC,RegDest]
			M  = 3'b000;    //M =  [BRANCH,MEMWRITE,MEMREAD]
			WB = 3'b010;     //WB = [JUMP,REGWRITE,MEMREG]
			ALUop = 4'b0010;
		end
		//Addi
		6'b001000: begin
			EX = 2'b10;
			M = 3'b000;
			WB = 3'b010;
			ALUop = 4'd3;
		end
		//Andi
		6'b001100: begin
			EX = 2'b10;
			M = 3'b000;
			WB = 3'b010;
			ALUop = 4'd4;
		end
		//Ori
		6'b001101: begin
			EX = 2'b10;
			M = 3'b000;
			WB = 3'b010;
			ALUop = 4'd5;
		end
		//Slti
		6'b001010: begin
			EX = 2'b10;
			M = 3'b000;
			WB = 3'b010;
			ALUop = 4'd6;
		end
		//XORi
		6'b001110: begin
			EX = 2'b10;
			M = 3'b000;
			WB = 3'b010;
			ALUop = 4'd7;
		end
		//Multi
		6'b101010: begin
			EX = 2'b10;
			M = 3'b000;
			WB = 3'b010;
			ALUop = 4'd8;
		end
		//subbi
		6'b101111: begin
			EX = 2'b10;
			M = 3'b000;
			WB = 3'b010;
			ALUop = 4'd9;
		end
		//lw
		6'b110001: begin
			EX = 2'b10;
			M  = 3'b001;
			WB = 3'b011;
			ALUop = 4'b0000;
		end
		//sw
		6'b101011: begin
			EX = 2'b10;
			M  = 3'b010;
			WB = 3'b000;
			ALUop = 4'b0000;
		end
		//beq
		6'b000100: begin
			EX = 2'b0x;
			M  = 3'b100;
			WB = 3'b00x;
			ALUop = 4'b0001;
		end
	endcase
end
endmodule