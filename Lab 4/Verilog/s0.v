`define ZERO 7'b0000001
`define ONE 7'b1111001
`define TWO 7'b0101001
`define THREE 7'b0110000
`define FOUR 7'b0011001
`define FIVE 7'b0010010
`define SIX 7'b0000011
`define SEVEN 7'b1111000
`define EIGHT 7'b0000000
`define NINE 7'b0011000
`define HEXA 7'b0001000
`define HEXB 7'b1111100
`define HEXC 7'b1000110
`define HEXD 7'b0100001
`define HEXE 7'b0000110
`define HEXF 7'b0001110

module s0(hex_in, seg_out);
  input [3:0] hex_in;
  output [6:0] seg_out;

  always@(*) begin
    case (hex_in)
      4'h0: seg_out = `ZERO;
      4'h1: seg_out = `ONE;
      4'h2: seg_out = `TWO;
      4'h3: seg_out = `THREE;
      4'h4: seg_out = `FOUR;
      4'h5: seg_out = `FIVE;
      4'h6: seg_out = `SIX;
      4'h7: seg_out = `SEVEN;
      4'h8: seg_out = `EIGHT;
      4'h9: seg_out = `NINE;
      4'ha: seg_out = `HEXA;
      4'hb: seg_out = `HEXB;
      4'hc: seg_out = `HEXC;
      4'hd: seg_out = `HEXD;
      4'he: seg_out = `HEXE;
      4'hf: seg_out = `HEXF;
    endcase
  end

endmodule
