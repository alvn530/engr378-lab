module dflip(clk,in,out);
  input clk, in;
  output reg out;

  always@(posedge clk)
    out <= in;
endmodule

module eleven(in, out);
  input [3:0] in;
  output out;

  assign out = (in == 4'd11);
endmodule

module reset(in, sel, out);
  input in, sel;
  output out;

  assign out = sel ? 1 : in;
endmodule

module counter(clk, rst, out);
  input clk, rst;
  output reg [3:0] out;

  dflip b0(clk,in,out);
  dflip b0(clk,in,out);
  dflip b0(clk,in,out);
  dflip b0(clk,in,out);
