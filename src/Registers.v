module Registers(
	input [4:0]adress1,
	input [4:0]adress2,
	input [31:0]data_write,
	input [4:0]address_write,
	input Regwrite,
	output reg [31:0]data_read1,
	output reg [31:0]data_read2
);

reg [31:0]registro[0:31];

initial
begin
	$readmemb("D:\\intelFPGA_lite\\19.1\\MIPS\\BR-Ordenamiento-Burbuja.mem", registro);
end


always@(*)
begin
	
	if (Regwrite == 1'b1) begin
		registro[address_write] <= data_write;
	end
	
	data_read1 <= registro[adress1];
	data_read2 <= registro[adress2];
	
end 

endmodule 
