module random_generator_tb;

  reg clk;
  reg enable;
  wire [7:0] rand_num;

  random_generator dut(
    .clk(clk),
    .enable(enable),
    .rand_num(rand_num)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  //simulation
  initial begin

    enable = 1;   
    #80 enable = 0;
    #80 enable = 1;
    #80 enable = 0;
    #80 enable = 1;
    #2000 $finish;
  end

endmodule