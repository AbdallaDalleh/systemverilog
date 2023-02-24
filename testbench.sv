
`include "interface.sv"
`include "driver.sv"
`include "sequencer.sv"
`include "monitor.sv"

class Environment;

	Driver drv;
	Sequencer seq;
	Monitor mon;

	mailbox mbox;

	function new ();
		drv = new();
		seq = new();
		mon = new();
		mbox = new();
	endfunction

	virtual task run();
		drv.mbox = mbox;
		seq.mbox = mbox;
		fork
			drv.run();
			mon.run();
			seq.run();
		join_any
	endtask
endclass

module top;

	Memory_ports ports();
	Memory MEM1 (.ports(ports));

	Environment env;

	initial begin
		ports.clock = 1'b0;
		env = new();
		env.drv.vif = ports;
		env.mon.vif = ports;
		env.run();
	end

	always
		#10 ports.clock <= ~ports.clock;

	initial
		#200 $stop;
endmodule
