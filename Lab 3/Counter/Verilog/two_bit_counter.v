module two_bit_counter(clk, rst, q0, q1);
	input clk, rst;
	output reg q0, q1;
	
	always@(posedge clk) begin
		if (rst == 1) begin
			{q1, q0} <= 2'b00;
		end
		else begin
			case({q1,q0})
				2'b00: {q1,q0} <= 2'b01;
				2'b01: {q1,q0} <= 2'b10;
				2'b10: {q1,q0} <= 2'b11;
				2'b11: {q1,q0} <= 2'b00;
			endcase
		end
	end
	
endmodule 