module tb_circular_convolution;

  wire [6:0] out;
  reg clk;
  reg reset;
  reg count_enb;
 wire [2:0] a;
circular_convolution circular_convolution ();

counter_Nbit_enable tb_circular_convolution_tb (
    .clk(clk),
    .reset(reset),
    .count_enb(count_enb),
    .count(a)
  );
  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
    // Reset assertion
  initial begin
    reset = 1;
    count_enb = 1;   
    #80 reset = 0;
    #80 reset = 1;
    #2000 $finish;
  end



endmodule