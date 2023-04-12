module tlqkf_tb();

    // Inputs
    wire [6:0] data;
    reg [2:0] sel_reg;
    reg clk, reset;

    // Outputs
    wire [6:0] input1;
    wire [6:0] input2;
    wire [6:0] input3;
    wire [6:0] input4;
    wire [6:0] input5;
    wire [6:0] input6;
    wire [6:0] input7;

    reg    rg_enb,
            count_enb
    ;

    // Instantiate the Unit Under Test (UUT)
    tlqkf uut (
        .data(data),
        .sel_reg(sel_reg),
        .clk(clk),
        .input1(input1),
        .input2(input2),
        .input3(input3),
        .input4(input4),
        .input5(input5),
        .input6(input6),
        .input7(input7)
    );

    counter_3bit_enable cnt_tlqkf (
        .clk(clk),
        .reset(reset),
        .count_enb(count_enb),
        .count(sel_reg)
    );

    random_generator rg_tb_tlqkf(
        .clk(clk),
        .enable(rg_enb),
        .rand_num(data)
    );
// Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end


//simulation
initial 
    begin
        reset = 1;
        rg_enb = 1;
        count_enb = 0;   
    #80 reset = 0;
    #80 reset = 1;
        count_enb = 0;   
    #80 count_enb = 1;   


    #2000 $finish;
  end

endmodule