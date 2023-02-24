
`ifndef __MONITOR__
`define __MONITOR__

class Monitor;

	virtual Memory_ports vif;

	function new ();
	endfunction

	task run();
		forever begin 
		@(posedge vif.clock);
			$display("T=%0t | Monitor | address=0x%h | data_in = 0x%h | data_out = 0x%h | reset=%d | enable=%d",
					$time, vif.address, vif.data_in, vif.data_out, vif.reset, vif.enable); 
		end
	endtask

endclass

`endif
