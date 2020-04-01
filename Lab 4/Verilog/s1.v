`define OFF 7'b1111111
`define ON 7'b1111001

module s1(enable, seg_out);
  input enable;
  output [6:0] seg_out;

  always@(*) begin
    seg_out = (enable) ? (`ON) : (`OFF);
  end

endmodule
