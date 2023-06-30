module circular_convolution(
                            x,
                            y,
                            clk,
                            shift_r,
                            mode_r,
                            reset_r,
                            sel_h,
                            ce_h,
                            reset_h,
                            reset_c,
                            count_enb,
                            count
                            );

input wire [31:0] x    ;
input wire clk         ;

input wire ce_h        ;
input wire reset_h     ;
input wire [1:0] sel_h ;

input wire shift_r ;
input wire mode_r  ;
input wire reset_r ;

input wire reset_c  ;
input wire count_enb ;


//inatance
rcnt utt1_cc(       
             .x(x),
             .y0(x0), .y1(x1),
 .y2(x2), .y3(x3), .y4(x4), .y5(x5), .y6(x6), .y7(x7), .y8(x8), .y9(x9),
             .shift(shift_r),
             .mode(mode_r),
             .clk(clk),
             .reset(reset_r)
);

wire [31:0]  x0, x1, x2, x3, x4, x5, x6, x7, x8 ,x9 ;

counter_Nbit_enable utt4_cc (
                .clk(clk),
                .reset(reset_c),
                .count_enb(count_enb),
                .count(count)
);

h utt2_cc( 
                  .reset(reset_h),
                  .ce(ce_h),
                  .clk(clk),
                  .sel(sel_h),
                  .q0(h0), .q1(h1) , .q2(h2), .q3(h3), .q4(h4), .q5(h5), .q6(h6), .q7(h7), .q8(h8), .q9(h9)
);

wire [31:0]  h0, h1, h2, h3, h4, h5, h6, h7, h8, h9 ;  

cov utt3_cc(    
           .x0(x0), .x1(x1), .x2(x2), .x3(x3), .x4(x4), .x5(x5), .x6(x6), .x7(x7), .x8(x8), .x9(x9),
           .h0(h0), .h1(h1), .h2(h2), .h3(h3), .h4(h4), .h5(h5), .h6(h6), .h7(h7) ,.h8(h8), .h9(h9),
           .y(y)
);

output wire [31:0]  y ;
output wire [7:0]  count ;

endmodule

