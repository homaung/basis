module memory_data_tb();

  // Inputs
  reg clk;
  reg ce;
  reg we;
  reg [6:0] addr;
  reg [7:0] data;

  // Outputs
  wire [7:0] q;

  // Clock generation
  initial
    clk = 1;
  always #5 clk = ~clk;

  // DUT module instance
  memory_data memory_data_inst(
    .clk(clk),
    .ce(ce),
    .we(we),
    .addr(addr),
    .data(data),
    .q(q)
  );

  // Stimulus
  initial begin
    ce = 1;
    we = 0;
    addr = 7'b0000000;
    data = 8'h24;

    #10;
    ce = 1'b1;
    we = 1'b1;
    addr = 0;
    data = 8'h12;

    #10;
    ce = 1'b1;
    we = 1'b1;
    addr = 7'b0000001;
    data = 8'h34;

    #10;
    ce = 1'b1;
    we = 1'b1;
    addr = 7'b0000010;
    data = 8'h56;

    #10;
    ce = 1'b1;
    we = 1'b1;
    addr = 7'b0000011;
    data = 8'h21;

    #10;
    ce = 1'b1;
    we = 1'b1;
    addr = 7'b0000100;

    #10;
    ce = 1'b1;
    we = 1'b0;
    addr = 7'b0000100;

    #10;
    ce = 1'b1;
    we = 1'b0;
    addr = 7'b0000000;


    #10;
    ce = 1'b1;
    we = 1'b0;
    addr = 7'b0000001;

    #10;
    ce = 1'b1;
    we = 1'b0;
    addr = 7'b0000010;

    #10;
    ce = 1'b1;
    we = 1'b0;
    addr = 7'b0000011;

    #10;
    ce = 1'b1;
    we = 1'b0;
    addr = 7'b0000100;

    $finish;
  end

endmodule