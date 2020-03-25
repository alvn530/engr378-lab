module d_latch(g, d, q);
	input g, d;
	output reg q;
	
	always@(g or d) begin
		if (g == 1) begin
			q = d;
		end
	end
		
endmodule
