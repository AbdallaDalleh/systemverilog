
`ifndef __DESIGN__
`define __DESIGN__

module Memory(Memory_ports ports);

	reg [31:0] data;
	reg [31:0] memory[15:0];
	
	always @(posedge ports.clock) begin
		if(~ports.reset)
			memory[ports.address] <= 32'b0;
		else if(ports.enable)
			memory[ports.address] <= ports.data_in;
		
		data <= memory[ports.address];
	end

	assign ports.data_out = data;


endmodule

`endif
