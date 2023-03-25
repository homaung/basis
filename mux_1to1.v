module mux_1to1(    
                    a,
                    b,
                    sel,
                    out
            
    );

//Parameter
parameter A=1;   



//wire&reg
input wire [A-1:0] a;
input wire [A-1:0] b;
input wire sel;
output reg [A-1:0] out;



//logic
always @ (sel)
   begin
      if(sel)
         out<=a;
      else             
         out<=b;
   end        
  
endmodule