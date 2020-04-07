module hex_seven (binary, out,enable);
//4 bits input 
input wire[3:0] binary;
//
output wire[7:1] out;

reg [7:1] seven;
//assign reg signal to the hardware signal 
//assign reg signal to the wire type 
assign out=seven;

input wire enable;
//in an always block signal on left hand side of assignment operator 
//must be a reg type to drive the signal
always @(binary)
if(enable==1'b1) begin
//circuit is sensitive to changes in input signals
case (binary)
//evaluating individual binary cases
4'b0000 : seven <= 7'h40;//binary 1000000
4'b0001 : seven <= 7'h79;//binary 1111001
4'b0010 : seven <= 7'h24;
4'b0011 : seven <= 7'h30;
4'b0100 : seven <= 7'h19;
4'b0101 : seven <= 7'h12;
4'b0110 : seven <= 7'h02;
4'b0111 : seven <= 7'h78;
4'b1000 : seven <= 7'h00;
4'b1001 : seven <= 7'h18;
4'b1010 : seven <= 7'h08;
4'b1011 : seven <= 7'h03;
4'b1100 : seven <= 7'h46;
4'b1101 : seven <= 7'h21;
4'b1110 : seven <= 7'h06;
4'b1111 : seven <= 7'h0E;

endcase
end
else
seven= 7'h7F; //111 111 Turns everything off 
endmodule