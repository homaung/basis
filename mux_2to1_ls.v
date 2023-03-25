module mux_2to1_ls( 
                    a1X,
                    a00,
                    a01,
                    sel,
                    c

    );
input wire   a1X,
                    a00,
                    a01
 ;
wire  b
;
 
input wire [1:0] sel   
;
output wire c
;
wire sel1,
     sel2
;
assign sel1 = sel[1];
assign sel2 = sel[0];  
    
//instance
mux_1to1 mux_1to8_2to8_ls_1   (
                                .a(a01),
                              .b(a00),
                              .sel(sel[0]),
                             .out(b)
            
    );
    
mux_1to1 mux_1to8_2to8_ls_2   (
                                .a(a1X),
                              .b(b),
                              .sel(sel[1]),
                              .out(c)
             
    );
endmodule