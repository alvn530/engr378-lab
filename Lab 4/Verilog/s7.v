`define HEX 7'b0001011
`define BCD 7'b1111100
`define DEC 7'd1011110

module s7(mode_in, seg_out);
  input [1:0] mode_in;
  output [6:0] seg_out;

  always@(*) begin
    seg_out = (mode_in[1]) ? (`DEC) : ((mode_in[0]) ? (`BCD) : (`HEX))
  end

endmodule
