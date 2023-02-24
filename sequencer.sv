
`ifndef __SEQ__
`define __SEQ__

`include "interface.sv"

class Sequencer;

	Transaction item;
	mailbox mbox;
	int i;

	function new();
		item = new();
		mbox = new();
	endfunction

	task reset_address(bit [3:0] address);
		item.reset = 1'b0;
		item.address = address;
		mbox.put(item);

		#5;
		item.reset = 1'b1;
		mbox.put(item);
	endtask

	task write_data(bit [3:0] address, integer data);
		item.data_in = data;
		item.address = address;
		item.enable  = 1'b1;
		mbox.put(item);

		#5;
		item.enable = 1'b0;
		mbox.put(item);
	endtask

	task run();
		// item.clock = 1'b1;
		item.reset = 1'b1;
		item.enable = 1'b0;
		item.address = 4'hc;
		item.data_in = 32'hdeadbeaf;
		mbox.put(item);

		fork
			#10 reset_address(4'hc);
			#70 write_data(4'hc, 32'habcddbca);
		join
	endtask
endclass

`endif
