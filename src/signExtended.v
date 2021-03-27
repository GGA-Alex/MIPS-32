module SignExtended(
	input [15:0]entrada,
	output [31:0]salida
);

assign salida = { {16{entrada[15]}} ,entrada} ; //Se le concatenan 16 bits iguales 
															  //al bit en la posicion [15] y 
															  //despues se le concatena los bits 
															  //de entrada

endmodule