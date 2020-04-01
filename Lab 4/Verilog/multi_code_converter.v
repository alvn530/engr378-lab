module multi_code_converter(switches, buttons, hex_0, hex_1, hex_7);
  input [3:0] switches;
  input [2:0] buttons;
  output [4:0] hex_0;
  output hex_1;
  output [1:0] hex_7;

  always@(*) begin
    if (buttons[0] == 1) begin
      hex_7 = 0;
      hex_1 = 0;
      hex_0 = switches;
    end
    if (buttons[1] == 1) begin
      hex_7 = 1;
      hex_1 = 0;
      if (switches > 4'h9)
        hex_0 = 4'h9;
      else
        hex_0 = switches;
    end
    if (buttons[2] == 1) begin
      hex_7 = 2;
      if (switches > 4'h9) begin
        hex_1 = 1;
        hex_0 = switches - 9;
      end
    end
  end

endmodule
