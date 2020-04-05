module top(buttons, switches, s7_out, s1_out, s0_out);
  input [3:0] switches;
  input [2:0] buttons;

  output [6:0] s7_out, s1_out, s0_out;

  wire [3:0] hex_0;
  wire hex_1;
  wire [1:0] hex_7;

  multi_code_converter i0(switches, buttons, hex_0, hex_1, hex_7);
  s0 i1(hex_0, s0_out);
  s1 i2(hex_1, s1_out);
  s7 i3(hex_7, s7_out);

endmodule
