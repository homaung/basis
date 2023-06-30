`timescale 1ns / 1ps

module tb_ringcount_();

  reg clk;
  reg reset;
  reg shift;
  reg mode;
  reg reset_cnt;
  reg count_enb;
  wire [31:0] a;
  wire [31:0] y0,y1,y2,y3,y4,y5,y6,y7,y8,y9;
  
counter_Nbit_enable tb_ringcounter_cnt1 (
    .clk(clk),
    .reset(reset_cnt),
    .count_enb(count_enb),
    .count(a)
  );
  
  
rcnt tb_ringcounter(     
    .x(a),
    .y0(y0),
    .y1(y1),
    .y2(y2),
    .y3(y3),
    .y4(y4),
    .y5(y5),
    .y6(y6),
    .y7(y7),
    .y8(y8),
    .y9(y9),
    .shift(shift),
    .mode(mode),
    .clk(clk),
    .reset(reset)     
);

  // Clock generation
  initial begin
    clk = 1;
    forever #5 clk = ~clk;
  end
  
   // Reset assertion
initial 
    begin
          reset     = 1 ;
          shift     = 0 ;
          mode      = 0 ;
          reset_cnt = 1 ;
          count_enb = 0 ;
    #20   reset     = 0 ;
          reset_cnt = 0 ; 
    #20   reset     = 1 ;
          shift     = 1 ;
          reset_cnt = 1 ;
          count_enb = 1 ;
    #2560 mode      = 1 ;   
    #1280 reset     = 0 ;
          shift     = 0 ;
          mode      = 0 ;
    #10   reset     = 1 ;
          shift     = 1 ;
          mode      = 0 ;
    #2560 mode      = 1 ;           
    #1280 $finish;
end
 
    
endmodule