module register_delay_tb();

  // Parameter
  parameter A = 8; // Address width
  parameter D = 7; // Data width

  //wire&reg
  reg clk;
  reg reset;
  reg count1_enb,
      count2_enb,
      rg_enb
 ;     
  wire [6:0] out;
  wire [7:0] reg_mc;
  wire [6:0] rand_num
 ;
  wire [2:0]  
             b,
             a
 ;

  // DUT module instance
register_delay dut (
                    .data(rand_num),
                    .rst(reset),
                    .clk(clk),
                    .sel_mux(b),
                    .out(out),
                    .sel_reg(a),
                    .reg_mc(reg_mc)
  );

counter_3bit_enable cnt1_tb_register_delay (
    .clk(clk),
    .reset(reset),
    .count_enb(count1_enb),
    .count(a)
  );
counter_3bit_enable cnt2_tb_register_delay (
    .clk(clk),
    .reset(reset),
    .count_enb(count2_enb),
    .count(b)
  );

  random_generator rg_tb_register_delay(
    .clk(clk),
    .enable(rg_enb),
    .rand_num(rand_num)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  //simulation
  initial begin
    reset = 1;
    rg_enb = 1;
    count1_enb = 0;   
    count2_enb = 0;
    #80 reset = 0;
    #80 reset = 1;
        count1_enb = 0;   
        count2_enb = 0;
    #80 count1_enb = 1;   
        count2_enb = 0;
    #10 count1_enb = 1;   
        count2_enb = 1;



    #2000 $finish;
  end




endmodule