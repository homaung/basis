module mux_1toD(
                  a,
                  b,
                  sel,
                  out
);

//Parameter
parameter D=1 ;    //   D : Data width 



//wire&reg
input wire [D-1:0] a;
input wire [D-1:0] b;
input wire sel;
output reg [D-1:0] out;



//logic
always @ (sel)
   begin
      if(sel)
         out<=a;
      else             
         out<=b;
   end        
  
endmodule
