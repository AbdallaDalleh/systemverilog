
`ifndef __DRIVER__
`define __DRIVER__

`include "interface.sv"

class Driver;

	virtual Memory_ports vif;
	mailbox mbox;

	function new ();
		mbox = new();
	endfunction

	virtual task run();
		forever begin
			Transaction item;
			mbox.get(item);
			vif.reset   <= item.reset;
			vif.enable  <= item.enable;
			vif.address <= item.address;
			vif.data_in <= item.data_in;
		end
	endtask

endclass

`endif
