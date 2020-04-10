/*
    This is a testbench template. You still
    need to fill in your top-level instance,
    and call the 'key_press' task. Note that if
    a design with a system clock the testbench
    must have a clock period less than 1/2
    of the PS2_CLK (less than 250000ps).
*/

module tb();

    /*
        PS2 device-model output to be sent
        as an input to your design
    */
	reg PS2_DATA, PS2_CLK;
	
    //Place rest of top-level instance I/O here
    
    /*
        This task is never called directly!
        At each call this task will assert
        both PS2_CLK and PS2_DATA 
        corresponding to the desired data.
    */
    
	task send_packet;
	
		input [7:0] data;
		reg   [3:0] count;
		
		begin
		
		count = 4'b0000;
		PS2_DATA = 1'b1;
		PS2_CLK = 1'b1;
		#500000;
		PS2_DATA = 1'b0;
		
			repeat(8)begin
				
				#500000;
				PS2_CLK = 1'b0;
				#500000;
				PS2_CLK = 1'b1;
				PS2_DATA = data[count];
				count = count+4'b0001;
				
			end
		
		#500000;
		PS2_CLK = 1'b0;
		#500000;
		PS2_CLK = 1'b1;
		PS2_DATA = ~(^data);
		
		#500000;
		PS2_CLK = 1'b0;
		#500000;
		PS2_CLK = 1'b1;
		PS2_DATA = 1'b0;
		
		#500000;
		PS2_CLK = 1'b0;
		#500000;
		PS2_CLK = 1'b1;
		#500000;
		
		end
	
	endtask
	
    /*
    
        This task will be called directly from 
        your test bench and will provide the 
        proper PS2_CLK and PS2_DATA signals.
        
        ex. key_press(8'hE0, 8'h6B); //sends two packets
        ex. key_press(8'h1D, 8'h11); //only sends 8'h1D
        
    */
    
	task key_press;
	
		input [7:0] hex8b_1, hex8b_2;
		
		begin 
		
			if(hex8b_1 == 8'he0) begin
	
                /*
                    If first transmitted data is
                    'E0', then there will be a two
                    packet transmission:
                    
                    pktEO, pkt??, pktF0, pktEO, pkt??
                */
				send_packet(hex8b_1);
				send_packet(hex8b_2);
				send_packet(8'hf0);
				send_packet(hex8b_1);
				send_packet(hex8b_2);
	
			end
			
             /*
                If first transmitted data is not
                'E0', then there will be a single
                packet transmission:

                pkt??, pktF0, pkt??
            */
            
			else begin
			
				send_packet(hex8b_1);
				send_packet(8'hf0);
				send_packet(hex8b_1);
				
			end
			
		end
		
endtask

//Start TB here
    
initial begin
    
    
    
end
    
//Place top-level instance here 
    
endmodule
