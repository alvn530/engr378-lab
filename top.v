//top level MCCC
module top(SW,Hex_0,Hex_1,Hex_7,Out,enable,PB);
input wire [3:0] SW;
//adding another switch to control enable 
input wire [2:0] PB;
output reg [6:0] Hex_7,Hex_1;
output [6:0] Out;
output reg [3:0] Hex_0;
input enable;


always @(*) 
begin
if (enable==1) begin 

case(PB)
3'b110: begin
Hex_7 <= 7'b0001011;
Hex_1 <= 7'b1111111;
Hex_0 = SW;
end


// BCD mode
 3'b101: begin
 Hex_7 <= 7'b0000011;
 if (SW < 10)
 begin
 Hex_0 = SW;
 end
 else
 
 begin
 Hex_1 <= 7'b1111111;
 Hex_0 = 4'h9;
 end
 end

 
 // Decimal mode
3'b011: begin
Hex_7 <= 7'b0100001;
if (SW<10)
begin
Hex_1 <= 7'b1111111;
Hex_0 <= SW;
end
else
begin
Hex_1 <= 7'b1111001;
Hex_0 = SW-4'hA;
end
end
endcase
end
end








bcd_seven i0(.display_on(1'b1),.bcd(SW[3:0]),.seven(Out));
//or .bcd(SW[3:0];
bcd_seven i1(.display_on(1'b0),.bcd(SW[3:0]),.seven(Out));

hex_seven i2(.enable(enable),.binary(SW[3:0]),.seven(Out));
endmodule



