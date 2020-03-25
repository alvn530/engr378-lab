`timescale 1ns/10ps

`define CLK_PERIOD 10

`define errpp error_count = error_count + 1

module tb();
	reg clk, rst;
	wire [1:0] q;
	
	integer error_count;
	
	always#(`CLK_PERIOD/2) clk <= ~clk;
	
	task rst_counter;
		begin
			@(posedge clk);
			rst <= 1'b1;
			@(posedge clk);
			rst <= 1'b0;
		end
	endtask
	
	task check_io;
		input [1:0] previous, next;
		input RST;
		
		begin
			if((RST == 1) && (next != 2'b00)) begin
				$display("@ time %t: Counter not Reset. Not Correct!", $time);
				`errpp;
			end
			if (RST == 0) begin
				case (previous)
					2'b00: if (next != 2'b01) begin
						$display("@ time %t: Expected 2'b01. Got %d. Not Correct!", $time, next);
						`errpp;
					end
					2'b01: if (next != 2'b10) begin
						$display("@ time %t: Expected 2'b10. Got %d. Not Correct!", $time, next);
						`errpp;
					end
					2'b10: if (next != 2'b11) begin
						$display("@ time %t: Expected 2'b11. Got %d. Not Correct!", $time, next);
						`errpp;
					end
					2'b11: if (next != 2'b00) begin
						$display("@ time %t: Expected 2'b00. Got %d. Not Correct!", $time, next);
						`errpp;
					end
				endcase
			end
		end
	endtask
	
	task send_random_rst_lines;
		reg [1:0] PREV, NEXT;
		reg RST;
		
		begin
			PREV = q;
			RST = $urandom_range(1,0);
			rst <= RST;
			@(posedge clk);
			#1;
			NEXT = q;
			check_io(PREV, NEXT, RST);
		end
	endtask
	
	task send_n_random_rst_lines;
		input integer num_signals;
		begin
			$display("Running %0d randomized rst lines:\n", num_signals);
			repeat(num_signals) begin
				send_random_rst_lines;
			end
			$display("Finished running randomized rst lines.\n");
		end
	endtask
	
	initial begin
		clk <= 1'b0;
		rst <= 1'b0;
		error_count = 0;
		rst_counter;
		send_n_random_rst_lines(60);
		$display("Number of errors: %d", error_count);
		$stop;
	end
	
	two_bit_counter i0(clk, rst, q[0], q[1]);
endmodule			