module bcd_seven (bcd, out,display_on);
//4 bits input 
input wire[3:0] bcd;
//
output wire[7:1] out;

input wire display_on;

reg [7:1] seven;
//assign reg signal to the hardware signal 
//assign reg signal to the wire type 
assign out=seven;

//in an always block signal on left hand side of assignment operator 
//must be a reg type to drive the signal
always @(bcd)
if(display_on==1'b1) begin
//circuit is sensitive to changes in input signals
case (bcd)
//evaluating individual binary cases
4'b0001 : seven <= 7'b0000110 ;
4'b0010 : seven <= 7'b1011011 ;
4'b0011 : seven <= 7'b1001111 ;
4'b0100 : seven <= 7'b1100110 ;
4'b0101 : seven <= 7'b1101101 ;
4'b0110 : seven <= 7'b1111101 ;
4'b0111 : seven <= 7'b0000111 ;
4'b1000 : seven <= 7'b1111111 ;
4'b1001 : seven <= 7'b1101111 ;
default : seven <= 7'b0000000 ;
endcase
end
else if (display_on==1'b0) begin
seven <= 7'b0111111;
end
endmodule
