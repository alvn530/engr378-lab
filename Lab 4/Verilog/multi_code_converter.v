module multi_code_converter(switches, buttons, hex_out);
  input [3:0] switches;
  input [2:0] buttons;
  output [7:0] hex_out [7:0];

  always@(switches or buttons) begin
    if (buttons[0] == 1) begin
      case(switches)
        4'h0: hex_out[0] = 8'b11111100;
        4'h1: hex_out[0] = 8'b01100000;
        4'h2: hex_out[0] = 8'b11011010;
        4'h3: hex_out[0] = 8'b11110010;
        4'h4: hex_out[0] = 8'b01100110;
        4'h5: hex_out[0] = 8'b10110110;
        4'h6: hex_out[0] = 8'b10111110;
        4'h7: hex_out[0] = 8'b11100000;
        4'h8: hex_out[0] = 8'b11111110;
        4'h9: hex_out[0] = 8'b11110110;
        4'ha: hex_out[0] = 8'b11101110;
        4'hb: hex_out[0] = 8'b00111110;
        4'hc: hex_out[0] = 8'b10011100;
        4'hd: hex_out[0] = 8'b01111010;
        4'he: hex_out[0] = 8'b10011110;
        4'hf: hex_out[0] = 8'b10001110;
      endcase
    end
    if (buttons[1] == 1) begin
      case(switches)
        4'h0: hex_out[0] = 8'b11111100;
        4'h1: hex_out[0] = 8'b01100000;
        4'h2: hex_out[0] = 8'b11011010;
        4'h3: hex_out[0] = 8'b11110010;
        4'h4: hex_out[0] = 8'b01100110;
        4'h5: hex_out[0] = 8'b10110110;
        4'h6: hex_out[0] = 8'b10111110;
        4'h7: hex_out[0] = 8'b11100000;
        4'h8: hex_out[0] = 8'b11111110;
        4'h9: hex_out[0] = 8'b11110110;
        4'ha: hex_out[0] = 8'b11110110;
        4'hb: hex_out[0] = 8'b11110110;
        4'hc: hex_out[0] = 8'b11110110;
        4'hd: hex_out[0] = 8'b11110110;
        4'he: hex_out[0] = 8'b11110110;
        4'hf: hex_out[0] = 8'b11110110;
      endcase
    end
    if (buttons[2] == 1) begin
      case(switches)
        4'h0: hex_out[0] = 8'b11111100;
        4'h1: hex_out[0] = 8'b01100000;
        4'h2: hex_out[0] = 8'b11011010;
        4'h3: hex_out[0] = 8'b11110010;
        4'h4: hex_out[0] = 8'b01100110;
        4'h5: hex_out[0] = 8'b10110110;
        4'h6: hex_out[0] = 8'b10111110;
        4'h7: hex_out[0] = 8'b11100000;
        4'h8: hex_out[0] = 8'b11111110;
        4'h9: hex_out[0] = 8'b11110110;
        4'ha: begin
          hex_out[1] = 8'b11111100;
          hex_out[0] = 8'b01100000;
        end
        4'hb: begin
          hex_out[1] = 8'b11111100;
          hex_out[0] = 8'b11111100;
        end
        4'hc: begin
          hex_out[1] = 8'b11111100;
          hex_out[0] = 8'b11011010;
        end
        4'hd: begin
          hex_out[1] = 8'b11111100;
          hex_out[0] = 8'b11110010;
        end
        4'he: begin
          hex_out[1] = 8'b11111100;
          hex_out[0] = 8'b01100110;
        end
        4'hf: begin
          hex_out[1] = 8'b11111100;
          hex_out[0] = 8'b10110110;
        end
      endcase
    end
  end
endmodule
