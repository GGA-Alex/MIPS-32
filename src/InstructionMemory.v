module instructionMemory (
	input [31:0] pc_entrada,
   output reg [31:0] instruccion
   );

reg [7:0] mem[700:0];

initial 
begin	
	$readmemb("D:\\intelFPGA_lite\\19.1\\MIPS\\Instrucciones-Ordenamiento-Burbuja.mem",mem);
end
   
always @(*) 
begin

	instruccion <= {mem[pc_entrada],mem[pc_entrada+1],mem[pc_entrada+2],mem[pc_entrada+3]};

end

endmodule 
