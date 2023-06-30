`timescale 1ns / 1ps

module rcnt( x,
             y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,
             shift,
             mode,
             clk,
             reset
            
);

input wire [31:0] x;
output wire [31:0] y0,y1,y2,y3,y4,y5,y6,y7,y8,y9 ;
input wire shift;
input wire mode;
input wire clk;
input wire reset;
reg [31:0] ps [0:255];
reg [31:0] ns [0:255];
integer i;

always @ (posedge clk, negedge reset)
begin
    if (!reset)
         for (i = 0; i < 256; i = i + 1) 
            begin
                ps[i] <= 0;
            end
    else
        for (i = 0; i < 256; i = i + 1) 
            begin
                ps[i] <= ns[i];
            end
end
always @ *
begin
    if(!shift)
        begin
        	for(i=0; i<256; i = i + 1)
			    begin
			        ns[i] <= ps[i];
			    end
        end
     else
          begin
                if(!mode)
                     begin
                         ns[0] <= x;
                         for( i=0; i<255; i = i + 1 )
				            begin
					            ns[i+1] <= ps[i];
				             end
                     end
                else
                    begin
                         ns[0] <= ps[254];
			             ns[1] <= ps[255];
			             for( i=0; i<254; i = i + 1 )
                             begin
					               ns[i+2] <= ps[i];
	                         end
                    end
                
           end     
end

assign y0 = ps[0];
assign y1 = ps[1];
assign y2 = ps[2];
assign y3 = ps[3];
assign y4 = ps[4];
assign y5 = ps[5];
assign y6 = ps[6];
assign y7 = ps[7];
assign y8 = ps[8];
assign y9 = ps[9];


endmodule


