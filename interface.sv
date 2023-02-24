
`ifndef __TYPES__
`define __TYPES__

interface Memory_ports;

	bit  clock;
	logic  enable;
	logic  reset;
	logic  [31:0] data_in;
	logic  [3:0]  address;
	logic  [31:0] data_out;

endinterface

class Transaction;

	bit  clock;
	logic  enable;
	logic  reset;
	logic  [31:0] data_in;
	logic  [3:0]  address;
	logic  [31:0] data_out;

	function void print(string name = "");
		$display("T=%0t | %s | address=0x%h | data_in = 0x%h | data_out = 0x%h | reset=%d | enable=%d",
					$time, name, address, data_in, data_out, reset, enable); 
	endfunction
endclass

`endif
