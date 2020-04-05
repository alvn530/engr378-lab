module multi_code_converter(switches, buttons, hex_0, hex_1, hex_7);
  input [3:0] switches;
  input [2:0] buttons;
  output reg [3:0] hex_0;
  output reg hex_1;
  output reg [1:0] hex_7;

  always@(*) begin
    if (buttons[0] == 4'h1) begin
      hex_7 <= 4'h0;
      hex_1 <= 4'h0;
      hex_0 <= switches;
    end
    if (buttons[1] == 4'h1) begin
      hex_7 <= 4'h1;
      hex_1 <= 4'h0;
      if (switches > 4'h9)
        hex_0 <= 4'h9;
      else
        hex_0 <= switches;
    end
    if (buttons[2] == 4'h1) begin
      hex_7 <= 2;
      if (switches > 4'h9) begin
        hex_1 <= 4'h1;
        hex_0 <= switches - 4'h9;
      end
    end
  end

endmodule
