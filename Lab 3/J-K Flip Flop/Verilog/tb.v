`timescale 1ns/10ps

`define CLK_PERIOD 10

`define errpp error_count = error_count + 1

module tb();
	reg j, k, clk;
	wire q, q_bar;
	
	integer error_count;
	
	always#(`CLK_PERIOD/2) clk = ~clk;
	
	task check_io;
		input previous, next;
		begin
			if(({j,k} == 2'b00)&&(next != previous)) begin
				$display("@ time %t: q has changed. Not Correct!\n", $time);
				`errpp;
			end
			if(({j,k} == 2'b01)&&(next != 0)) begin
				$display("@ time %t: q is not 0. Not Correct!\n", $time);
				`errpp;
			end
			if(({j,k} == 2'b10)&&(next != 1)) begin
				$display("@ time %t: q is not 1. Not Correct!\n", $time);
				`errpp;
			end
			if(({j,k} == 2'b11)&&(next != ~(previous))) begin
				$display("@ time %t: q has not changed. Not Correct!\n", $time);
				`errpp;
			end
			if(q_bar != ~q) begin
				$display("@ time %t: q_bar Not Correct!\n", $time);
			end
		end
	endtask
	
	task send_random_input_stream;
		reg PREV, NEXT;
		
		begin
			PREV = q;
			{j,k} <= $urandom_range(3,0);
			@(posedge clk);
			#1
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
			$display("Finished running randomized input streams.\n");
		end
	endtask
	
	initial begin
		clk = 1'b0;
		j = 1'b0;
		k = 1'b1;
		error_count = 0;
		send_n_random_input_streams(60);
		$display("Total number of errors: %d\n", error_count);
		$stop;
	end
	
	jk_flip_flop i0(j,k,clk,q,q_bar);
	
endmodule