module dataMemory(

	input	[31:0]addr,           // Memory Address
   input [31:0]write_data,		 // Memory Address Contents
   input	memwrite, memread,
	output reg  [31:0]read_data // Output of Memory Address Contents

	);

reg [31:0]memory[0:31];  

always@(*)
begin
	if(memread==1) //LW
        read_data=memory[addr];

	if(memwrite==1) //SW
        memory[addr]<=write_data;

end

endmodule 