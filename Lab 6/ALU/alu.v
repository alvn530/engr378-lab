module alu(ina, inb, aluctrl, aluout, zero);
  input [31:0] ina, inb;
  input [2:0] aluctrl;
  output [31:0] aluout;
  output zero;

  wire [31:0] tempout;

  always@(*) begin
    case(aluctrl)
      3'b000: tempout = ina && inb;
      3'b001: tempout = ina || inb;
      3'b010: tempout = ina + inb;
      3'b110: tempout = ina + ((~inb)+32'b1);
      3'b111: tempout = ina < inb;
      default: tempout = 32'hxxxxxxxx
    endcase
  end

  assign aluout = tempout;
  assign zero = (tempout == 32'd0);
endmodule
