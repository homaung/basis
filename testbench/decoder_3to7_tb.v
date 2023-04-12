module decoder_3to7_tb;

  wire [6:0] out;
  reg clk;
  reg reset;
  reg count_enb;
 wire [2:0] a;
decoder_3to7 dut(.in(a), .out(out));

counter_3bit_enable tb_rom_1_tb (
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