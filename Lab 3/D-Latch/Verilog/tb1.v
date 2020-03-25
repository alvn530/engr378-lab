`timescale 1ns/10ps

`define CLK_PERIOD 10

`define ipp i = i + 1
`define errpp error_count = error_count + 1

module tb1();
	reg g, d;
	wire q;
	
	integer error_count;
	
	task check_io;
		input previous, next;
		begin
			if((g == 0)&&(next != previous)) begin
				$display("@ time %t: Not Correct!\n", $time);
				`errpp;
			end
			if((g == 1)&&(next != d)) begin
				$display("@ time %t: Not Correct!\n", $time);
				`errpp;
			end
		end
	endtask
	
	task send_random_input_stream;
		reg PREV, NEXT;
		
		begin
			PREV = q;
			{g, d} <= $urandom_range(3,0);
			#1;
			NEXT = q;
			check_io(PREV, NEXT);
		end
	endtask
	
	task send_n_random_input_streams;
		input integer num_streams;
		
		begin
			$display("Running %0d randomized input streams:\n", num_streams);
			repeat(num_streams) begin
				send_random_input_stream;
			end
		end
	endtask
	
	initial begin
		d = 1'b0;
		g = 1'b1;
		error_count = 0;
		send_n_random_input_streams(20);
		$display("\nError count: %0d", error_count);
		$stop;
	end
	
	d_latch i0(.g(g), .d(d), .q(q));
	
endmodule
